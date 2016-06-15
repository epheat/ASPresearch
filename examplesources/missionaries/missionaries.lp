% missionaries.lp
% evan_h - epheat
% solution to the missionaries and cannibals problem
% https://en.wikipedia.org/wiki/Missionaries_and_cannibals_problem

#const moves=11.
#const people=3.

time(T) :- T=1..moves.
index(N) :- N=0..people.

% classic problem instance:
initshore(1, 3, 3).

%*

we have predicates:

	time(T)
		T - time state exists
	
	index(P)
		P - number of people on a shore that exists
	
	initshore(T, M, C)
		T - time state
		M - number of missionaries
		C - number of cannibals

	goalshore(T, M, C)
		T - time state
		M - number of missionaries
		C - number of cannibals

	boatmove(T, F, M, C)
		T - time state
		F - (from) 0 indicates from init to goal, 1 indicates from goal to init
		M - number of missionaries
		C - number of cannibals
*%

% there must be exactly one boat movement in each time state
{ boatmove(T, 0..1, 0..2, 0..2) } == 1 :- time(T).
:- boatmove(T, (T+1)\2, 0..2, 0..2).

% defining a boatmove
{ initshore(T, 0..3, 0..3) } == 1 :- time(T).
{ goalshore(T, 0..3, 0..3) } == 1 :- time(T).

goalshore(T+1, M+MB, C+CB) :- boatmove(T, 0, MB, CB), index(C), index(M).
initshore(T+1, M-MB, C-CB) :- boatmove(T, 0, MB, CB), index(C), index(M).

initshore(T+1, M+MB, C+CB) :- boatmove(T, 1, MB, CB), index(C), index(M).
goalshore(T+1, M-MB, C-CB) :- boatmove(T, 1, MB, CB), index(C), index(M).


% 
:- boatmove(T, 0, MB, CB), initshore(T, M, C), MB > M.
:- boatmove(T, 0, MB, CB), initshore(T, M, C), CB > C.

:- boatmove(T, 1, MB, CB), goalshore(T, M, C), MB > M.
:- boatmove(T, 1, MB, CB), goalshore(T, M, C), CB > C.

% a boatmove moves at least 1 and at most 2 people
:- boatmove(T, T \ 2, MB, CB), MB + CB > 2.
:- boatmove(T, T \ 2, 0, 0).
:- boatmove(T, T \ 2, MB, CB), MB < 0.
:- boatmove(T, T \ 2, MB, CB), CB < 0.

% it must not be the case that there are more cannibals than missionaries on one side of the river, if the number of missionaries is non-zero.
%:- initshore(T, M, C), C > M, M != 0.
%:- goalshore(T, M, C), C > M, M != 0.

% it must not be the case that the goalshore doesn't have all people at the last time state
%:- not goalshore(moves+1, 3, 3).

% #show boatmove/4.
