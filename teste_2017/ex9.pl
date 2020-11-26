:- consult('info.pl').

calcSeparatedRatios([],[]).

calcSeparatedRatios([H|T],[Elem|Others]) :-
    H = [_|[Hours|[Percent]]],
    Elem is Percent / float(Hours),
    calcSeparatedRatios(T,Others).

calcRatios([],[]).

calcRatios([H|T],[Elem|Others]) :-
    H = [User|[Hours|[Percent]]],
    Ratio is Percent / float(Hours),
    Elem = [User,Ratio],
    calcRatios(T,Others).

filterUserRatio([],_,[]).

filterUserRatio([H|T],Max,[Elem|Others]) :-
    H = [User|[Ratio]],
    Ratio = Max,
    Elem = User,
    filterUserRatio(T,Max,Others).

filterUserRatio([_|T],Max,OutList) :-
    filterUserRatio(T,Max,OutList).

findMax([],Aux,Aux).

findMax([H|T],Aux,Res) :-
    H > Aux,
    findMax(T,H,Res).

findMax([_|T],Aux,Res) :-
    findMax(T,Aux,Res).

mostEffectivePlayers(Game, Players) :-
    findall([User,Hours,Percent],played(User,Game,Hours,Percent),PlayerInfo),
    calcRatios(PlayerInfo,UserRatios),
    calcSeparatedRatios(PlayerInfo,Ratios),
    findMax(Ratios,-9999,Max),
    filterUserRatio(UserRatios,Max,Players),!.