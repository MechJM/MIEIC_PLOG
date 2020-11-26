:- consult('info.pl').

calcTimes(_,[],[]).

calcTimes(Player, [H|T], [CurrentElem|OtherElems]) :-
    (played(Player,H,CurrentElem,_); CurrentElem = 0),
    calcTimes(Player,T,OtherElems). 

sum([],0).

sum([H|T],Total) :-
    sum(T,SubTotal),
    Total is H + SubTotal.

timePlayingGames(Player,Games,ListOfTimes,SumTimes) :-
    calcTimes(Player,Games,ListOfTimes),
    sum(ListOfTimes,SumTimes).