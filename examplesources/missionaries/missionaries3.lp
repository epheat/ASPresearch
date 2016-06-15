% evan_h
% missionaries, attempt #3 (optimizing attempt 2)
% this logic program can solve the missionaries and cannibals puzzle.
% https://en.wikipedia.org/wiki/Missionaries_and_cannibals_problem

%* WE HAVE PREDICATES

shore(T,M,C) : all missionaries and cannibals begin on the shore
	T - time state
	M - missionaries
	C - cannibals

dock(T,M,C) : the goal is to have all missionaries and cannibals on the dock
	T - time state
	M - missionaries
	C - cannibals

move(T,M,C)
	T - time state
	M - missionaries on boat
	C - cannibals on boat

possiblemove(MB,CB)
	MB - missionaries on boat
	CB - cannibals on boat

possiblestate(M,C)
	M - missionaries on a side
	C - cannibals on a side such that there are not more than missionaries
*%


#const moves=11.

% classic start
shore(1,3,3).
dock(1,0,0).

% there is one shore state and one dock state at each time state
{ shore(T,M,C) : possiblestate(M,C) } == 1 :- T=1..moves.
{ dock(T,M,C) : possiblestate(M,C) } == 1 :- T=1..moves.

possiblestate(M,C) :- M=0..3, C=0..3, M>C.
possiblestate(M,C) :- M=0, C=0..3.

% there must be one move made at each time state
{ move(T,M,C) : possiblemove(M,C) } == 1 :- T=1..moves.
possiblemove(MB,CB) :- (MB+CB)<=2, (MB+CB)>=1, MB=0..2, CB=0..2.

% defining what a boat move does
dock(T+1,M+MB,C+CB) :- dock(T,M,C), move(T,MB,CB), T\2=1.
shore(T+1,M-MB,C-CB) :- shore(T,M,C), move(T,MB,CB), T\2=1.

shore(T+1,M+MB,C+CB) :- shore(T,M,C), move(T,MB,CB), T\2=0.
dock(T+1,M-MB,C-CB) :- dock(T,M,C), move(T,MB,CB), T\2=0.

% can't move more people than there are
:- move(T,MB,CB), shore(T,M,C), T\2=1, MB>M.
:- move(T,MB,CB), shore(T,M,C), T\2=1, CB>C.
:- move(T,MB,CB), dock(T,M,C), T\2=0, MB>M.
:- move(T,MB,CB), dock(T,M,C), T\2=0, CB>C.

% there must not be more cannibals than missionaries on either side of the river
:- shore(T, M, C), C>M, M>0.
:- dock(T, M, C), C>M, M>0.

% goal state after the last move
:- not dock(moves+1,3,3).

#show move/3.
