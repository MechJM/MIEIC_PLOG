/* 
1) F e G não serão usados para verificar se A é verdade e em caso de backtracking
só em D e E é que se procurarão outras soluções

2)
a) X = 1, X = 2
b) X = 1, Y = 1; X = 1, Y = 2; X = 2, Y = 1; X = 2, Y = 2
c) X = 1, Y = 1; X = 1, Y = 2

3)
a) 
um
dois
tres 
ultima_clausula
no
b)
um
no
c)
um-um
um-dois
um-tres
no

4)
a) Quando há mais do que um número com o mesmo valor
b)
*/

max(X,Y,Z,X) :- X>=Y, X>=Z, !.
max(X,Y,Z,Y) :- Y>=X, Y>=Z, !.
max(_,_,Z,Z).