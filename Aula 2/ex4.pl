factorial(1,1).

factorial(N,Valor) :-
    N > 1,
    N1 is N - 1, 
    factorial(N1,Valor2),
    Valor is (N*Valor2).

fibonacci(0,1).

fibonacci(1,1).

fibonacci(N,Valor) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1,Valor2),
    fibonacci(N2,Valor3),
    Valor is Valor2 + Valor3.