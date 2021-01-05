:- use_module(library(clpfd)).
:- use_module(library(lists)).

calcTime([_], 0).

calcTime([H1,H2|Houses],Result) :-
    CurrentTime #= abs(H2 - H1),
    calcTime([H2|Houses],SubResult),
    Result #= CurrentTime + SubResult.

mailPath(Vars) :-
    length(Vars, 10),
    domain(Vars,1,10),
    nth1(10, Vars, LastHouse),
    LastHouse #= 6,
    all_distinct(Vars),
    calcTime(Vars, Time),
    maximize(labeling([], Vars), Time).