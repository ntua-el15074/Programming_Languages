/* --------------- Maximum ---------------- */
max_data(n(Data,List), Max) :-
    max_recursive(List, Data, Max).

max_recursive([],Max,Max).
max_recursive([H|T],Data,Max) :- 
    H = n(D,L),
    Current is max(D,Data),
    max_recursive(L,Current,ML),
    max_recursive(T,ML,Max).

/* --------------- Depth ---------------- */

 find_depth(n(Data,_),Data,1).
 find_depth(n(_,List),Data,Depth) :-
    member(Elem,List),
    find_depth(Elem,Data,NewDepth),
    Depth is NewDepth + 1.

/* --------------- Testing ---------------- */

test_max(Max) :- tree(Tree), max_data(Tree, Max).

test_depth(Data,Depth) :- tree(Tree), find_depth(Tree, Data, Depth).

tree(n(4,[n(5,[n(7,[n(9,[])])])])).
tree(n(3,[n(2,[n(1,[n(1,[])])])])).
tree(n(4,[n(2,[n(14,[n(2,[])])])])).
tree(n(9,[n(8,[n(7,[n(2,[])])])])).

