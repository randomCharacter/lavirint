:- [putanja].

pomoc :- 
	print('trazi(X1,Y1,X2,Y2,P) - Vraca u P putanju kojom se moze stici od [X1,Y1] do [X2,Y2] ukoliko ona postoji, inace vraca false\n'),
	print('trazi(X1,Y1,X2,Y2) - Ispisuje putanju kojom se dolazi od [X1,Y1] do [X2,Y2] ukoliko postoji,vraca true ako je putanja nadjena, a false ako nije\n'),
	print('pitanje - Ispisuje pomoc\n'),
	print('prohodno(X,Y) - Vraca true ako je polje [X,Y] prohodno, inace vraca false\n'),
	print('obrni(L1,L2) - Obrce listu L1 i smesta je u L2\n'),
	print('spisak prohodnih i neprohodnih polja nalazi se u fajlu "putanja.pl"\n'),
	print('pomoc2 - Otvara pomoc za upisivanje u fajl "putanja.pl"').
	
pomoc2 :-
	print('w(X,Y) - polje [X,Y] je prohodno\n'),
	print('nw(X,Y) - polje [X,Y] nije prohodno\n'),
	print('!!svi predikati w i nw moraju vaziti za konkretne brojeve ili moraju biti neka funkcija!!\n'),
	print('w(X,Y). ucinice da sva polja budu prohodna i program ce upasti u beskonacnu pertlu\n').
	
	
obrni(L,L1):-  
	obrni(L,[],L1).
obrni([G|R],A,L1):-  
	obrni(R,[G|A],L1). 
obrni([],A,A).

prohodno(X,Y) :- w(X,Y).

d(X0,Y0,X,Y) :- sledeci(X0,Y0,X,Y), w(X,Y).
sledeci(X0,Y0,X0,Y) :- Y is Y0+1.
sledeci(X0,Y0,X,Y0) :- X is X0+1.
sledeci(X0,Y0,X0,Y) :- Y is Y0-1.
sledeci(X0,Y0,X,Y0) :- X is X0-1.

trazi(X,Y,X0,Y0) :-
	trazi(X,Y,X0,Y0,Path),
	writeq(Path).
	
trazi(X,Y,X0,Y0,Path):-
	trazi(X,Y,X0,Y0,[],P),
	obrni(P,P1),
	Path = [[X,Y]|P1].

trazi(X,Y,X,Y,Path,Path).
trazi(X0,Y0,X,Y,SoFar,Path) :-
    d(X0,Y0,X1,Y1),
	w(X1,Y1),
    \+ memberchk( [X1,Y1], SoFar ),
    trazi(X1,Y1,X,Y,[[X1,Y1]|SoFar],Path).
