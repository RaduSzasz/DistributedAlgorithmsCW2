%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)

-module(commander).
-export([start/4]).

start(Leader, Acceptors, Replicas, Proposal) ->
  % Firstly send the proposer to all the acceptors
  [Acceptor ! {p2a, self(), Proposal} || Acceptor <- Acceptors],
  next(Leader, Acceptors, sets:from_list(Acceptors), Replicas, Proposal).

% And then wait for replies
next(Leader, Acceptors, WaitFor, Replicas, {Ballot, Slot, Command} = Proposal) ->
  receive
    {p2b, Acceptor, B} when Ballot == B -> % Reply for current ballot
      NewWaitFor = sets:del_element(Acceptor, WaitFor),
      case sets:size(NewWaitFor) < length(Acceptors) / 2 of
        true -> [Replica ! {decision, Slot, Command} || Replica <- Replicas];
        false -> next(Leader, Acceptors, NewWaitFor, Replicas, Proposal)
      end;
    {p2b, _, OtherBallot} -> Leader ! {preempted, OtherBallot} % Reply for a different ballot
  end.
