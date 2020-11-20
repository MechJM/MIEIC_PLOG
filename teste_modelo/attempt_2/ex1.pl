%participant(Id,Age,Performance)
participant(1234, 17, 'Pé coxinho').
participant(3423, 21, 'Programar com os pés').
participant(3788, 20, 'Sing a Bit').
participant(4865, 22, 'Pontes de esparguete').
participant(8937, 19, 'Pontes de pen-drives').
participant(2564, 20, 'Moodle hack').


%performance(Id,Times)
performance(1234,[120,120,120,120]).
performance(3423,[32,120,45,120]).
performance(3788,[110,2,6,43]).
performance(4865,[120,120,110,120]).
performance(8937,[97,101,105,110]).

% ex1
found120([]) :- fail.

found120([120|_]).

found120([_|T]) :- found120(T). 

madeItThrough(Id) :-
    performance(Id, Tempos),
    found120(Tempos).

% ex2
getElemN([H|_],1,H).

getElemN([_|T],N,Elem) :-
    N1 is N - 1,
    getElemN(T,N1,Elem).

soma([],0).

soma([H|T], Resultado) :-
    soma(T, Subresultado),
    Resultado is H + Subresultado.

getTemposParaUmJuri([],_,[]).

getTemposParaUmJuri([H|T],JuriNum,Resultado) :-
    performance(H,Tempos),
    getElemN(Tempos,JuriNum,TempoDoJuri),
    Resultado = [TempoDoJuri|OutrosTemposDoJuri],
    getTemposParaUmJuri(T,JuriNum,OutrosTemposDoJuri).

juriTimes(Lista,JuriNum,Times,Total) :-
    getTemposParaUmJuri(Lista,JuriNum,Times),
    soma(Times,Total).

% ex3

countOccur([],_,0).

countOccur([H|T], H, Count) :-
    countOccur(T, H, SubCount),
    Count is 1 + SubCount.

countOccur([H|T], Elem, Count) :- countOccur(T, Elem, Count).

notInList(_,[]).

notInList(Elem, [H|T]) :-
    Elem \= H,
    notInList(Elem, T).

getPlayers([],Resultado) :-
    participant(Id,_,_),


%patientJuri(JuriId) :-
 %   countOccur()

% ex4

bestParticipant(P1, P2, P) :-
    performance(P1, TemposP1),
    performance(P2, TemposP2),
    soma(TemposP1, SomaP1),
    soma(TemposP2, SomaP2),
    \+(SomaP1 =:= SomaP2),
    (SomaP1 > SomaP2, P = P1);
    P = P2.





