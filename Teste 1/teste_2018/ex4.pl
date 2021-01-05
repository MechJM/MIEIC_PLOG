:- consult('info.pl').

myfindall(GoalOutput,Goal,_) :-
    Goal,
    assert(tmp(GoalOutput)),
    fail.

myfindall(_,_,[Elem|Others]) :-
    retract(tmp(Elem)),
    myfindall(_,fail,Others).

myfindall(_,_,[]).

operates(Company,Country) :-
    company(Company,_,_,_),
    flight(_,Orig,Dest,_,_,Company),
    (airport(_,Orig,Country); airport(_,Dest,Country)).

removeDups([],[]).

removeDups([H|T],[H|Others]) :-
    \+ (member(H,T)),
    removeDups(T,Others).

removeDups([_|T],Res) :-
    removeDups(T,Res).

countries(Company, ListOfCountries) :-
    myfindall(Country,operates(Company,Country),Countries),
    removeDups(Countries,ListOfCountries),!.

