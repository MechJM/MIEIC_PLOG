:- consult('info.pl').

updatePlayer(Player, Game, Hours, Percentage) :-
    retract(played(Player,Game,OldHours, OldPercent)),
    NewHours is Hours + OldHours,
    NewPercent is Percentage + OldPercent,
    assert(played(Player,Game,NewHours,NewPercent)).

updatePlayer(Player, Game, Hours, Percentage) :-
    assert(played(Player,Game,Hours,Percent)).