:- use_module(library(lists)).

ligado(a,b).
ligado(a,c).
ligado(b,d).
ligado(b,e).
ligado(b,f).
ligado(c,g).
ligado(d,h).
ligado(d,i).
ligado(f,i).
ligado(f,j).
ligado(f,k).
ligado(g,l).
ligado(g,m).
ligado(k,n).
ligado(l,o).
ligado(i,f).

% a)
caminho(No1,No2,[H|T]) :-
    ligado(No1,No2),
    H = No1,
    T = [No2].

caminho(No1,No2,Caminho) :-
    Caminho = [No1|Resto],
    ligado(No1,X),
    caminho(X,No2,Resto).

% b)
caminho_larg(No1,No2,[H|T]) :-
    todosOsFilhos(No1,Filhos),
    member(No2,Filhos),
    H = No1,
    T = [No2].

caminho_larg(No1,_,[]) :-
    todosOsFilhos(No1,Filhos),
    Filhos == [].

caminho_larg(No1,No2,[No1|Tail]) :-
    todosOsFilhos(No1,[PrimeiroFilho|OutrosFilhos]),
    caminho_larg(PrimeiroFilho,No2,Tail).



todosOsFilhos(No, Filhos) :-
    todosOsFilhos1(No,[],Filhos).
todosOsFilhos1(No,Alguns,Filhos) :-
    ligado(No,Mais1),
    \+ (member(Mais1,Alguns)),
    todosOsFilhos1(No,[Mais1|Alguns],Filhos).
todosOsFilhos1(_,Filhos,Filhos).