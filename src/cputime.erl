-module(cputime).
-export([time_test/0]).

time_test() ->
  statistics(runtime),
  statistics(wall_clock),

  main:start(3),
  worker:start(),

  {_,Time} = statistics(runtime),
  {_,Time2} = statistics(wall_clock),

  io:format("Run time ~p Milliseconds: ", [Time]),
  io:format("CPU time ~p Milliseconds: ", [Time2]).