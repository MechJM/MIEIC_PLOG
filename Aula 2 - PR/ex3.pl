:- use_module(library(clpfd)).

shopping(ItensComprados) :-
    Solucao = [Nomes, Andares, ItensComprados],
    Nomes = [Adams, Baker, Catt, Dodge, Ennis, Fisk],
    Andares = [Um, Dois, Tres, Quatro, Cinco, Seis],
    ItensComprados = [Livro, Vestido, Bolsa, Gravata, Chapeu, Candeeiro],

    flatten(Solucao, ListaVars),
    domain(ListaVars, 1, 6),

    all_distinct(Nomes),
    all_distinct(Andares),
    all_distinct(ItensComprados),
    
    Catt #= Dois,
    Gravata #= Dois,
    Vestido #= Tres,
    Candeeiro #= Cinco,
    Cinco #\= Fisk,
    Fisk #= Seis,
    Baker #\= Bolsa,
    Baker #\= Gravata,
    Livro #= Um,
    
    labeling([],ListaVars),
    write(Solucao),nl.
