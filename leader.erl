%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(leader).
-export([start/0]).

start() ->
  Ballot = {0, self()},

  receive
    {bind, Acceptors, Replicas} ->
      spawn(scout, start, [self(), Acceptors, Ballot]), % Scout will try to get acceptors judge our proposals
      next(Ballot, Acceptors, Replicas, false, maps:new())
  end.

next(Ballot, Acceptors, Replicas, Active, Proposals) ->
  receive
    {propose, Slot, Command} -> % A replica proposed a value
      case maps:is_key(Slot, Proposals) of
        true  -> next(Ballot, Acceptors, Replicas, Active, Proposals); % We have already seen this
        false ->
          NewProposals = maps:put(Slot, Command, Proposals),
          if Active -> spawn(commander, start, [self(), Acceptors, Replicas, {Ballot, Slot, Command}]);
             true -> ok % If we are not active, we shouldn't do anything
          end,
          next(Ballot, Acceptors, Replicas, Active, NewProposals)
      end;
    {adopted, Ballot, PVals} -> % We have a majority of acceptors who adopted our ballot
      NewProposalsWithBallots = sets:fold(fun({BallotNum, Slot, Command}, Map) ->
                                             maps:update_with(Slot,
                                                              fun({OldBallot, _} = OldSlot) ->
                                                                  if OldBallot < BallotNum -> {BallotNum, Command};
                                                                     true -> OldSlot
                                                                  end
                                                              end,
                                                              {BallotNum, Command}, Map)
                                          end, maps:new(), PVals),
      NewProposals = maps:merge(Proposals, maps:map(fun(_Key, {_BallotNum, Command}) -> Command end, NewProposalsWithBallots)),

      % Spawn a commander for every proposal that we received;
      [spawn(commander, start, [self(), Acceptors, Replicas, {Ballot, CurrSlot, CurrCommand}])
          || {CurrSlot, CurrCommand} <- maps:to_list(NewProposals)],
      next(Ballot, Acceptors, Replicas, true, NewProposals);
    {preempted, {BallotRound, _BallotLeader} = AdoptedBallot} when AdoptedBallot > Ballot ->
          NewBallot = {BallotRound + 1, self()},
          spawn(scout, start, [self(), Acceptors, NewBallot]),
          next(NewBallot, Acceptors, Replicas, false, Proposals)
  end.




