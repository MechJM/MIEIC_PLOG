:- use_module(library(clpfd)).

task(maria, compras, 45).
task(maria, cozinha, 78).
task(maria, lavagem, 36).
task(maria, limpeza, 29).

task(joao, compras, 49).
task(joao, cozinha, 72).
task(joao, lavagem, 43).
task(joao, limpeza, 31).

index(maria, 1).
index(joao, 2).

countOccur([],_,0).

countOccur([H|T],H,Count) :-
    countOccur(T, H, SubCount),
    Count #= 1 + SubCount.

countOccur([_|T],Elem, Count) :-
    countOccur(T,Elem,Count).

calcTime([], [], 0).

calcTime([H|T], [H2|T2], Total) :-
    index(Name, H),
    task(Name, H2, Time),
    calcTime(T, T2, SubTotal),
    Total #= Time + SubTotal.

tasks(Tasks, Vars) :-
    length(Tasks, Len),
    length(Vars, Len),
    domain(Vars, 1, 2),
    countOccur(Vars, 1, 2),
    countOccur(Vars, 2, 2),
    calcTime(Vars, Tasks, TotalTime),
    minimize(labeling([],Vars),TotalTime).
