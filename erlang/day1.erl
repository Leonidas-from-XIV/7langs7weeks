-module(day1).
-export([words/1, ten/1, printerr/1]).

% empty string
words("") -> 0;
% just a space
words([32]) -> 0;
% one character that's not a space
words([_]) -> 1;
% something that starts with space
words([32|Tail]) -> 1 + words(Tail);
% some word
words([_|Tail]) -> words(Tail).

ten(1) -> 1;
ten(N) -> 1 + ten(N-1).

err(success) -> "success";
err({error, Message}) -> string:concat("error: ", Message).

printerr(Anything) -> io:format("~s~n", [err(Anything)]).
