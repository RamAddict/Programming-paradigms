% Cores das camisas 
camiseta(amarela).
camiseta(azul).
camiseta(branca).
camiseta(verde).
camiseta(vermelha).

% Nomes dos sujeitos
nome(antonio).
nome(cesar).
nome(juan).
nome(rodolfo).
nome(vicente).

% apartamentos
apto(15).
apto(32).
apto(61).
apto(94).
apto(123).

% reclamacoes
reclamacao(barulho).
reclamacao(garagem).
reclamacao(limpeza).
reclamacao(manutencao).
reclamacao(seguranca).

% idades
idade(30).
idade(35).
idade(40).
idade(45).
idade(50).

% profissoes
profissao(arquiteto).
profissao(comerciante).
profissao(farmaceutico).
profissao(joalheiro).
profissao(produtor).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

head([H|_], H).

nasPontas(X, Lista) :- last(Lista, X) ; head(Lista, X).

aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), nth0(IndexY,Lista,Y),
IndexX < IndexY.

aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista).

aoLado(X,Y,Lista) :- nextto(X,Y,Lista) ; nextto(X,Y,Lista).

% Y X Z 
estaEntre(X,Y,Z,Lista) :- aDireita(Z, X, Lista), aEsquerda(Y, X, Lista).

exatamenteEsquerda(X, Y, Lista) :- nextto(X, Y, Lista).

exatamenteDireita(X, Y, Lista) :- nextto(Y, X, Lista).

solucao(ListaSolucao) :-
    ListaSolucao = [
      morador(Camiseta1, Nome1, Apto1, Reclamacao1, Idade1, Profissao1),
      morador(Camiseta2, Nome2, Apto2, Reclamacao2, Idade2, Profissao2),
      morador(Camiseta3, Nome3, Apto3, Reclamacao3, Idade3, Profissao3),
      morador(Camiseta4, Nome4, Apto4, Reclamacao4, Idade4, Profissao4),
      morador(Camiseta5, Nome5, Apto5, Reclamacao5, Idade5, Profissao5)
    ],
% O Comerciante está ao lado do morador que está cobrando mais Manutenção no condomínio.
aoLado(morador(_, _, _, _, _, comerciante),
       morador(_, _, _, manutencao, _, _), ListaSolucao),

% O morador de Verde está reclamando da Limpeza do prédio.
member(morador(verde, _, _, limpeza, _, _), ListaSolucao),

% O Joalheiro está exatamente à esquerda do condômino de 45 anos.
exatamenteEsquerda(morador(_, _, _, _, _, joalheiro), 
                   morador(_, _, _, _, 45, _), ListaSolucao),

% César está exatamente à esquerda de quem está reclamando de Barulho.
exatamenteEsquerda(morador(_, cesar, _, _, _, _),
                   morador(_, _, _, barulho, _, _), ListaSolucao),

% O Farmacêutico mora no apartamento 94.
member(morador(_, _, 94, _, _, farmaceutico), ListaSolucao),

% O homem de Verde está em algum lugar entre o homem de 35 anos e o homem de Vermelho, nessa ordem.
estaEntre(morador(verde, _, _, _, _, _), 
          morador(_, _, _, _, 35, _), morador(vermelha, _, _, _, _, _), ListaSolucao),

% O Arquiteto está ao lado do condômino que reclama do Barulho no prédio.
aoLado(morador(_, _, _, _, _, arquiteto), morador(_, _, _, barulho, _, _), ListaSolucao),

% % Antônio está na quinta posição.
Nome5 = antonio,

% O Comerciante está ao lado do homem mais velho.
aoLado(morador(_, _, _, _, _, comerciante), morador(_, _, _, _, 50, _), ListaSolucao),

% O morador de Branco está exatamente à direita do morador que reclama da Manutenção.
exatamenteDireita(morador(branca, _, _, _, _, _), morador(_, _, _, manutencao, _, _), ListaSolucao),

% O Joalheiro tem 40 anos.
member(morador(_, _, _, _, 40, joalheiro), ListaSolucao),

% O condômino de camiseta Azul está ao lado do morador do apartamento 61.
aoLado(morador(azul, _, _, _, _, _), morador(_, _, 61, _, _, _), ListaSolucao),

% O Arquiteto está exatamente à direita de quem está reclamando da Garagem.
exatamenteDireita(morador(_, _, _, _, _, arquiteto), morador(_, _, _, garagem, _, _), ListaSolucao),

% Em uma das pontas está o morador do apartamento 123.
nasPontas(morador(_, _, 123, _, _, _), ListaSolucao),

% Juan está exatamente à direita do Joalheiro.
exatamenteDireita(morador(_, juan, _, _, _, _), morador(_, _, _, _, _, joalheiro), ListaSolucao),

% O morador de Azul está exatamente à esquerda de quem está reclamando da Manutenção.
exatamenteEsquerda(morador(azul, _, _, _, _, _), morador(_, _, _, manutencao, _, _), ListaSolucao),

% O condômino do apartamento 32 está exatamente à esquerda do Comerciante.
exatamenteEsquerda(morador(_, _, 32, _, _, _), morador(_, _, _, _, _, comerciante), ListaSolucao),

% O homem mais novo está em algum lugar à direita do morador de Azul.
aDireita(morador(_, _, _, _, 30, _), morador(azul, _, _, _, _, _), ListaSolucao),

% Vicente está em algum lugar entre o Rodolfo e o Juan, nessa ordem.
estaEntre(morador(_, vicente, _, _, _, _),
          morador(_, rodolfo, _, _, _, _), morador(_, juan, _, _, _, _), ListaSolucao),

% O condômino mais velho está exatamente à esquerda do Farmacêutico.
exatamenteEsquerda(morador(_, _, _, _, 50, _), morador(_, _, _, _, _, farmaceutico), ListaSolucao),

camiseta(Camiseta1),
camiseta(Camiseta2),
camiseta(Camiseta3),
camiseta(Camiseta4),
camiseta(Camiseta5),
todosDiferentes([Camiseta1, Camiseta2, Camiseta3, Camiseta4, Camiseta5]),

nome(Nome1),
nome(Nome2),
nome(Nome3),
nome(Nome4),
nome(Nome5),
todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),

apto(Apto5),
apto(Apto4),
apto(Apto3),
apto(Apto2),
apto(Apto1),
todosDiferentes([Apto1,Apto2,Apto3,Apto4,Apto5]),

reclamacao(Reclamacao1),
reclamacao(Reclamacao2),
reclamacao(Reclamacao3),
reclamacao(Reclamacao4),
reclamacao(Reclamacao5),
todosDiferentes([Reclamacao1,Reclamacao2,Reclamacao3,Reclamacao4,Reclamacao5]),

idade(Idade1),
idade(Idade2),
idade(Idade3),
idade(Idade4),
idade(Idade5),
todosDiferentes([Idade1,Idade2,Idade3,Idade4,Idade5]),

profissao(Profissao1),
profissao(Profissao2),
profissao(Profissao3),
profissao(Profissao4),
profissao(Profissao5),
todosDiferentes([Profissao1,Profissao2,Profissao3,Profissao4,Profissao5]).
