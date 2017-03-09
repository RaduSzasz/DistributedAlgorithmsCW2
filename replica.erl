%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)
%%% distributed algorithms, n.dulay 27 feb 17
%%% coursework 2, paxos made moderately complex

-module(replica).
-export([start/1]).

start(Database) ->
  receive
    {bind, Leaders} -> next(Leaders, Database, 1, 1, [], maps:new(), maps:new())
  end.

next(Leaders, Database, SlotIn, SlotOut, Requests, Proposals, Decisions) ->
  receive
    {request, C} ->      % request from client
      NewRequests = lists:append(Requests, [C]),
      propose(SlotIn, SlotOut, Leaders, Database, NewRequests, Proposals, Decisions);
    {decision, S, C} ->  % decision from commander
      NewDecisions = maps:put(S, C, Decisions),
      {NewSlotOut, NewProposals, NewRequests} = checkDecisions(SlotOut, Requests, Proposals, NewDecisions, Database),
      propose(SlotIn, NewSlotOut, Leaders, Database, NewRequests, NewProposals, NewDecisions)
  end.

checkDecisions(SlotOut, Requests, Proposals, Decisions, Database) ->
  case maps:get(SlotOut, Decisions, error) of
    error -> {SlotOut, Proposals, Requests};
    Op ->
      case maps:get(SlotOut, Proposals, error) of
        {_Client, _Cid, _Op} = OtherOp ->
          NewProposals = maps:remove(SlotOut, Proposals),
          if Op /= OtherOp -> checkDecisions(SlotOut, lists:append(Requests, [OtherOp]), NewProposals, Decisions, Database);
             true -> checkDecisions(SlotOut, Requests, NewProposals, Decisions, Database)
          end;
        _ -> ok
      end,
      {perform(Op, Decisions, SlotOut, Database), Proposals, Requests}
  end.


propose(SlotIn, SlotOut, Leaders, Database, [Request | Requests] = AllRequests, Proposals, Decisions) ->
  WINDOW = 5,
  if SlotIn < SlotOut + WINDOW ->
      case maps:is_key(SlotIn, Decisions) of
        true -> ok;
        false -> 
          NewProposals = maps:put(SlotIn, Request, Proposals),
          [Leader ! {propose, SlotIn, Request} || Leader <- Leaders],
          propose(SlotIn + 1, SlotOut, Leaders, Database, Requests, NewProposals, Decisions)
      end,
      propose(SlotIn + 1, SlotOut, Leaders, Database, AllRequests, Proposals, Decisions);
    true -> next(SlotIn, SlotOut, Leaders, Database, AllRequests, Proposals, Decisions)
  end;
propose(SlotIn, SlotOut, Leaders, Database, [], Proposals, Decisions) ->
  next(Leaders, Database, SlotIn, SlotOut, [], Proposals, Decisions).
   
perform({Client, Cid, Op} = Command, Decisions, SlotOut, Database) ->
  IdenticalCommands = [{DSlot, DCommand} || {DSlot, DCommand} <- maps:to_list(Decisions), DSlot < SlotOut, DCommand == Command],
  if length(IdenticalCommands) == 0 ->
      Database ! {execute, Op},
      Client ! {response, Cid, ok};
     true -> ok
  end,
  SlotOut + 1.

