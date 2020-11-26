:- consult('info.pl').

myfindall(GoalOutput,Goal,_) :-
    Goal,
    assert(tmp(GoalOutput)),
    fail.

myfindall(_,_,[H|T]) :-
    retract(tmp(H)),
    myfindall(_,fail,T).

myfindall(_,_,[]).

filterPlayedGames([],[]).

filterPlayedGames([H|T],[Elem|Others]) :-
    H = [Game|[Time]],
    Time < 10,
    Elem = Game,
    filterPlayedGames(T,Others).

filterPlayedGames([_|T],OutList) :-
    filterPlayedGames(T,OutList).

fewHours(Player,Games) :-
    myfindall([Game,Time],played(Player,Game,Time,_),PlayedGames),
    filterPlayedGames(PlayedGames,Games),!.