:- include("./KB.pl").
#:- use_module(library(clpfd)).
#dinner(L):-
#    L=[GP,P,CH],
#    GP in 1..6,
#    P in 1..10,
#    CH in 1..40,
#    20 #= GP + P + CH,
#    40 #= (GP*6) + (P*4) + (CH),
#    labeling([],L).