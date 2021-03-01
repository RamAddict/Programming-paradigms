comprimento([],0).
comprimento([_|T], C) :- comprimento(T,CT), C is CT + 1.

membro(X,[X|_]) :- !.
membro(X,[_|T]) :- membro(X,T).

igual(L,L).

inserirElemento(X,L,[X|L]).

ultimo([X],X) :- !.
ultimo([_,H2|T], X) :- ultimo([H2|T],X).


posicao([Element|_], Element, 0):-!.
posicao([_|Tail], Element, Index):-
  posicao(Tail, Element, Index1), Index is Index1+1.

insertAt(Element,0,L,[Element|L]) :- !.
insertAt(Element,Pos,[E|L],[E|ZL]) :-
    Pos1 is Pos-1,
    insertAt(Element,Pos1,L,ZL).


numerosParaPalavras([L],L):-!.
numerosParaPalavras([H|T], L) :-
  (H =:= 0, numerosParaPalavras(T,['zero'|L])),!;
  (H =:= 1, numerosParaPalavras(T,['um'|L])),!;
  (H =:= 2, numerosParaPalavras(T,['dois'|L])),!;
  (H =:= 3, numerosParaPalavras(T,['tres'|L])),!;
  (H =:= 4, numerosParaPalavras(T,['quatro'|L])),!;
  (H =:= 5, numerosParaPalavras(T,['cinco'|L])),!;
  (H =:= 6, numerosParaPalavras(T,['seis'|L])),!;
  (H =:= 7, numerosParaPalavras(T,['sete'|L])),!;
  (H =:= 8, numerosParaPalavras(T,['oito'|L])),!;
  (H =:= 9, numerosParaPalavras(T,['nove'|L])),!.


soma([N],X):- X is N.
soma([H1,H2|T],N) :-soma([H1 + H2|T],N).

media(L,X):- soma(L,A), comprimento(L,B), X is A/B.

menor([X],X).
menor([H1,H2|T],R):- H1 < H2, menor([H1|T], R).
menor([H1,H2|T],R):- H2 =< H1, menor([H2|T], R).

reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

removeLast([_],L,X):- reverse(L,X,[]).
removeLast([H|T],E,Y):- removeLast(T, [H|E], Y).

palindrome([_]):-true.
palindrome([H|T]):- ultimo(T,Y), H =:= Y, removeLast(T,[],Z),palindrome(Z).

ocorrencias([], _, 0).
ocorrencias([X|T],X,N) :- ocorrencias(T, X, N1), N is N1+1,!.
ocorrencias([_|T],X,N) :- ocorrencias(T, X, N),!.

primeiros(0,_,[]):-!.
primeiros(N,[H|T],[H|L2]) :- N1 is N-1, primeiros(N1, T, L2).

apagar(0,L1,L1) :-!.
apagar(N,[_|T],L2) :- N1 is N-1, apagar(N1, T, L2).


dividir([],[],[]) :-!. 
dividir([P],[P],[]) :-!. 
dividir([H,P|T],[H|L2],[P|L3]):- dividir(T,L2,L3).

% broken
uniao([], [], []) :- !.
uniao(T1,T2, X) :- concatenate(T1, T2, Z), removeRepeated(Z, X),!.

union([],[],[]) :- !.
union(List1,[],List1) :- !.
union(List1, [Head2|Tail2], [Head2|Output]):-
    \+(member(Head2,List1)), union(List1,Tail2,Output).
union(List1, [Head2|Tail2], Output):-
    member(Head2,List1), union(List1,Tail2,Output), !.  

diferenca([],[],[]) :- !. 
diferenca(S1,[],S1) :- !. 
diferenca(S1,[H|T], [H|T2]) :- (not(member(H, S1)), not(member(H, T2))). 

removeRepeated([], _) :- !.
removeRepeated([H|T], [H|T2]) :- not(contains(T2, H)), removeRepeated(T, T2),!.
removeRepeated([H|T], T2) :- contains(T2, H), removeRepeated(T, T2).

concatenate([], X, X) :- !.
concatenate(X, [], X) :- !.
concatenate([H1|T1],[H2|T2],[H1, H2|T]) :- concatenate(T1, T2, T).

contains([H|_], H) :- !.
contains([H|T], X) :- X =\= H, contains(T, X).
