fuckingreverse([], []).
fuckingreverse([H|T], Y) :- fuckingreverse(T, Trev), append(Trev, [H], Y).

smallest([E], E).
smallest([H1,H2|T], R) :- H2 >= H1, smallest([H1|T], R).
smallest([H1,H2|T], R) :- H2 < H1, smallest([H2|T], R).

