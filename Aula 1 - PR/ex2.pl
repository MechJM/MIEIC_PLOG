:- use_module(library(clpfd)).

casa(ingles, vermelha).

animal(espanhol, cao).

posCasa(noruegues, 2).

cigarro(Pessoa, marlboro) :-
    casa(Pessoa, amarela).

cigarro(Pessoa, chesterfield) :-
    posCasa(Pessoa, PosCasa),
    PosCasa1P #= PosCasa + 1,
    PosCasa1M #= PosCasa - 1,
    (
        posCasa(Pessoa2, PosCasa1M),
        animal(Pessoa2, raposa)
    ) #\/
    (
        posCasa(Pessoa2, PosCasa1P),
        animal(Pessoa2, raposa)
    ).

posCasa(noruegues, PosCasa) :-
    casa(Pessoa2, azul),
    posCasa(Pessoa2, PosCasaAzul),
    PosCasa #= PosCasaAzul - 1 #\/
    PosCasa #= PosCasaAzul + 1.

cigarro(Pessoa, winston) :-
    animal(Pessoa, iguana).

cigarro(Pessoa, luky_strike) :-
    bebida(Pessoa, sumo_laranja).

bebida(ucraniano, cha).

cigarro(portugues, sg_lights).

cigarro(Pessoa, marlboro) :-
    posCasa(Pessoa, PosCasa),
    animal(Pessoa2, cavalo),
    posCasa(Pessoa2, PosCavalo),
    PosCasa #= PosCavalo - 1 #\/ PosCasa #= PosCavalo + 1.

bebida(Pessoa, cafe) :-
    casa(Pessoa, verde).

casa(Pessoa, verde) :-
    posCasa(Pessoa, PosVerde),
    casa(Pessoa2, branca),
    posCasa(Pessoa2, PosBranca),
    PosBranca #= PosVerde - 1.

posCasa(Pessoa, 3) :-
    bebida(Pessoa, leite).

zebra(Vars) :-
