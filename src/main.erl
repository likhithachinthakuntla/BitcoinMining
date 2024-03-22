-module(main).
-export([start/1,server_print/0,talkToClient/2, string_generator/0]).


start(K) ->
  register(print,spawn(main,server_print,[])),
  register(getK,spawn(main, talkToClient,[K,0])),
  register(string_gen, spawn(main, string_generator,[])),
  mine_process(print, K).

talkToClient(K,ID) ->
  receive
    {From} ->
      From ! {K, ID+1},
      talkToClient(K, ID+1)
  end.
string_generator() ->
  receive
    {From} ->
      % generate number of string
      List = generate_string(100,[]),
      From ! {List},
      string_generator()
  end.

generate_string(Count, List) when Count > 0->
  Code = randomizer(),
  generate_string(Count - 1, List ++ [Code]);
generate_string(0, List) ->
  List.

randomizer() ->
  Random_Str = string:concat("kondapalli",
    base64:encode_to_string(crypto:strong_rand_bytes(9))),
  Random_Str.


mine_process(print,K) ->
  Code = randomizer(),
  HashCode = sha256hash:encode(Code),
  KSubStr= string:substr(HashCode,1,K),
  DuplicateZero = lists:concat(lists:duplicate(K, "0")),
  if
    KSubStr == DuplicateZero ->
      print ! {Code, HashCode},
      mine_process(print, K);
    true ->
      mine_process(print, K)
  end.

server_print() ->
  receive
    {Code, HashCode} ->
      io:format("Server Side :  \n"),
      io:format("Input String :  ~s\n",[Code]),
      io:format("SHA256 HashCode :  ~s\n",[HashCode]),
      server_print();
    {ClientID, Code, HashCode} ->
      io:format("Server Side :  ~w\n", [ClientID]),
      io:format("Input String :  ~s\n",[Code]),
      io:format("SHA256 HashCode :  ~s\n",[HashCode]),
      server_print()
  end.