%performance(Id,Age,Performance)
participant(1234,17,'Pé coxinho').
participant(3423,21,'Programar com os pés').
participant(3788,20,'Sing a Bit').
participant(4865,22,'Pontes de esparguete').
participant(8937,19,'Pontes de pen-drives').
participant(2564,20,'Moodle hack').
%performance(Id,Times)
performance(1234,[120,120,120,120]).
performance(3423,[32,120,45,120]).
performance(3788,[110,2,6,43]).
performance(4865,[120,120,110,120]).
performance(8937,[97,101,105,110]).

madeItThrough(Id) :-
    performance(Id,Lista),
    all120(Lista).

all120([X|[]]) :- X = 120.

all120([H|T]) :-
    H = 120,
    all120(T).

juriTimes([],_,[],0).

juriTimes([Head|Tail], JuriMember, Times, Total) :-
    performance(Head,Tempos),
    getElemN(Tempos, JuriMember, Tempo),
    Times = [Tempo | OutrosTempos],
    juriTimes(Tail,JuriMember,OutrosTempos,ProxTempo),
    Total is Tempo + ProxTempo.

getElemN([X|_],1,X).

getElemN([_|T],N,Elem) :-
    N1 is N - 1,
    getElemN(T,N1,Elem).



patientJuri(Num) :-
    procurarPerf(Perfs),
    getJuriTimes(Num,Perfs,TemposDoJuri),
    countOccur(TemposDoJuri,120,Count),
    Count >= 2.
    


getJuriTimes(Num,ListaInput,Result) :-
    ListaInput = [H|T],
    performance(H,Tempos),
    getElemN(Tempos,Num,TempoJuriPedido),
    Result = [TempoJuriPedido|OutrosTemposDoJuri],
    getJuriTimes(Num,T,OutrosTemposDoJuri).

procurarPerf(List) :-
    procurarPerf1([], List).

procurarPerf1(X,X).
procurarPerf1(AlreadyFound, List) :-
    performance(Elem1, _),
    \+ (member(Elem1,AlreadyFound)),
    procurarPerf1([Elem1|AlreadyFound],List).

countOccur(Lista, Val, Count) :-
    Lista = [H|T],
    countOccur(T, Val, ProxCount),
    (H = Val, Count is 1 + ProxCount);
    Count is ProxCount.

bestParticipant(P1,P2,Out) :-
    performance(P1,TemposP1),
    soma(TemposP1, TotalP1),
    performance(P2,TemposP2),
    soma(TemposP2, TotalP2),
    \+(TotalP1 = TotalP2),
    (TotalP1 > TotalP2, Out = P1);
    Out = P2.

soma([],0).
soma(Lista, Total) :-
    Lista = [H|T],
    soma(T, Subtotal),
    Total is H + Subtotal.