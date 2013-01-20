fuckingreverse([], []).
fuckingreverse([H|T], Y) :- fuckingreverse(T, Trev), append(Trev, [H], Y).

smallest([E], E).
smallest([H1,H2|T], R) :- H2 >= H1, smallest([H1|T], R).
smallest([H1,H2|T], R) :- H2 < H1, smallest([H2|T], R).

splitlist(L, [], L, 0).
splitlist([H|T], [H|A], B, N) :- Nminus1 is N-1, splitlist(T, A, B, Nminus1).

halfhalf(L, A, B) :- length(L, Len), Half is Len//2, splitlist(L, A, B, Half).

merge(A, [], A).
merge([], B, B).
merge([Ha|Ta], [Hb|Tb], R) :- Ha =< Hb, merge(Ta, [Hb|Tb], M), R = [Ha|M].
merge([Ha|Ta], [Hb|Tb], R) :- Ha > Hb, merge(Tb, [Ha|Ta], M), R = [Hb|M].

fuckingsort([], []).
fuckingsort([E], [E]).
fuckingsort([H1, H2], [H1, H2]) :- H1 =< H2.
fuckingsort([H1, H2], [H2, H1]) :- H1 > H2.
fuckingsort(L, R) :- halfhalf(L, A, B), fuckingsort(A, Asort), fuckingsort(B, Bsort), merge(Asort, Bsort, R).
