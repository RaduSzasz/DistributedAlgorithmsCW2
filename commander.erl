%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(commander).
-export([start/4]).

start(Leader, Acceptors, Replicas, Proposal) ->
  [Acceptor ! {p2a, self(), Proposal} || Acceptor <- Acceptors],
  next(Leader, Acceptors, sets:from_list(Acceptors), Replicas, Proposal).

next(Leader, Acceptors, WaitFor, Replicas, {Ballot, Slot, Command} = Proposal) ->
  receive
    {p2b, Acceptor, Ballot} ->
      NewWaitFor = sets:del_element(Acceptor, WaitFor),
      case sets:size(NewWaitFor) < length(Acceptors) / 2 of
        true -> [Replica ! {decision, Slot, Command} || Replica <- Replicas];
        false -> next(Leader, Acceptors, NewWaitFor, Replicas, Proposal)
      end;
    {p2b, _, OtherBallot} -> Leader ! {preempted, OtherBallot}
  end.
