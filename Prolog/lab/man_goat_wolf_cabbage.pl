/* config(Man, Wolf, Goat, Cabbage) */ 
initial(config(w, w, w, w)).
final(config(e, e, e, e)).

opposite(w,e).
opposite(e,w).

/* move(Config1, Move, Config2)*/
move(config(Coast, Coast, G, C), wolf, config(OppCoast,OppCoast, G, C)) :-
    opposite(Coast,OppCoast).
move(config(Coast, W, Coast, C), goat, config(OppCoast, W, OppCoast, C)) :- 
    opposite(Coast, OppCoast).
move(config(Coast, W, G, Coast), cabbage, config(OppCoast, W, G, OppCoast)) :- 
    opposite(Coast, OppCoast).
move(config(Coast, W, G, C), nothing, config(OppCoast, W, G, C)) :-
    opposite(Coast, OppCoast).

together_or_separated(Coast, Coast, Coast).
together_or_separated(_, Coast, OppCoast) :- opposite(Coast, OppCoast).

safe(config(Man, Wolf, Goat, Cabbage)) :- 
    together_or_separated(Man, Wolf, Goat),
    together_or_separated(Man, Goat, Cabbage).

/* solve(+Config, -Moves) */
solve(Conf, []) :- final(Conf).
solve(Conf, [Move|Moves]) :- 
    move(Conf, Move, Conf1),
    safe(Conf1),
    solve(Conf1, Moves).

solve(Moves) :-
    initial(InitialConf),
    length(Moves,_),
    solve(InitialConf, Moves).








