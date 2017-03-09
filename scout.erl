%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(scout).
-export([start/3]).

start(Leader, Acceptors, Ballot) ->
  [Acceptor ! {p1a, self(), Ballot} || Acceptor <- Acceptors],
  next(Leader, Acceptors, sets:from_list(Acceptors), Ballot, sets:new()).

%%% We wanted to make WaitFor be a set to allow for more efficient deletion
next(Leader, Acceptors, WaitFor, Ballot, PVals) ->
  receive
    {p1b, Acceptor, Ballot, Accepted} ->
      NewWaitFor = sets:del_element(Acceptor, WaitFor),
      NewPVals = sets:union(PVals, Accepted),
      case sets:size(NewWaitFor) < length(Acceptors) / 2 of
        true -> Leader ! {adopted, Ballot, NewPVals};
        false -> next(Leader, Acceptors, NewWaitFor, Ballot, NewPVals)
      end;
    {p1b, _, OtherBallot, _} -> Leader ! {preempted, OtherBallot}
  end.
