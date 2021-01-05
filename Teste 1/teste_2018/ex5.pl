:- consult('info.pl').

arrivalTime(Flight,ArrivalTime) :-
    flight(Flight,_,_,Departure,Duration,_),
    Hour is div(Departure,100),
    Minute is mod(Departure,100),
    PlusHour is div(Duration,60),
    LeftoverMinutes is mod(Duration,60),
    ArrivalHour is Hour + PlusHour,
    AddedMinutes is Minute + LeftoverMinutes,
    ArrivalMinute is mod(AddedMinutes,60),
    (AddedMinutes >= 60, ActualHour is ArrivalHour + 1; ActualHour = ArrivalHour),
    ArrivalTime is ActualHour * 100 + ArrivalMinute,!.

calcTimeDiff(Time1,Time2,Diff) :-
    Hour1 is div(Time1,100),
    TotalMin1 is Hour1 * 60 + mod(Time1,100),
    Hour2 is div(Time2,100),
    TotalMin2 is Hour2 * 60 + mod(Time2,100),
    (TotalMin1 > TotalMin2, Diff is TotalMin1 - TotalMin2; Diff is TotalMin2 - TotalMin1),!.

arePairable(Flight1, Flight2) :-
    flight(Flight1,_,Dest1,_,_,_),
    flight(Flight2,Orig,_,Time2,_,_),
    Dest1 = Orig,
    arrivalTime(Flight1,Time1),
    calcTimeDiff(Time1,Time2,Diff),
    Diff >= 30, Diff =< 90,!.

copyList([],[]).

copyList([H|T],[H|Others]) :- copyList(T,Others).


findMatchesForAFlight(_,[],[]).

findMatchesForAFlight(Flight,[H|T],[Elem|Others]) :-
    Flight \= H,
    arePairable(Flight,H),
    Elem = [Flight,H],
    findMatchesForAFlight(Flight,T,Others).

findMatchesForAFlight(Flight,[_|T],Res) :-
    findMatchesForAFlight(Flight,T,Res).

findPairs([],Res,Res).

findPairs([H|T],Res,Out) :-
    findMatchesForAFlight(H,T,CurrentPairs),
    append(Res,CurrentPairs,SubRes),
    findPairs(T,SubRes,Out).

printPairs([]).

printPairs([[]|T]) :-
    printPairs(T).

printPairs([H|T]) :-
    H = [F1|[F2]],
    flight(F1,_,Place,_,_,_),
    write(Place),
    write(' - '),
    write(F1),
    write(' \\ '),
    write(F2),nl,
    printPairs(T).

pairableFlights :-
    findall(Flight,flight(Flight,_,_,_,_,_),Flights),
    findPairs(Flights,[],Pairs),
    printPairs(Pairs).
