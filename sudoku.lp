% evan_h
% sudoku
% problem class/encoding

% generate
% it must not be the case that the same cell is defined more than once
{ cell(1..n*n, I, J) } == 1 :- I = 1..n*n, J = 1..n*n.

% test
% it must not be the case that the same number appears more than once in a column
{ cell(N, I, 1..n*n) } == 1 :- N = 1..n*n, I = 1..n*n.

% it must not be the case that the same number appears more than once in a row
{ cell(N, 1..n*n, J) } == 1 :- N = 1..n*n, J = 1..n*n.

%it must not be the case that the same number appears more than once in a box
{ cell(N, I - 1 + (1..n), J - 1 + (1..n) ) } == 1 :- N = 1..n*n, I =1 + n*(0..(n-1)), J =1 + n*(0..(n-1)).

% display
#show cell/3.
