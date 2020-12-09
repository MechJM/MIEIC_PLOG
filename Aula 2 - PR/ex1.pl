:- use_module(library(clpfd)).

nome(1, 'Ferreira').
nome(2, 'Rocha').
nome(3, 'Silva').
nome(4, 'Sr.Ferreira').
nome(5, 'Sr.Rocha').
nome(6, 'Sr.Silva').



train(List) :-
    Vars = [Maq, Rev, Fog, Pass1, Pass2, Pass3],
    domain(Vars,1,6),
