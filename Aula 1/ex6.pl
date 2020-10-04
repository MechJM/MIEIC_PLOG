passaro(tweety).

peixe(goldie).

minhoca(molie).

gato(silvester).

gosta_de(Amigo1,Amigo2) :-
    amigo(Amigo1,Amigo2);
    amigo(Amigo2,Amigo1).

gosta_de(Elem1,Elem2) :-
    passaro(Elem1),
    minhoca(Elem2).

gosta_de(Elem1,Elem2) :-
    gato(Elem1),
    peixe(Elem2).

gosta_de(Elem1,Elem2) :-
    gato(Elem1),
    passaro(Elem2).

amigo(eu,silvester).

come(silvester,Alimento) :-
    gosta_de(silvester,Alimento).

/* Queries
come(silvester,X).
*/
