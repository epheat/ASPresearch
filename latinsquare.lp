% evan_h
% latin square
% problem class/encoding

% generate
% it must not be the case that the same cell is defined more than once
{ cell(1..size, I, J) } == 1 :- I = 1..size, J = 1..size.

% test
% it must not be the case that the same number appears more than once in a column
{ cell(N, I, 1..size) } == 1 :- N = 1..size, I = 1..size.

% it must not be the case that the same number appears more than once in a row
{ cell(N, 1..size, J) } == 1 :- N = 1..size, J = 1..size.

% display
#show cell/3.
