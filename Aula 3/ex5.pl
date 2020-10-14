% a)
membro(X,[X|[]]).

membro(X,[H|Resto]) :-
    X = H;
    membro(X,Resto).

% d)
membron(Elem,[H|T],N) :-
    N1 is (N - 1),
    (
        N1 = 0,
        Elem = H
    );
    membron(Elem,T,N1).