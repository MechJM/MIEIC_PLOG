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