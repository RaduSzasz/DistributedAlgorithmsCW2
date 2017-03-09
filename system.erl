%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)
%%% distributed algorithms, n.dulay 27 feb 17
%%% coursework 2, paxos made moderately complex
%%%
%%%
%%% OUTPUT FOR 5 servers, 3 clients and 10 accounts 
%%%
%%% Transactions 19
%%% 1 |  -2071 | <0.75.0>
%%% 2 |  -1160 | <0.75.0>
%%% 3 |   -945 | <0.75.0>
%%% 4 |      0 | <0.75.0>
%%% 5 |    466 | <0.75.0>
%%% 6 |    941 | <0.75.0>
%%% 7 |  -2322 | <0.75.0>
%%% 8 |   2576 | <0.75.0>
%%% 9 |   1190 | <0.75.0>
%%% 10 |   1325 | <0.75.0>
%%%
%%% Transactions 19
%%% 1 |  -2071 | <0.67.0>
%%% 2 |  -1160 | <0.67.0>
%%% 3 |   -945 | <0.67.0>
%%% 4 |      0 | <0.67.0>
%%% 5 |    466 | <0.67.0>
%%% 6 |    941 | <0.67.0>
%%% 7 |  -2322 | <0.67.0>
%%% 8 |   2576 | <0.67.0>
%%% 9 |   1190 | <0.67.0>
%%% 10 |   1325 | <0.67.0>
%%%
%%% Transactions 19
%%% 1 |  -2071 | <0.59.0>
%%% 2 |  -1160 | <0.59.0>
%%% 3 |   -945 | <0.59.0>
%%% 4 |      0 | <0.59.0>
%%% 5 |    466 | <0.59.0>
%%% 6 |    941 | <0.59.0>
%%% 7 |  -2322 | <0.59.0>
%%% 8 |   2576 | <0.59.0>
%%% 9 |   1190 | <0.59.0>
%%% 10 |   1325 | <0.59.0>
%%%
%%% Transactions 19
%%% 1 |  -2071 | <0.71.0>
%%% 2 |  -1160 | <0.71.0>
%%% 3 |   -945 | <0.71.0>
%%% 4 |      0 | <0.71.0>
%%% 5 |    466 | <0.71.0>
%%% 6 |    941 | <0.71.0>
%%% 7 |  -2322 | <0.71.0>
%%% 8 |   2576 | <0.71.0>
%%% 9 |   1190 | <0.71.0>
%%% 10 |   1325 | <0.71.0>
%%%
%%% Transactions 19
%%% 1 |  -2071 | <0.63.0>
%%% 2 |  -1160 | <0.63.0>
%%% 3 |   -945 | <0.63.0>
%%% 4 |      0 | <0.63.0>
%%% 5 |    466 | <0.63.0>
%%% 6 |    941 | <0.63.0>
%%% 7 |  -2322 | <0.63.0>
%%% 8 |   2576 | <0.63.0>
%%% 9 |   1190 | <0.63.0>
%%% 10 |   1325 | <0.63.0>
%%%
%%% OUTPUT FOR 20 servers, 3 clients, 2 accounts
%%% We chose this test because since we did not implement code
%%% to enforce the liveness properties of our system, having a higher
%%% number of server would eventually cause a phenomenon similar to a livelock.
%%% Each one of the leaders tries to have a majority of the acceptors to
%%% evaluate its ballot, but then the other leaders send a higher valued
%%% ballot and preempt each other.
%%%
%%% No leader ever gets a majority to vote on his proposal.
%%%
%%% Transactions 0
%%% 1 |      0 | <0.74.0>
%%% 2 |      0 | <0.74.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.78.0>
%%% 2 |      0 | <0.78.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.82.0>
%%% 2 |      0 | <0.82.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.110.0>
%%% 2 |      0 | <0.110.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.114.0>
%%% 2 |      0 | <0.114.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.118.0>
%%% 2 |      0 | <0.118.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.122.0>
%%% 2 |      0 | <0.122.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.126.0>
%%% 2 |      0 | <0.126.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.130.0>
%%% 2 |      0 | <0.130.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.134.0>
%%% 2 |      0 | <0.134.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.138.0>
%%% 2 |      0 | <0.138.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.142.0>
%%% 2 |      0 | <0.142.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.146.0>
%%% 2 |      0 | <0.146.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.98.0>
%%% 2 |      0 | <0.98.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.102.0>
%%% 2 |      0 | <0.102.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.150.0>
%%% 2 |      0 | <0.150.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.94.0>
%%% 2 |      0 | <0.94.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.86.0>
%%% 2 |      0 | <0.86.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.90.0>
%%% 2 |      0 | <0.90.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.106.0>
%%% 2 |      0 | <0.106.0>
%%%
%%%
%%% 1 server, 3 clients, 2 accounts
%%%
%%% We chose this test to enforce that the limitation of our system is the
%%% liveness property not being properly enforced. As it can be easily noticed,
%%% the number of transactions recorded is very high.
%%%
%%% Since we only displayed 2 accounts, correctness is easy to verify
%%% in terms of transfers in between accounts (they add up to 0)
%%%
%%% Transactions 1502
%%% 1 |  21146 | <0.55.0>
%%% 2 | -21146 | <0.55.0>

-module(system).
-export([start/0]).

start() ->
  N_servers  = 5,
  N_clients  = 3,
  N_accounts = 10,
  Max_amount = 1000,

  End_after  = 1000,   %  Milli-seconds for Simulation

  _Servers = [ spawn(server, start, [self(), N_accounts, End_after])
    || _ <- lists:seq(1, N_servers) ],

  Components = [ receive {config, R, A, L} -> {R, A, L} end
    || _ <- lists:seq(1, N_servers) ],

  {Replicas, Acceptors, Leaders} = lists:unzip3(Components),

  [ Replica ! {bind, Leaders} || Replica <- Replicas ],
  [ Leader  ! {bind, Acceptors, Replicas} || Leader <- Leaders ],

  _Clients = [ spawn(client, start,
               [Replicas, N_accounts, Max_amount, End_after])
    || _ <- lists:seq(1, N_clients) ],

  done.

