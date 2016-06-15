#const moves = 11.
#const people = 3.
index(P) :- P=0..people.
time(T) :- T=0..moves.

{ boatmove(T, 0..1, 0..2, 0..2) } == 1 :- time(T).
