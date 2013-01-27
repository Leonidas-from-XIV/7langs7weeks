-module(day2).
-export([value/2, shoppinglist/1]).

% Example = [{erlang, "a functional language"}, {ruby, "an OO language"}].

% 'undefined' because
% http://erlang.org/pipermail/erlang-questions/2010-February/049784.html
value([], _) -> undefined;
value([{K, V}|T], Key) -> case K of
		Key -> V;
		_ -> value(T, Key)
	end.

% Example = [{eggs, 2, 1}, {spam, 1, 5}].

shoppinglist([]) -> [];
shoppinglist(Lst) -> [{Item, Quantity*Price} || {Item, Quantity, Price} <- Lst].
