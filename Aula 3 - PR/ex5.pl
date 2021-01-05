:- use_module(library(clpfd)).

task(maria, compras, 4.5).
task(maria, cozinha, 7.8).
task(maria, lavagem, 3.6).
task(maria, limpeza, 2.9).

task(joao, compras, 4.9).
task(joao, cozinha, 7.2).
task(joao, lavagem, 4.3).
task(joao, limpeza, 3.1).

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
