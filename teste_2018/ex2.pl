:- consult('info.pl').

shorter(Flight1,Flight2,Shorter) :-
    flight(Flight1,_,_,_,Dur1,_),
    flight(Flight2,_,_,_,Dur2,_),!,
    Dur1 \= Dur2,
    (Dur1 < Dur2, Shorter = Flight1; Shorter = Flight2).