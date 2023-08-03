parent(esther, john).
parent(margaret, esther).
parent(john, tzoutzoukos).
parent(john, kostas).
greatgrandparent(GGP,GGC) :- parent(GGP,GP),parent(GP,P),parent(P,GGC).
sibling(X,Y) :- parent(P,X), parent(P,Y), \+ (X=Y).

