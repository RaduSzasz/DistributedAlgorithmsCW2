%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(commander).
-export([start/4]).

start(Leader, Acceptors, Replicas, Proposal) ->
  [Acceptor ! {p2a, self(), Proposal} || Acceptor <- Acceptors],
  next(Leader, Acceptors, Acceptors, Replicas, Proposal).

next(Leader, Acceptors, WaitFor, Replicas, {Ballot, Slot, _} = Proposal) ->
  receive
    {p2b, Acceptor, Ballot} ->
      NewWaitFor = lists:delete(WaitFor, Acceptor),
      if length(NewWaitFor) < length(Acceptors) / 2 ->
           [Replica ! {decision, Slot, Proposal} || Replica <- Replicas];
         true -> next(Leader, Acceptors, NewWaitFor, Replicas, Proposal)
      end;
    {p2b, _, OtherBallot} -> Leader ! {preempted, OtherBallot}
  end.
