%:- include('ex3.pl').

% a)
membro(X,[X|[]]).

membro(X,[H|Resto]) :-
    X = H;
    membro(X,Resto).

% d)
membron([X|_],1,X).

membron([_|T],N,Elem) :-
    N1 is (N - 1),
    membron(T,N1,Elem).