:- consult('info.pl').

myfindall(GoalOutput,Goal,_) :-
    Goal,
    assert(tmp(GoalOutput)),
    fail.

myfindall(_,_,[H|T]) :-
    retract(tmp(H)),
    myfindall(_,fail,T).

myfindall(_,_,[]).

filterPlayerAge([],_,_,[]).

filterPlayerAge([H|T],MinAge,MaxAge,[Elem|Others]) :-
    H = [Name|[Age]],
    Age >= MinAge,
    Age =< MaxAge,
    Elem = Name,
    filterPlayerAge(T,MinAge,MaxAge,Others).

filterPlayerAge([_|T],MinAge,MaxAge,OutList) :-
    filterPlayerAge(T,MinAge,MaxAge,OutList).

ageRange(MinAge,MaxAge,Players) :-
    myfindall([Name,Age],player(Name,_,Age),PlayersInfo),
    filterPlayerAge(PlayersInfo,MinAge,MaxAge,Players),!.

