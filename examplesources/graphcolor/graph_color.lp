% evan_h
% graph_color.lp

% problem instance
node(1..6).
edge(1,2). edge(1,3). edge(1,4).
edge(2,1). edge(2,3).
edge(3,1). edge(3,2). edge(3,4). edge(3,5).
edge(4,1). edge(4,3). edge(4,5). edge(4,6).
edge(5,3). edge(5,4). edge(5,6).
edge(6,4). edge(6,5).

% make the graph undirected (unnecessary because I defined every edge in both directions)
% there is an edge connecting X to Y if there is an edge connecting Y to X
edge(X,Y) :- edge(Y,X).


color(red).
color(blue).
color(yellow).

% problem class

% generate : each node gets 1 color
% the size of the set { X is colored with C given the color C exists } is equal to one, if there is a node X
{ color(X,C) : color(C) } == 1 :- node(X). 
% test : no adjacent nodes may have the same color
% it must not be the case that
%	1. there is an edge between X and Y
%	2. X has the color C
%	3. Y has the color C 
:- edge(X,Y), color(X,C), color(Y,C).

#show color/2.
