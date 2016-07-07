% evan_h
% 15-puzzle
% 05/12/2016


% we have predicates:
%	move(T, x, y)
%		(x, y)	= coordinates of cell to move
%		T	= Time of move (move number)
%	
%	cell(T, #, x, y)
%		(x,y)	= coordinates of cell
%		#	= number within cell (0 indicates blank cell)
%		T	= Time of cell state (move number)
%
%	goal(#, x, y)
%		(x,y)	= coordinates of cell
%		#	= correct number to have within cell (0 indicates blank cell)
%

% construct the goal state through crazy modulo shenanigans
% 
%	1	2	3	4
%	5	6	7	8
%	9	10	11	12
%	13	14	15	0
goal(X \ (n*n), ((X-1) \ n) + 1, n - ((X-1) / n) ) :- X = 1..(n*n).

% #show goal/3.

% generate
{ move(T, X, Y) : index(X), index(Y) } == 1 :- time(T).
possiblemove(T,X,Y) :- adjacent(X,Y,XX,YY), cell(T,0,XX,YY).

cell(1, N, X, Y) :- init(N, X, Y).


% define
% a cell has the same state in the next time state if it was not affected by the move.
cell(T+1,N,X,Y) :- cell(T,N,X,Y), not affected(T,X,Y), time(T).

% now, to define affected
% either the cell being moved, or the blank cell
affected(T,X,Y) :- move(T,X,Y).
affected(T,X,Y) :- cell(T,0,X,Y).

% a move takes the selected cell and swaps it with the blank cell
cell(T+1,N,X,Y) :- cell(T,0,X,Y), move(T,XX,YY), cell(T,N,XX,YY), time(T).
cell(T+1,0,X,Y) :- move(T,X,Y), time(T).

% test
% it must not be the case that a cell moves when it is not adjacent to the blank cell
:- move(T,X,Y), not possiblemove(T,X,Y).
% adjacent(X,Y,XX,YY) :- |X-XX| + |Y-YY| == 1, index(X), index(Y), index(XX), index(YY).


adjacent(X,Y,X+1,Y) :- index(Y), X=1..(n-1).
adjacent(X,Y,X-1,Y) :- index(Y), X=2..n.
adjacent(X,Y,X,Y+1) :- index(X), Y=1..(n-1).
adjacent(X,Y,X,Y-1) :- index(X), Y=2..n.


% if there is a goal(N,x,y) there must be cell(N,x,y)
correct(T+1,X,Y) :- cell(T+1,N,X,Y), goal(N,X,Y), time(T).
incorrect(T+1) :- not correct(T+1,X,Y), index(X), index(Y), time(T).
correct(T+1) :- not incorrect(T+1), time(T).
:- not correct(moves+1).



#show move/3.

