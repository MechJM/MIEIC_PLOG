:- consult('info.pl').

isAgeAppropriate(Name,Game) :-
    game(Game,_,MinAge),
    player(Name,_,Age),
    Age >= MinAge.