factorial(X,F) :- X =:= 1, F is 1.
factorial(X,F) :- X > 1, NewX is X-1, factorial(NewX,NF), F is X*NF.
factorial2(X,F) :- 
(
    X =:= 1 -> F is 1
;   X > 1, NewX is X-1,
    factorial(NewX,NF),
    F is NF*X
).
