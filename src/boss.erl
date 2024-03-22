-module(boss).
-export([loop/0,randomize/0]).

randomize() ->
  sha256hash:encode(string:concat("kondapalli",binary_to_list(crypto:strong_rand_bytes(16)))).

loop() ->
  Code = string:concat("kondapalli",base64:encode_to_string(crypto:strong_rand_bytes(16))),
  Temp = sha256hash:encode(Code),
  KSubStr= string:substr(Temp,1,5),
  DuplicateZero = lists:concat(lists:duplicate(5, "0")),
  if
    KSubStr == DuplicateZero ->
      io:format("Input String :  ~s\n",[Code]),
      io:format("SHA256 HashCode :  ~s\n",[Temp]),
      loop();
    true ->
      loop()
  end.