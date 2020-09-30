mora_em(joao,casa).
mora_em(maria,apartamento).
mora_em(ana,casa).

animal(gato).
animal(tigre).
animal(cao).

desporto(natacao).
desporto(tenis).

jogo(xadrez).
jogo(damas).

gosta_desporto(Pessoa) :-
    gosta_de(Pessoa,Desporto),
    desporto(Desporto).

gosta_animal(Pessoa) :-
    gosta_de(Pessoa,Animal),
    animal(Animal).

gosta_jogo(Pessoa) :-
    gosta_de(Pessoa,Jogo),
    jogo(Jogo).

gosta_de(joao,gato).
gosta_de(ana,xadrez).
gosta_de(ana,tigre).
gosta_de(ana,natacao).
gosta_de(ana,damas).
gosta_de(maria,tenis).
gosta_de(maria,tigre).

homem(joao).
mulher(maria).
mulher(ana).

/* Queries
a) mora_em(Pessoa,apartamento),gosta_animal(Pessoa).
b) mora_em(joao,casa),mora_em(maria,casa),gosta_desporto(joao),gosta_desporto(maria).
c) gosta_jogo(Pessoa2),gosta_desporto(Pessoa2).
d) mulher(Pessoa3),gosta_de(Pessoa3,tenis),gosta_de(Pessoa3,tigre).
*/