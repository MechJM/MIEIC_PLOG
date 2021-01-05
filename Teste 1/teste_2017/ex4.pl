:- consult('info.pl').

myfindall(GoalOutput,Goal,_) :-
    Goal,
    assert(tmp(GoalOutput)),
    fail.

myfindall(_,_,[H|T]) :-
    retract(tmp(H)),
    myfindall(_,fail,T).

myfindall(_,_,[]).

filterGames([],_,[]).

filterGames([H|T],Cat,[Elem|Others]) :- 
    H = [_|[Cats|_]],
    member(Cat,Cats),
    Elem = H,
    filterGames(T,Cat,Others).

filterGames([_|T],Cat,OutList) :-
    filterGames(T,Cat,OutList).

printInfo([]).

printInfo([H|[]]) :-
    H = [Name|[_|[Age]]],
    write(Name),write(' ('),write(Age),write(')').

printInfo([H|T]) :-
    H = [Name|[_|[Age]]],
    write(Name),write(' ('),write(Age),write(')'),nl,
    printInfo(T).

listGamesOfCategory(Cat) :-
    myfindall([Name,Cats,Age],game(Name,Cats,Age),Games),
    filterGames(Games,Cat,Filtered),
    printInfo(Filtered).
