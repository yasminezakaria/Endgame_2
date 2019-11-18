im(1,2,s0).
s(1,1,s0).
s(2,1,s0).
s(2,2,s0).
s(3,3,s0).
t(3,4,s0).
m(5).
n(5).
action(down, 1, 0).
action(up, -1, 0).


action(right, 0, 1).
action(left, 0, -1).


valid_move(X,Y,A):-
    action(A,DX, DY), NX is X + DX, NY is Y + DY, m(I), NX < I, NX>=0, n(J), NY < J, NY>=0.
im(X,Y,result(A,S)):-
    % valid_move(X,Y,a),action(a, DX, DY), NX is X + DX, NY is Y + DY, im(NX, NY, S).
    % valid_move(X,Y,A),
    valid_move(X,Y,A),action(A, DX, DY), NX is X - DX, NY is Y - DY, im(NX, NY, S).
% , call_with_depth_limit(snapped(S), 100, R)
snapped(S):-
    im(X,Y,T),t(X,Y,s0).

/*iterative_deepening(snapped(S), L, R):-
call_with_depth_limit(snapped(S), L, R), \+ (R='depth_limit_exceeded').

iterative_deepening(snapped(S), L, 'depth_limit_exceeded'):-
    N is L+1, call_with_depth_limit(snapped(S), N, R).*/

% The argument R of the call_with_depth limit predicate is bound to depth_limit_exceeded 
% when no solution is found within the specified depth. 
% You need to write a recursive predicate that calls call_with_depth_limit with the limit 1 and then check on R. 
% If R is not depth_limit_exceeded, then you stop the recursion. 
% Otherwise, you increment the limit and call the same predicate again with the new limit.

% TODO:
% 1- add iterative deepening from link in piazza
% 2- add collect
% 3- apply valid move
% 4- edit snap