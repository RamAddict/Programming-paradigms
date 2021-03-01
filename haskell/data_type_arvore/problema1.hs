---------------------------------------- LISTA DE DATA, TYPE E ARVORE ----------------------------


--Q1
type Nome = String
type Disciplina = String
type Nota1 = Float
type Nota2 = Float
type Nota3 = Float
type Aluno = (Nome, Disciplina, Nota1, Nota2, Nota3)

aluno :: Int -> Aluno
aluno 1 = ("Favarin", "Org", 2.5, 8.5, 6)
aluno 2 = ("Zinho", "Calculo 1", 2, 5, 7)

primeiroNome :: Aluno -> Nome
primeiroNome (nome, _, _, _, _) = nome

media :: Int -> Float
media n = (n1 + n2 + n3)/3 where (_, _, n1, n2, n3) = (aluno n)

somaNotas :: Int -> Float
somaNotas 0 = 0
somaNotas n = media n + somaNotas (n-1)

mediaTurma :: Float
mediaTurma = (somaNotas 2) / 2

main = do
    print (mediaTurma)

