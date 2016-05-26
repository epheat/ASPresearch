% Simple Gringo Syntax
% evan_h

:setlocal foldmethod=marker

Range Operator:
{{{

for example,
node(1..6).

./gringo -t ./presentationSource/range_operator.lp

---------------------------------------------------

for example,
p(1).
p(3).
a(X) :- p(X), X=1..4.

./gringo -t ./presentationSource/range_operator2.lp

}}}

Expander Operator:		
{{{

for example,
color(red).
color(blue).
color(yellow).
color(1,C) : color(C).

./gringo -t ./presentationSource/expander_operator.lp

}}}	

Conjunctor Operator:
{{{

for example,
peg(a;b;c).

./gringo -t ./presentationSource/conjunctor_operator.lp

---------------------------------------------------

for example,
edge(1,(2;4;5)).

./gringo -t ./presentationSource/conjunctor_operator2.lp

---------------------------------------------------

Conjunctor Operator In Head Of Rule:
{q(1..3,1..3)} == 4.
p(X;Y) :- q(X,Y).
-p(2).

#show q/2.

./gringo -t ./presentationSource/conjunctor_operator3.lp
./clingo ./presentationSource/conjunctor_operator3.lp

p(X;Y) :- q(X,Y).
p(X) :- q(X,Y).
p(Y) :- q(X,Y).

---------------------------------------------------

Conjunctor Operator In Body Of Rule:
{guess(1..9)} == 1.
:- guess(2;3;5;7).

./gringo -t ./presentationSource/conjunctor_operator4.lp
./clingo 0 ./presentationSource/conjunctor_operator4.lp

---------------------------------------------------

c(0;1) :- b(X).
{b(fee;fi;fo;fum)} == 1.

./gringo --text ./presentationSource/conjunctor_operator5.lp

}}}

Running Notes:
{{{

Help:
./gringo -h
./gringo --help

Version:
./gringo -v
./gringo --version

Verbose:
./clingo -V graph_color.lp
./clingo --verbose graph_color.lp

Statistics:
./clingo -s graph_color.lp
./clingo --stats graph_color.lp

Constant Editing:
./clingo -c size=3 latinsquare.lp
./clingo --const n=2 sudoku.lp

Human Readable Format:
./gringo -tc size=2 latinsquare.lp
./gringo --text graph_color.lp

Compute More Stable Models:
./clingo 0 graph_color.lp
./clingo 5 -c size=4 latinsquare.lp

}}}

% Sources
% http://vim.wikia.com/wiki/Folding
% https://www.cs.utexas.edu/users/vl/teaching/378/AG-378.pdf
% http://cs.swan.ac.uk/~csoliver/ok-sat-library/OKplatform/ExternalSources/sources/SAT/Potassco/GringoManual.pdf
% https://www.sudokuoftheday.com/dailypuzzles/solution/?puzzle=73B49F8AEE6DA3HGI2H197B5F3DD95CFABG8AG82E93DF3BFHDG95AF5G9H412C2DAF7CE8IIH3E12D67&did=79660
