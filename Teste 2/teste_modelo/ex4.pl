:- use_module(library(clpfd)).
:- use_module(library(lists)).

calcCustoEmb([], _, _, 0, 0).

calcCustoEmb([Obj|Objs], CustoObjeto, EmbObjeto, Custo, EmbsUsadas) :-
    nth1(Obj, CustoObjeto, CurrCusto),
    nth1(Obj, EmbObjeto, CurrEmb),
    calcCustoEmb(Objs, CustoObjeto, EmbObjeto, SubCusto, SubEmb),
    Custo #= SubCusto + CurrCusto,
    EmbsUsadas #= SubEmb + CurrEmb.

% constroi(30,100,[6,4,12,20,6],[20,50,10,20,15],EmbUsadas,Objetos).
% constroi(50,100,[6,4,12,20,6],[20,50,10,20,15],EmbUsadas,Objetos).

constroi(NEmb,Orcamento,EmbPorObjeto,CustoPorObjeto,EmbUsadas,Objetos) :-
    length(EmbPorObjeto, NumObjects),
    length(Objetos, 4),
    domain(Objetos, 1, NumObjects),
    all_distinct(Objetos),
    calcCustoEmb(Objetos, CustoPorObjeto, EmbPorObjeto, Custo, EmbUsadas),
    Custo #=< Orcamento,
    EmbUsadas #=< NEmb,
    labeling([maximize(EmbUsadas), best],Objetos).

    
    
