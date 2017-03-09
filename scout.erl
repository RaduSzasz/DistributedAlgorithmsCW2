%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(scout).
-export([start/3]).

start(Leader, Acceptors, Ballot) ->
  [Acceptor ! {p1a, self(), Ballot} || Acceptor <- Acceptors],
  next(Leader, Acceptors, Acceptors, Ballot, sets:new()).

next(Leader, Acceptors, WaitFor, Ballot, PVals) ->
  receive
    {p1b, Acceptor, Ballot, Accepted} ->
      NewWaitFor = lists:remove(WaitFor, Acceptor),
      NewPVals = sets:union(PVals, Accepted),
      if length(NewWaitFor) < length(Acceptors) / 2 ->
           Leader ! {adopted, Ballot, NewPVals};
         true -> next(Leader, Acceptors, NewWaitFor, Ballot, NewPVals)
      end;
    {p1b, _, OtherBallot, _} -> Leader ! {preempted, OtherBallot}
  end.
