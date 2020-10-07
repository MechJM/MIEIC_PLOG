a(a1,1).
a(A,2).
a(a3,N).
b(1,b1).
b(2,B).
b(N,b3).
c(X,Y) :- a(X,N), b(N,Y).
d(X,Y) :- a(X,N), b(Y,N).
d(X,Y) :- a(N,X), b(N,Y).

/* Respostas
a) yes
b) X = 2
c) X = a1
d) X = a1, Y = b1; X = a1, Y = b3
e) X = a1, Y = 2
*/