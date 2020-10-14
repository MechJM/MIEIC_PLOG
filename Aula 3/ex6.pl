%b)
delete_all(_,[],[]).

delete_all(X,[H|T],L2) :-
    (
        X = H,
        delete_all(X,T,L2)
    );
    (
        L2 = [H|Rest],
        delete_all(X,T,Rest)
    ).
%c)
delete_all_list([],X,X).

delete_all_list([H|T],L1,L2) :-
    delete_all(H,L1,L3),
    delete_all_list(T,L3,L2).