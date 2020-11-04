separa([],_,[]).

separa([H|T], Pred, [HOut|TOut]) :-
    Expr =.. [Pred|[H]],
    (Expr, HOut = H);
    HOut = [],
    separa(T,Pred,TOut).

findFails(List, Pred, OutList) :-
    List = [H|T],
    Expr =.. [Pred|[H]],
    (Expr; OutList = []),

par(0).
par(2).
par(4).