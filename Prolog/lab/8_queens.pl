/* nocheck(+Queens, +Queen) */
nocheck([], _).
nocheck([X1/Y1 | Rest], X/Y) :-
    X =\= X1,
    Y =\= Y1,
    abs(Y1-Y) =\= abs(X1-X), nocheck(Rest, X/Y).

legal([]).
legal([X/Y|Rest]) :-
    legal(Rest),
    % member(X, [1,2,3,4,5,6,7,8]),
    member(Y, [1,2,3,4,5,6,7,8]),
    nocheck(Rest, X/Y).

eightqueens(Queens) :-
    Queens = [1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_],
    legal(Queens).
