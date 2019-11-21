% Load Knowledge base and lists library
:- include(kb2).
:- use_module(library(lists)).

% Movement actions available definitions
action(left, 0, -1).
action(right, 0, 1).
action(down, 1, 0).
action(up, -1, 0).

% ingrid(X,Y) is true if the given position X,Y is not out of grid borders
ingrid(X,Y):- m(I), X < I, X>=0, n(J), Y < J, Y>=0.

% delMember(X,Y,Z) is true if the given element X is not in the output list Z but in list Y
delMember(X, [], []) :- !.
delMember(X, [X|Xs], Y) :- !, delMember(X, Xs, Y).
delMember(X, [T|Xs], Y) :- !, delMember(X, Xs, Y2), append([T], Y2, Y).

% Successor-state axiom for ironman including all actions except snap
im(X, Y, OLDSTONES, result(A, S)):-
    ingrid(X, Y),
    (action(A, DX, DY), NX is X - DX, NY is Y - DY, im(NX, NY,OLDSTONES,S));
    (COLLECTEDSTONES = [X,Y], A = collect, im(X , Y, [COLLECTEDSTONES|OLDSTONES], S)).

% snap_helper (S) is true if ironman collected all stones and reached Thanos position then snapped
snap_helper(result(snap,S)):-
    t(X,Y),
    im(X,Y,[],S).

% snapped(S) is true if the output of the snap_helper is true after doing iterative deepening
snapped(S):-
    iterative_deepening(snap_helper(S), 16, R).

% iterative_deepening(T, L, R) is true if target predicate T is executed with depth limit L and R not equal to depth_limit_exceeded
iterative_deepening(T, L, R):-
    call_with_depth_limit(T, L, R), (R\='depth_limit_exceeded').
iterative_deepening(T, L, 'depth_limit_exceeded'):-
    N is L+1, iterative_deepening(T, N, R).