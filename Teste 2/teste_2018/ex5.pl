:- use_module(library(clpfd)).

limit_height(ManID, Men, WomanID, Women, Delta) :-
    element(ManID, Men, ManHeight),
    element(WomanID, Women, WomanHeight),
    Diff #= ManHeight - WomanHeight,
    Diff #> 0,
    Diff #=< Delta.

form_pairs([], _, [], _, _).

form_pairs([H|Hs], Men, [M|Ms], Women, Delta) :-
    limit_height(H, Men, M, Women, Delta),
    form_pairs(Hs, Men, Ms, Women, Delta, Pairs).

form_actual_pairs([], [], []).

form_actual_pairs([M|Ms], [W|Ws], [M-W|Pairs]) :-
    form_actual_pairs(Ms, Ws, Pairs).

sort_men([_]).

sort_men([X,Y|T]) :-
    X #< Y,
    sort_men([Y|T]).

optimal_skating_pairs(MenHeights, WomenHeights, Delta, Pairs) :-
    length(MenHeights, MenLength),
    length(WomenHeights, WomenLength),
    (MenLength > WomenLength, NumPairs is WomenLength; NumPairs is MenLength),
    length(Pairs, NumPairs),
    length(MenIDs, MenLength),
    length(WomenIDs, WomenLength),
    domain(MenIDs, 1, MenLength),
    domain(WomenIDs, 1, WomenLength),
    all_distinct(MenIDs),
    all_distinct(WomenIDs),
    sort_men(MenIDs),
    append(MenIDs, WomenIDs, Vars),
    domain(Vars, 1, NumPairs),
    form_pairs(MenIDs, MenHeights, WomenIDs, WomenHeights, Delta),
    labeling([], Vars),
    form_actual_pairs(MenIDs, WomenIDs, Pairs).