:- consult('info.pl').

short(Flight) :-
    flight(Flight,_,_,_,Dur,_),
    Dur < 90.