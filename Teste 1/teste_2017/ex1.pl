:- consult('info.pl').

achievedALot(Player) :-
    played(Player,_,_,Percent),
    Percent >= 80.