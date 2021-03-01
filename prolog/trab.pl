:- use_module(library(clpfd)).

puzzle([0,0,0,0,0,
       0,0,0,0,0,
       0,0,0,0,0,
       0,0,0,0,0,
       0,0,0,0,0]).

colunas([0,2,0,0,0],[0,0,3,0,2]).
linhas([0,5,4,0,0],[0,0,0,2,0]).

n_factorial(0, 1).
n_factorial(N, F) :-
        N #> 0,
        N1 #= N - 1,
        n_factorial(N1, F1),
        F #= N * F1.

% nPredios([], Num):- Num = 0.
nPredios([], _, 0) :- !.
nPredios([H|T], Max, Count):- Max #< H, nPredios(T, H, NewCount),  Count #= NewCount+1, !.
nPredios([_|T], Max, Count):- nPredios(T, Max, Count).

isLineValid(_, 0) :- true, !.
isLineValid(Linha, A) :- nPredios(Linha, 0, X), A #= X, !.

checkPuzzleLines(Puzzle, Linhas) :- trim(Puzzle, ) isLineValid()

% getLine(Puzzle, Index, Line) :- 

trimFront(L,N,S) :-    % to trim N elements from a list
  length(P,N) ,   % - generate an unbound prefix list of the desired length
  append(P,S,L) . % - and use append/3 to get the desired suffix.

trimBack(Old, N, New) :-
    length(Tail, N),
    append(New, Tail, Old).

trim(L, N1, N2, New) :- N1 #=< N2, length(L, X), K #= X - N2,  trimFront(L, N1, S), trimBack(S, K, New).

% cropFromXtoY(X, Y, _, []) :- X #>= Y, !.
% cropFromXtoY(X, Y, [_|T], S) :- X #\= 0, X1 #= X-1, cropFromXtoY(X1,Y, T, S),!.
% cropFromXtoY(X, Y, [H|T], S) :- , cropFromXtoY(X,Y, T, [H|S]),!.

% dados(0,0,[]).
% dados(0,N,[1,2,3,4,5]):- N \= 0,!.
% dados(1,N,[N]):- N =< 6, N > 0,!.
% dados(1,N,[]):- N > 6, N < 1,!.
% dados(D,S,[X|L]):- face(X), NS is S - X, ND is D-1, dados(ND,NS,L), length([X|L],D).


insereFim(X,[H|[]],[H,X|[]]).
insereFim(X,[H|T],[H|L]):-insereFim(X,T,L).

%  Retorna uma lista rotacionada N vezes
rotacionaN(0,L,L):-!.
rotacionaN(_,[],[]).
rotacionaN(N,[H|T],L):- insereFim(H,T,L1),N1 is N-1,rotacionaN(N1,L1,L).

% Cria uma lista de 1 até N
do_list(N, L):- 
    findall(Num, between(1, N, Num), L).

% Rotaciona X vezes para X membro da lista de 1 até tamanho da lista passada.
rotacoes(L1,L2):- length(L1,X), do_list(X,L), member(N,L), rotacionaN(N,L1,L2).

% ?- rotacoes([1,2,3,4],L).
% L = [2, 3, 4, 1] ;
% L = [3, 4, 1, 2] ;
% L = [4, 1, 2, 3] ;
% L = [1, 2, 3, 4] ;
% false.


list_to(N, L) :- list_toOP(N,L1),reverse(L1,L).

list_toOP(0, []):- !.
list_toOP(N, [N|L]) :- N1 is N -1, list_toOP(N1, L).