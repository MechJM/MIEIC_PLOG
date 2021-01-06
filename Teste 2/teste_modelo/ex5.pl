:- use_module(library(lists)).
:- use_module(library(clpfd)).

% corta([100,45,70], [12,50,14,8,10,90,24], S).

getSumElems(_, _, [], _, []).

getSumElems(Index, Prateleiras, [Prancha|Pranchas], WantedIndex, [Elem|Others]) :-
    (Prancha #= WantedIndex,
    nth1(Index, Prateleiras, Elem), NextResult = Others; NextResult = [Elem|Others]),
    Index1 is Index + 1,
    getSumElems(Index1, Prateleiras, Pranchas, WantedIndex, NextResult).

iterPranchas(_, [], _, _).

iterPranchas(Index, [Prancha|Pranchas], Prateleiras, PranchasSelecionadas) :-
    getSumElems(1, Prateleiras, PranchasSelecionadas, Index, Elems),
    once(write(Prancha)),once(nl),
    once(write(Elems)),once(nl),
    once(write(Index)),once(nl),
    sumlist(Elems, Sum),
    Sum #=< Prancha,
    Index1 is Index + 1,
    iterPranchas(Index1, Pranchas, Prateleiras, PranchasSelecionadas).

corta(Pranchas, Prateleiras, PranchasSelecionadas) :-
    length(Prateleiras, NumPrateleiras),
    length(PranchasSelecionadas, NumPrateleiras),
    length(Pranchas, NumPranchas),
    domain(PranchasSelecionadas, 1, NumPranchas),
    iterPranchas(1, Pranchas, Prateleiras, PranchasSelecionadas),
    labeling([], PranchasSelecionadas).

