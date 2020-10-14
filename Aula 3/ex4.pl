inverter([X|[]],[X]).

inverter(List,Res) :-
    getLast(List,LastElem),
    pop(List,WithoutLast),
    Res = [LastElem|Rest],
    inverter(WithoutLast,Rest).

pop([X|[_|[]]],[X]).

pop([H|T],[H|T2]) :- pop(T,T2).


getLast([X|[]],X).

getLast([_|Tail],X) :- getLast(Tail,X).