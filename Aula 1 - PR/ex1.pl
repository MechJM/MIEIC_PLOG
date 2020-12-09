:- use_module(library(clpfd)).
:- use_module(library(lists)).

getElemN([H|_],1,H).

getElemN([_|T],N,Elem) :-
    N1 is N - 1,
    getElemN(T,N1,Elem).



offsetList([],_,_,[]).

offsetList([H|T],Index,Offset,[H|Others]) :-
    Index >= Offset,
    Index1 is Index + 1,
    offsetList(T,Index1,Offset,Others).

offsetList([_|T],Index,Offset,Result) :-
    Index < Offset,
    Index1 is Index + 1,
    offsetList(T,Index1,Offset,Result).



getFirstNElems(_,0,[]).

getFirstNElems([H|T],N,[H|Others]) :-
    N1 is N - 1,
    getFirstNElems(T,N1,Others).



getRows(_,Index,NumRows,[]) :-
    Index > NumRows.

getRows(List,Index,NumRows,[Elem|Others]) :-
    Offset is (Index - 1) * NumRows + 1,
    offsetList(List,1,Offset,OffsetList),
    getFirstNElems(OffsetList,NumRows,Elem),
    Index1 is Index + 1,
    getRows(List,Index1,NumRows,Others).



getCols(_,Index,NumCols,[]) :-
    Index > NumCols.

getCols(List,Index,NumCols,[Elem|Others]) :-
    Offset is Index - 1,
    getOneCol(List,1,NumCols,Offset,Elem),
    Index1 is Index + 1,
    getCols(List,Index1,NumCols,Others).



getOneCol(_,Index,NumCols,_,[]) :-
    Index > NumCols.

getOneCol(List,Index,NumCols,Offset,[Elem|Others]) :-
    RequiredIndex is (Index - 1) * NumCols + 1 + Offset,
    getElemN(List,RequiredIndex,Elem),
    Index1 is Index + 1,
    getOneCol(List,Index1,NumCols,Offset,Others).



getDiagOne(_,Index,N,[]) :-
    Index > N.

getDiagOne(List,Index,N,[Elem|Others]) :-
    RequiredIndex is 1 + (Index - 1) * (N + 1),
    getElemN(List,RequiredIndex,Elem),
    Index1 is Index + 1,
    getDiagOne(List,Index1,N,Others).



getDiagTwo(_,Index,N,[]) :-
    Index > N.

getDiagTwo(List,Index,N,[Elem|Others]) :-
    RequiredIndex is N + (Index - 1) * (N - 1),
    getElemN(List,RequiredIndex,Elem),
    Index1 is Index + 1,
    getDiagTwo(List,Index1,N,Others).



getDiags(List,N,[D1, D2]) :-
    getDiagOne(List,1,N,D1),
    getDiagTwo(List,1,N,D2).



constraintListSum([],_).

constraintListSum([H|T],Sum) :-
    sum(H,#=,Sum),
    constraintListSum(T,Sum).



magic(N, Vars) :-
    SquareN is N * N,
    length(Vars, SquareN),
    domain(Vars, 1, SquareN),
    % Calc sum
    all_distinct(Vars),
    getRows(Vars,1,N,Rows),
    constraintListSum(Rows,Sum),
    getCols(Vars,1,N,Cols),
    constraintListSum(Cols,Sum),
    getDiags(Vars,N,Diags),
    constraintListSum(Diags,Sum),
    % Remove simmetry
    labeling([],Vars).