% :- [kb1].
:- [kb2].
action(right, 0, 1).
action(left, 0, -1).
action(down, 1, 0).
action(up, -1, 0).

ingrid(X,Y):- m(I), X < I, X>=0, n(J), Y < J, Y>=0.

format([],s0).
format([A|T],result(A,S)):-
    format(T,S).

flatten2([], []) :- !.
flatten2([L|Ls], FlatL) :-
    !,
    flatten2(L, NewL),
    flatten2(Ls, NewLs),
    append(NewL, NewLs, FlatL).
flatten2(L, [L]).

delMember(X, [], []) :- !.
delMember(X, [X|Xs], Y) :- !, delMember(X, Xs, Y).
delMember(X, [T|Xs], Y) :- !, delMember(X, Xs, Y2), append([T], Y2, Y).

snap([[snap|S],[collect|S4],[collect|S3],[collect|S2],[collect|S1]]):-
    im(Q,W,s0),
    s1(X1,Y1,s0), x(X1,Y1,Q,W,S1),
    s2(X2,Y2,s0), x(X2,Y2,X1,Y1,S2),
    s3(X3,Y3,s0), x(X3,Y3,X2,Y2,S3),
    s4(X4,Y4,s0), x(X4,Y4,X3,Y3,S4),
    t(X,Y), x(X,Y,X4,Y4,S).

snapped(S):-
    iterative_deepening(snap(K), 1, R),
    flatten2(K,L),
    delMember(constant,L,M),
    format(M,S).

x(X,Y,X,Y,constant).
x(X,Y,C,B,[T|A]):-
    ingrid(X,Y),
    action(A, DX, DY), NX is X - DX, NY is Y - DY, x(NX, NY, C, B, T).

iterative_deepening(T, L, R):-
    call_with_depth_limit(T, L, R), (R\='depth_limit_exceeded').
iterative_deepening(T, L, 'depth_limit_exceeded'):-
    N is L+1, iterative_deepening(T, N, R).