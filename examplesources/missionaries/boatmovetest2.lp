#const moves=11.

% classic start
shore(1,3,3).

% there must be one move made at each time state
{ move(T,M,C) : possiblemove(M,C) } == 1 :- T=1..moves.
possiblemove(MB,CB) :- (MB+CB)<=2, (MB+CB)>=1, MB=0..2, CB=0..2.
