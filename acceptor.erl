%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(acceptor).
-export([start/0]).

start() ->
  next(bottom, []).

next(CurrBallot, Accepted) ->
  receive
    {p1a, Leader, Ballot} ->
      NewBallotNum = if Ballot > CurrBallot -> Ballot;
                        true -> CurrBallot
                      end,
      Leader ! {p1b, self(), NewBallotNum, Accepted},
      next(NewBallotNum, Accepted);
    {p2a, Leader, {Ballot, _, _} = Proposal} ->
      NewAccepted = if Ballot == CurrBallot -> lists:append(Accepted, [Proposal]);
                       true -> Accepted
                    end,
      Leader ! {p2b, self(), CurrBallot},
      next(CurrBallot, NewAccepted)
  end.

