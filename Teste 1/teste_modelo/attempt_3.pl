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
findElemInList([],_,_,_) :- !, fail.

findElemInList([H|_], H, Index, Index).

findElemInList([_|T], Elem, CurrentIndex, Index) :-
    NextIndex is CurrentIndex + 1,
    findElemInList(T, Elem, NextIndex, Index).

madeItThrough(IdParticipant) :-
    performance(IdParticipant, Times),
    findElemInList(Times, 120, 1, _).

% ex2
getElemN([],_,_) :- !,fail.

getElemN([H|_],1,H).

getElemN([_|T],Val,Result) :-
    Val1 is Val - 1,
    getElemN(T,Val1,Result).

sum([], 0).

sum([H|T],Res) :-
    sum(T, InterRes),
    Res is H + InterRes.

getJudgeTimes([],_,[]).

getJudgeTimes([H|T], JudgeId, [CurrentTime|OtherTimes]) :-
    performance(H,Times),
    getElemN(Times,JudgeId,CurrentTime),
    getJudgeTimes(T, JudgeId, OtherTimes).

juriTimes(Participants, JuriMember, Times, Total) :-
    getJudgeTimes(Participants, JuriMember, Times),
    sum(Times, Total).

% ex3

myfindall(GoalOutput,Goal,ListOut) :-
    Goal,
    assert(tmp(GoalOutput)),
    fail.

myfindall(_,_,[CurrentElem|OtherElems]) :-
    retract(tmp(CurrentElem)),
    myfindall(_,fail,OtherElems).

myfindall(_,_,[]).

getAllPerformanceIDs(IDs) :-
    myfindall(ID,performance(ID,_),IDs).

getAllJudgeTimes(JudgeId, Times) :-
    getAllPerformanceIDs(IDs),
    getJudgeTimes(IDs,JudgeId,Times).

countOccur([],_,0).

countOccur([H|T],H,Res) :-
    countOccur(T,H,SubRes),
    Res is SubRes + 1.

countOccur([_|T],Elem,Res) :-  countOccur(T,Elem,Res).

patientJuri(JuriMember) :-
    getAllJudgeTimes(JuriMember, Times),
    countOccur(Times,120,Count),
    Count >= 2.

% ex4

bestParticipant(P1, P2, P) :-
    performance(P1, P1Times),
    performance(P2, P2Times),
    sum(P1Times, P1Sum),
    sum(P2Times, P2Sum),!,
    P1Sum \= P2Sum,
    (P1Sum > P2Sum, P = P1; P = P2).

% ex5

getPerfInfo([],[]).

getPerfInfo([H|T],[CurrentElem|OtherElems]) :-
    participant(H,_,PerformanceName),
    performance(H,Times),
    CurrentElem = [H,PerformanceName,Times],
    getPerfInfo(T,OtherElems).

printInfo([]).

printInfo([H|T]) :-
    H = [ID, Desc, Times],
    write(ID),write(':'),write(Desc),write(':'),write(Times),nl,
    printInfo(T).

allPerfs :-
    getAllPerformanceIDs(IDs),
    getPerfInfo(IDs,Infos),
    printInfo(Infos).

% ex6
allEqualTo([H|[]],H).

allEqualTo([H|[H|T]],H) :- allEqualTo([H|T],H).

countSuccessful([],0).

countSuccessful([H|T],Result) :-
    allEqualTo(H,120),
    countSuccessful(T,SubRes),
    Result is 1 + SubRes.

countSuccessful([_|T],Result) :- countSuccessful(T,Result).

getPerfTimes([],[]).

getPerfTimes([H|T],[CurrentElem|OtherElems]) :-
    performance(H,CurrentElem),
    getPerfTimes(T,OtherElems).

nSuccessfulParticipants(T) :-
    getAllPerformanceIDs(IDs),
    getPerfTimes(IDs,Times),
    countSuccessful(Times,T).
    
% ex7

calcIndexes([],_,[]).

calcIndexes([120|T],CurrentIndex,[CurrentIndex|OtherElems]) :-
    NextIndex is CurrentIndex + 1,
    calcIndexes(T,NextIndex,OtherElems).

calcIndexes([_|T],CurrentIndex,Result) :-
    NextIndex is CurrentIndex + 1,
    calcIndexes(T,NextIndex,Result).

calcAllIndexes([],[]).

calcAllIndexes([H|T],[CurrentElem|OtherElems]) :-
    calcIndexes(H,1,CurrentElem),
    calcAllIndexes(T,OtherElems).

generateFansList([],[],[]).

generateFansList([ID|OtherIDs], [Indexes|OtherIndexes], [CurrentElem|OtherElems]) :-
    CurrentElem = ID-Indexes,
    generateFansList(OtherIDs,OtherIndexes,OtherElems).

juriFans(JuriFansList) :-
    getAllPerformanceIDs(IDs),
    getPerfTimes(IDs,Times),
    calcAllIndexes(Times,Indexes),
    generateFansList(IDs,Indexes,JuriFansList).

% ex8

:- use_module(library(lists)).

eligibleOutcome(Id,Perf,TT) :-
    performance(Id,Times),
    madeItThrough(Id),
    participant(Id,_,Perf),
    sumlist(Times,TT).

collectEligibleOutcomes(OutList) :- 
    findall([TT,Id,Perf],eligibleOutcome(Id,Perf,TT),OutList).

removeDups([],[]).

removeDups([H|[H|T]],[H|OtherElems]) :- removeDups(T,OtherElems).

removeDups([H|T],[H|OtherElems]) :- removeDups(T,OtherElems).

nextPhase(N, Participants) :-
    collectEligibleOutcomes(Outcomes),
    removeDups(Outcomes,Participants).

% ex9

predX(Q,[R|Rs],[P|Ps]) :-
    participant(R,I,P), I=<Q, !,
    predX(Q,Rs,Ps).
predX(Q,[R|Rs],Ps) :-
    participant(R,I,_), I>Q,
    predX(Q,Rs,Ps).
predX(_,[],[]).

predX1(Q,[R|Rs],[P|Ps]) :-
    participant(R,I,P), I=<Q, 
    predX1(Q,Rs,Ps).
predX1(Q,[R|Rs],Ps) :-
    participant(R,I,_), I>Q,
    predX1(Q,Rs,Ps).
predX1(_,[],[]).

/*
O predicado recebe um valor inteiro e um conjunto de IDs e percorre a lista de IDs, adicionando a uma lista que devolverá no fim os nomes das performances dos participantes cuja idade seja menor ou igual ao valor inteiro passado. O cut é verde visto que o comportamento visível do programa não muda se este for removido, apenas aumenta a eficiência do predicado evitando backtracking desnecessário.
*/

% ex10

