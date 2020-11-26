:- consult('info.pl').

myfindall(GoalOutput,Goal,_) :-
    Goal,
    assert(tmp(GoalOutput)),
    fail.

myfindall(_,_,[Elem|Others]) :-
    retract(tmp(Elem)),
    myfindall(_,fail,Others).

myfindall(_,_,[]).

getCountries([H|T],AuxList,OutList) :-
    H = [Orig|[Dest]],
    airport(_,Orig,CountryOrig),

countries(Company, ListOfCountries) :-
    myfindall([Orig,Dest],flight(_,Orig,Dest,_,_,Company),CountryPairs),

