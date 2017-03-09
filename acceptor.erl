%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(acceptor).
-export([start/0]).

start() ->
  next({-1, ok}, sets:new()).

next(CurrBallot, Accepted) ->
  receive
    {p1a, Leader, Ballot} -> % Leader suggests a ballot
      NewBallot = if Ballot > CurrBallot -> Ballot;
                     true -> CurrBallot
                  end,
      Leader ! {p1b, self(), NewBallot, Accepted},
      next(NewBallot, Accepted);
    {p2a, Leader, {Ballot, _, _} = Proposal} -> % Leader sends a proposal
      NewAccepted = if Ballot == CurrBallot -> sets:add_element(Proposal, Accepted);
                       true -> Accepted
                    end,
      Leader ! {p2b, self(), CurrBallot},
      next(CurrBallot, NewAccepted)
  end.

