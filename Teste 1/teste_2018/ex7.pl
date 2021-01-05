:- consult('info.pl').

sum([],0).

sum([H|T],Total) :-
    sum(T,SubTotal),
    Total is H + SubTotal.

avgFlightLengthFromAirport(Airport,AvgLength) :-
    findall(Dur,flight(_,Airport,_,_,Dur,_),Durs),
    sum(Durs,Sum),
    length(Durs,Size),
    AvgLength is Sum / float(Size).