%%% Eugenia Kim (ek2213) and Radu-Andrei Szasz (ras114)
%%% distributed algorithms, n.dulay 27 feb 17
%%% coursework 2, paxos made moderately complex
%%%
%%%
%%% OUTPUT FOR 5 servers, 3 clients and 10 accounts 
%%%
%%% Transactions 74
%%% 1 |    894 | <0.75.0>
%%% 2 |    962 | <0.75.0>
%%% 3 |  -2585 | <0.75.0>
%%% 4 |  -1388 | <0.75.0>
%%% 5 |  -1507 | <0.75.0>
%%% 6 |   4311 | <0.75.0>
%%% 7 |   -907 | <0.75.0>
%%% 8 |  -2344 | <0.75.0>
%%% 9 |    654 | <0.75.0>
%%% 10 |   1910 | <0.75.0>
%%%
%%% Transactions 74
%%% 1 |    894 | <0.71.0>
%%% 2 |    962 | <0.71.0>
%%% 3 |  -2585 | <0.71.0>
%%% 4 |  -1388 | <0.71.0>
%%% 5 |  -1507 | <0.71.0>
%%% 6 |   4311 | <0.71.0>
%%% 7 |   -907 | <0.71.0>
%%% 8 |  -2344 | <0.71.0>
%%% 9 |    654 | <0.71.0>
%%% 10 |   1910 | <0.71.0>
%%%
%%% Transactions 74
%%% 1 |    894 | <0.59.0>
%%% 2 |    962 | <0.59.0>
%%% 3 |  -2585 | <0.59.0>
%%% 4 |  -1388 | <0.59.0>
%%% 5 |  -1507 | <0.59.0>
%%% 6 |   4311 | <0.59.0>
%%% 7 |   -907 | <0.59.0>
%%% 8 |  -2344 | <0.59.0>
%%% 9 |    654 | <0.59.0>
%%% 10 |   1910 | <0.59.0>
%%%
%%% Transactions 74
%%% 1 |    894 | <0.67.0>
%%% 2 |    962 | <0.67.0>
%%% 3 |  -2585 | <0.67.0>
%%% 4 |  -1388 | <0.67.0>
%%% 5 |  -1507 | <0.67.0>
%%% 6 |   4311 | <0.67.0>
%%% 7 |   -907 | <0.67.0>
%%% 8 |  -2344 | <0.67.0>
%%% 9 |    654 | <0.67.0>
%%% 10 |   1910 | <0.67.0>
%%%
%%% Transactions 74
%%% 1 |    894 | <0.63.0>
%%% 2 |    962 | <0.63.0>
%%% 3 |  -2585 | <0.63.0>
%%% 4 |  -1388 | <0.63.0>
%%% 5 |  -1507 | <0.63.0>
%%% 6 |   4311 | <0.63.0>
%%% 7 |   -907 | <0.63.0>
%%% 8 |  -2344 | <0.63.0>
%%% 9 |    654 | <0.63.0>
%%% 10 |   1910 | <0.63.0>
%%%
%%% OUTPUT FOR 70 servers, 3 clients, 2 accounts
%%% We chose this test because since we did not implement code
%%% to enforce the liveness properties of our system, having a higher
%%% number of server would eventually cause a phenomenon similar to a livelock.
%%% Each one of the leaders tries to have a majority of the acceptors to
%%% evaluate its ballot, but then the other leaders send a higher valued
%%% ballot and preempt each other.
%%%
%%% No leader ever gets a majority to vote on his proposal.
%%% Transactions 0
%%% 1 |      0 | <0.344.0>
%%% 2 |      0 | <0.344.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.392.0>
%%% 2 |      0 | <0.392.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.124.0>
%%% 2 |      0 | <0.124.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.212.0>
%%% 2 |      0 | <0.212.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.238.0>
%%% 2 |      0 | <0.238.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.288.0>
%%% 2 |      0 | <0.288.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.128.0>
%%% 2 |      0 | <0.128.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.307.0>
%%% 2 |      0 | <0.307.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.136.0>
%%% 2 |      0 | <0.136.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.132.0>
%%% 2 |      0 | <0.132.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.140.0>
%%% 2 |      0 | <0.140.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.148.0>
%%% 2 |      0 | <0.148.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.208.0>
%%% 2 |      0 | <0.208.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.251.0>
%%% 2 |      0 | <0.251.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.154.0>
%%% 2 |      0 | <0.154.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.162.0>
%%% 2 |      0 | <0.162.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.272.0>
%%% 2 |      0 | <0.272.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.170.0>
%%% 2 |      0 | <0.170.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.280.0>
%%% 2 |      0 | <0.280.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.180.0>
%%% 2 |      0 | <0.180.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.160.0>
%%% 2 |      0 | <0.160.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.188.0>
%%% 2 |      0 | <0.188.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.176.0>
%%% 2 |      0 | <0.176.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.196.0>
%%% 2 |      0 | <0.196.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.183.0>
%%% 2 |      0 | <0.183.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.202.0>
%%% 2 |      0 | <0.202.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.189.0>
%%% 2 |      0 | <0.189.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.348.0>
%%% 2 |      0 | <0.348.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.200.0>
%%% 2 |      0 | <0.200.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.234.0>
%%% 2 |      0 | <0.234.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.400.0>
%%% 2 |      0 | <0.400.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.209.0>
%%% 2 |      0 | <0.209.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.246.0>
%%% 2 |      0 | <0.246.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.220.0>
%%% 2 |      0 | <0.220.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.376.0>
%%% 2 |      0 | <0.376.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.260.0>
%%% 2 |      0 | <0.260.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.380.0>
%%% 2 |      0 | <0.380.0>
%%% 
%%% Transactions 0
%%% 1 |      0 | <0.270.0>
%%% 2 |      0 | <0.270.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.384.0>
%%% 2 |      0 | <0.384.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.285.0>
%%% 2 |      0 | <0.285.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.356.0>
%%% 2 |      0 | <0.356.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.261.0>
%%% 2 |      0 | <0.261.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.268.0>
%%% 2 |      0 | <0.268.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.294.0>
%%% 2 |      0 | <0.294.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.298.0>
%%% 2 |      0 | <0.298.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.310.0>
%%% 2 |      0 | <0.310.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.328.0>
%%% 2 |      0 | <0.328.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.332.0>
%%% 2 |      0 | <0.332.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.255.0>
%%% 2 |      0 | <0.255.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.303.0>
%%% 2 |      0 | <0.303.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.318.0>
%%% 2 |      0 | <0.318.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.149.0>
%%% 2 |      0 | <0.149.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.168.0>
%%% 2 |      0 | <0.168.0>
%%% 
%%% Transactions 0
%%% 1 |      0 | <0.225.0>
%%% 2 |      0 | <0.225.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.141.0>
%%% 2 |      0 | <0.141.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.224.0>
%%% 2 |      0 | <0.224.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.232.0>
%%% 2 |      0 | <0.232.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.243.0>
%%% 2 |      0 | <0.243.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.316.0>
%%% 2 |      0 | <0.316.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.364.0>
%%% 2 |      0 | <0.364.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.396.0>
%%% 2 |      0 | <0.396.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.323.0>
%%% 2 |      0 | <0.323.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.368.0>
%%% 2 |      0 | <0.368.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.372.0>
%%% 2 |      0 | <0.372.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.336.0>
%%% 2 |      0 | <0.336.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.340.0>
%%% 2 |      0 | <0.340.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.352.0>
%%% 2 |      0 | <0.352.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.360.0>
%%% 2 |      0 | <0.360.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.284.0>
%%% 2 |      0 | <0.284.0>
%%%
%%% Transactions 0
%%% 1 |      0 | <0.388.0>
%%% 2 |      0 | <0.388.0>
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

