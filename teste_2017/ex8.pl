:- consult('info.pl').

myfindall(GoalOutput,Goal,_) :-
    Goal,
    assert(tmp(GoalOutput)),
    fail.

myfindall(_,_,[H|T]) :-
    retract(tmp(H)),
    myfindall(_,fail,T).

myfindall(_,_,[]).

sum([],0).

sum([H|T],Total) :-
    sum(T,SubTotal),
    Total is H + SubTotal.

getAges([],[]).

getAges([H|T],[Elem|Others]) :-
    player(_,H,Elem),
    getAges(T,Others).

averageAge(Game,AverageAge) :-
    myfindall(Username,played(Username,Game,_,_),Users),
    getAges(Users,Ages),
    length(Users,Size),
    sum(Ages,Total),
    AverageAge is Total / float(Size),!.
