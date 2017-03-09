%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(leader).
-export([start/0]).

start() ->
  Ballot = {0, self()},

  receive
    {bind, Acceptors, Replicas} ->
      spawn(scout, start, [self(), Acceptors, Ballot]),
      next(Ballot, Acceptors, Replicas, false, maps:new())
  end.

next(Ballot, Acceptors, Replicas, Active, Proposals) ->
  receive
    {propose, Slot, Command} ->
      case maps:is_key(Slot, Proposals) of
        true-> next(Ballot, Acceptors, Replicas, Active, Proposals);
        false ->
          NewProposals = maps:put(Slot, Command, Proposals),
          if Active -> spawn(commander, start, [self(), Acceptors, Replicas, {Ballot, Slot, Command}]);
             true -> ok
          end,
          next(Ballot, Acceptors, Replicas, Active, NewProposals)
      end;
    {adopted, Ballot, PVals} ->
      NewProposals = sets:fold(fun({BallotNum, Slot, Command}, Map) ->
                                               maps:update_with(Slot,
                                                                fun({OldBallot, _} = OldSlot) ->
                                                                    if OldBallot < BallotNum -> {BallotNum, Command};
                                                                       true -> OldSlot
                                                                    end
                                                                end,
                                                                {BallotNum, Command},
                                                                Map)
                                          end, maps:new(), PVals),
      [spawn(commander, start, [self(), Acceptors, Replicas, {Ballot, CurrSlot, CurrCommand}])
          || {CurrSlot, CurrCommand} <- maps:to_list(NewProposals)],
      next(Ballot, Acceptors, Replicas, true, NewProposals);
    {preempted, {BallotRound, _BallotLeader} = AdoptedBallot} when AdoptedBallot > Ballot ->
          NewBallot = {BallotRound + 1, self()},
          spawn(scout, start, [self(), Acceptors, NewBallot]),
          next(NewBallot, Acceptors, Replicas, true, Proposals)
  end.




