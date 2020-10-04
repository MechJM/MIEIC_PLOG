comprou(joao, honda).
comprou(joao,uno).
ano(honda,1997).
ano(uno,1998).
valor(honda,20000).
valor(uno,7000).

pode_vender(Pessoa,Carro,Ano_Atual) :-
    ano(Carro,Ano_da_Compra),
    (Ano_Atual - Ano_da_Compra) =< 10,
    comprou(Pessoa,Carro),
    valor(Carro,Valor),
    Valor < 10000.