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

getFlightCountries(Flight,OrigCountry,DestCountry) :-
    flight(Flight,Orig,Dest,_,_,_),
    airport(_,Orig,OrigCountry),
    airport(_,Dest,DestCountry).

getFlights([_|[]],_,[]).

getFlights([H|[H2|T]],Time,[Elem|Others]) :-
    getFlightCountries(Flight,H,H2),
    flight(Flight,_,_,Departure,_,_),
    Departure > Time,
    Elem = Flight,
    getFlights([H2|T],Time,Others).

filterBreakTime([_|[]]).

filterBreakTime([H|[H2|T]]) :-
    arrivalTime(H,ArrTime),
    flight(H2,_,_,DepTime,_,_),
    calcTimeDiff(ArrTime,DepTime,Diff),
    Diff >= 30,
    filterBreakTime([H2|T]).

getFlightTimes([],[]).

getFlightTimes([H|T],[Elem|Others]) :-
    flight(H,_,_,Elem,_,_),
    getFlightTimes(T,Others).

calcDays([_|[]],1).

calcDays([H|[H2|T]],Res) :-
    arrivalTime(H,Time1),
    arrivalTime(H2,Time2),
    Time2 < Time1,
    calcDays([H2|T],SubRes),
    Res is 1 + SubRes.

calcDays([_|T],Res) :-
    calcDays(T,Res).

tripDays(Trip,Time,FlightTimes,Days) :-
    getFlights(Trip,Time,Flights),
    filterBreakTime(Flights),
    getFlightTimes(Flights,FlightTimes),
    calcDays(Flights,Days).



