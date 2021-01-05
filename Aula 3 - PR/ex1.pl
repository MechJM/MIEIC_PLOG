:- use_module(library(clpfd)).

color(D, red).
color(H, red).
color(C, black).
color(S, black).

allEqual([_]).

allEqual([X,Y|T]) :-
    X = Y,
    allEqual([Y|T]).

getCardColor([_,Color], Color).

getCardNumber([Number,_], Number).

getColors([], []).

getColors([H|T],[Elem|Others]) :-
    getCardColor(H, Elem),
    getColors(T, Others).

getNumbers([], []).

getNumbers([H|T], [Elem|Others]) :-
    getCardNumber(H, Elem),
    getNumbers(T, Others).

findRoyalFlush(Cards) :-
    getColors(Cards, Colors),
    allEqual(Colors),
    getNumbers(Cards, Numbers),
    member(14,Numbers),
    member(13,Numbers),
    member(12,Numbers),
    member(11,Numbers),
    member(10,Numbers).

checkSequence([_]).

checkSequence([X,Y|T]) :-
    X is Y - 1,
    checkSequence([Y|T]).

findStraightFlush(Cards) :-
    getColors(Cards, Colors),
    allEqual(Colors),
    getNumbers(Cards, Numbers),
    sort(Numbers, Sorted),
    checkSequence(Sorted).

findPoker(Cards) :-
    getNumbers(Cards, Numbers),
    sort(Numbers, Sorted),
    (
        Sorted = [X,X,X,X,_];
        Sorted = [_,X,X,X,X]    
    ).

findFullHouse(Cards) :-
    getNumbers(Cards, Numbers),
    sort(Numbers, Sorted),
    (
        Sorted = [X,X,X,Y,Y];
        Sorted = [X,X,Y,Y,Y]    
    ).

findColor(Cards) :-
    getColors(Cards, Colors),
    allEqual(Colors).

findSequence(Cards) :-
    getNumbers(Cards, Numbers),
    sort(Numbers, Sorted),
    checkSequence(Sorted).

findTrio(Cards) :-
    getNumbers(Cards, Numbers),
    sort(Numbers, Sorted),
    (
        Sorted = [X,X,X,_,_];
        Sorted = [_,X,X,X,_];
        Sorted = [_,_,X,X,X]    
    ).

findTwoPairs(Cards) :-
    getNumbers(Cards, Numbers),
    sort(Numbers, Sorted),
    (
        Sorted = [X,X,Y,Y,_];
        Sorted = [_,X,X,Y,Y];
        Sorted = [X,X,_,Y,Y]
    ).

findPair(Cards) :-
    getNumbers(Cards, Numbers),
    sort(Numbers, Sorted),
    (
        Sorted = [X,X,_,_,_];
        Sorted = [_,X,X,_,_];
        Sorted = [_,_,X,X,_];
        Sorted = [_,_,_,X,X] 
    ).

calculateHandPoints(Cards, Points) :-
    (findRoyalFlush(Cards), Points = 400);
    (findStraightFlush(Cards), Points = 300);
    (findPoker(Cards), Points = 200);
    (findFullHouse(Cards), Points = 150);
    (findColor(Cards), Points = 90);
    (findSequence(Cards), Points = 60);
    (findTrio(Cards), Points = 40);
    (findTwoPairs(Cards), Points = 20);
    (findPair(Cards), Points = 10);
    Points = 0.

getCol([],_,[]).

getCol([H|T],Index,[Elem|Others]) :-
    nth1(Index, H, Elem),
    getCol(T,Index,Others).

getCols(Matrix, [Col1, Col2, Col3, Col4, Col5]) :-
    getCol(Matrix, 1, Col1),
    getCol(Matrix, 2, Col2),
    getCol(Matrix, 3, Col3),
    getCol(Matrix, 4, Col4),
    getCol(Matrix, 5, Col5).

iterateHands([],0)

iterateHands([H|T], Sum) :-
    calculateHandPoints(H, CurrentSum),
    iterateHands(T, SubSum),
    Sum is CurrentSum + SubSum.

calculatePoints(CardMatrix, Points) :-
    getCols(CardMatrix, Cols),
    append(CardMatrix, Cols, AllHands),
    iterateHands(AllHands, Points).

poker(Cards, Points) :-


organizeMatrix([Card|OtherCards],[Coords|OtherCoords]) :-
    

sample_set([
    [[3, red],[3, black],[6, black],[10, red],[8, black]],
    [[13, black],[14, black],[3, black],[11, black],[12, red]],
    [[4, red],[2, red],[9, black],[2, red],[6, black]],
    [[10, red],[13, red],[4, black],[6, red],[13, red]],
    [[8, red],[11, red],[10, black],[3, red],[11, black]]
    ]).