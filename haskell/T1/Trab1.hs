import Data.List

--  Máximo valor permitido no Wolkenkratzer
maxValue :: Int
maxValue = 4

-- Define a largura do Wolkenkratzer
puzzleSize :: Int
puzzleSize = 5

-- Todas as soluções de um linha sem restrições
allPossibleOptions :: [[Int]]
allPossibleOptions | (maxValue == puzzleSize) = permutations [1..maxValue]
                   | otherwise =  excludeEquals (allPermutations (includeZeros (powerSet [1..maxValue])))


-- Nossa estrutura de dados principal para representar o Wolkenkratzer
data Game = G [Linha]
-- A Linha representa a cada linha do Wolkenkratzer 
-- Os 2 inteiros de cada lado representam de maneira intuitiva as alturas
data Linha = L Int [Int] Int
-- Uma linha correta dada 2 números de altura
-- para teste
myCorrectLine :: Linha
myCorrectLine = (L 2 [4,5,2,1,3] 0)
-- Um jogo corretamente resolvido para teste
myCorrectGame :: Game
myCorrectGame = (G [(L 1 [5,3,1,4,2] 3), (L 4 [1,2,3,5,4] 2), (L 3 [3,4,5,2,1] 3), (L 2 [4,5,2,1,3] 0), (L 0 [2,1,4,3,5] 1), (L 0 [5,1,3,4,2] 0), (L 3 [3,2,4,5,1] 2) , (L 3 [1,3,5,2,4] 2), (L 0 [4,5,2,1,3] 2), (L 0 [2,4,1,3,5] 1)])
-- Um jogo sem solução


myEmpty51 :: Game
myEmpty51 = (G [(L 1 [] 3), (L 4 [] 2), (L 3 [] 3), (L 2 [] 0), (L 0 [] 1), (L 0 [] 0), (L 3 [] 2) , (L 3 [] 2), (L 0 [] 2), (L 0 [] 1)])

myEmpty50 :: Game
myEmpty50 = (G [(L 0 [] 4) ,(L 0 [] 0) ,(L 0 [] 3) ,(L 0 [] 1) ,(L 0 [] 0) ,(L 0 [] 3) ,(L 0 [] 4) ,(L 0 [] 2) ,(L 3 [] 1) ,(L 0 [] 0)])

myEmpty40 :: Game
myEmpty40 = (G [(L 1 [] 0), (L 2 [] 0), (L 3 [] 0), (L 0 [] 0), (L 0 [] 0), (L 0 [] 0), (L 0 [] 0) , (L 0 [] 0)])

myEmpty40O :: Game
myEmpty40O = (G [(L 0 [] 0), (L 0 [] 0), (L 0 [] 0), (L 0 [] 0), (L 0 [] 0), (L 0 [] 0), (L 0 [] 0) , (L 0 [] 0)])


myHalfCorrect40h :: Game
myHalfCorrect40h = (G [(L 1 [4,2,3,1] 0), (L 2 [3,1,4,2] 0), (L 3 [1,3,2,4] 0), (L 0 [2,4,1,3] 0), (L 0 [] 0), (L 0 [] 0), (L 0 [] 0) , (L 0 [] 0)])

-- myHalfCorretGame :: Game
-- myHalfCorretGame = (G [(L 1 [5,3,1,4,2] 3), (L 4 [1,2,3,5,4] 2), (L 3 [3,4,5,2,1] 3), (L 2 [4,5,2,1,3] 0), (L 0 [2,1,4,3,5] 1), (L 0 [] 0), (L 3 [] 2) , (L 3 [] 2), (L 0 [] 2), (L 0 [] 1)])

myEmpty61 :: Game
myEmpty61 = (G [(L 3 [] 2), (L 4 [] 1), (L 3 [] 2), (L 3 [] 3), (L 2 [] 4), (L 1 [] 4), (L 3 [] 1) , (L 2 [] 2), (L 2 [] 2), (L 2 [] 3), (L 1 [] 5), (L 2 [] 4)])


-- Verifica se a linha está correta analisando 
-- as alturas
verificaLinhaValida :: Linha -> Bool
verificaLinhaValida (L x a y) = (verificaDir x a)  && (verificaDir y (reverse $ a))
-- Recebe uma altura e a linha e retorna se a altura
-- informada é vista da esquerda 
verificaDir :: Int -> [Int] -> Bool
verificaDir _ [] = False
verificaDir 0 _ = True
verificaDir n (a:b) = nPredios (a:b) == n

--  Calcula quantidade de predios vistos de determinado lugar
nPredios :: [Int] -> Int
nPredios [] = 0
nPredios a = nPrediosOP a 0
  where   nPrediosOP [] _ = 0
          nPrediosOP (a:b) atualMaior | (a > atualMaior) = 1 + (nPrediosOP b a)
                                      | otherwise = nPrediosOP b atualMaior


--  Verifica se linha possui elementos repetidos
repeatsElement :: Linha -> Bool
repeatsElement (L x [] y) = False
repeatsElement (L x (a:b) y) | (elem a b) = True
                             | otherwise = repeatsElement (L x b y)


--  Verifica corretude do jogo todo
verificaCorretude :: Game -> Bool
verificaCorretude (G []) = True
verificaCorretude (G (a:c)) = ((verificaLinhaValida a) && (not (repeatsElement a)))  && verificaCorretude (G c)


--  Pega valores preenchidos de uma determinada linha
getValues :: Linha -> [Int]
getValues (L _ linha _) = linha

-- Pega determinada linha de um jogo
getLinhaG :: Int -> Game -> Linha
getLinhaG 1 (G (a:b)) = a
getLinhaG n (G (a:b)) = getLinhaG (n-1) (G b)

--  Pega, dentre todas as possibilidade de soluções de uma linha, aquelas que são válidas
getOptions :: Linha -> [[Int]]
getOptions (L x [] y) = [a | a <- allPossibleOptions, verificaLinhaValida (L x a y)]
getOptions (L _ a _) = [] 

--  Conjunto potencia
powerSet :: [Int] -> [[Int]]
powerSet [] = [[]]
powerSet (x:xs) = [x:ps | ps <- powerSet xs] ++ powerSet xs

-- Exclui elementos repetidos em uma lista
excludeEquals :: [[Int]] -> [[Int]]
excludeEquals [] = []
excludeEquals (a:b) | (elem a b) = excludeEquals b
                    | otherwise = [a]++(excludeEquals b)


--  Concatena permutações de todas as listas           
allPermutations :: [[Int]] -> [[Int]]
allPermutations [] = []
allPermutations (a:b) = (permutations a)++(allPermutations b)


--  Preenche linhas com 0's quando necessário, afim de abarcar todas as possíveis soluções
includeZeros :: [[Int]] -> [[Int]]
includeZeros [] = []
includeZeros (a:b) | ((length a) == (puzzleSize-1)) = [a++[0]]++(includeZeros b)
                   | ((length a) == (puzzleSize)) = [a]++(includeZeros b)
                   | otherwise = (includeZeros b)


--  Pega as linhas referentes a colunas de uma lista de linhas
getColumns :: [Linha] -> [Linha]
getColumns a = getColumnsOP a (div (length (a)) 2)
    where getColumnsOP (a:as) 1 = as
          getColumnsOP (a:as) n = getColumnsOP as (n-1)

--  Dado as linhas, preenche as colunas com os valores correspondentes
fillAllColumns :: Game -> Game
fillAllColumns esteJogo = colOperator (esteJogo) (1)
    where colOperator jogo n | (n == (puzzleSize+1)) = jogo
                             | otherwise = (colOperator (writeLineG (jogo) (fillColumn n jogo) (n+puzzleSize)) (n+1))


--  Transforma linhas em uma coluna correspondente                          
fillColumn :: Int -> Game -> Linha
fillColumn n (G a) = (L (getX (getLinhaG (n+puzzleSize) (G a))) (operator n [getValues (getLinhaG i (G a)) | i <- [1..puzzleSize]])  (getY (getLinhaG (n+puzzleSize) (G a))))
        where operator n [] = []
              operator n (a:b) = [(a!!(n-1))]++(operator n b)


--  Printa determinada linha
printLinha :: Linha -> IO()
printLinha (L x list y) = print(show(x)++show(list)++show(y))

-- Pega valores dos X's das colunas para printar
getColumnX :: [Linha]-> String
getColumnX [] = ""
getColumnX (a:b) = " "++ show(getX a)++getColumnX b

-- Pega valores dos Y's das colunas para printar
getColumnY :: [Linha]-> String
getColumnY [] = ""
getColumnY (a:b) = " "++ show(getY a)++getColumnY b


--  Mostra um jogo
printGame :: Game -> IO()
printGame (G a) = do
    print("--------------------------")
    print(" "++getColumnX collumns)
    printGameOP (G a) (div (length $ a) 2)
    print(" "++getColumnY collumns)
    print("--------------------------")
    where collumns = getColumns a
          
--  Função auxiliar de printGame
printGameOP :: Game -> Int -> IO()
printGameOP j@(G a) 0 = putStr ("")
printGameOP j@(G (a:b)) n = do
    printLinha a
    printGameOP (G b) (n-1)
    
-- Pega o valor a ser visto a esquerda de determinada linha    
getX :: Linha -> Int
getX (L x _ _) = x

-- Pega o valor a ser visto a direita de determinada linha
getY :: Linha -> Int
getY (L _ _ y) = y

-- Solucionador do jogo por exaustão usando backtrack, mostra todas as possíveis soluções
solveGame :: Game -> Int -> IO (Maybe Game)
solveGame thisGame n  
--  Implementação da iteração sobre linhas, caso esteja na linha (puzzleSize+1)
--  significa que preenchi um novo valor na ultima linha
    | (n == (puzzleSize+1)) = do
--  caso preenchi última linha, preencho as colunas com os valores correspondentes
--  e verifico se é uma solução do jogo, caso seja, mostro o jogo, caso não, não faço nada.
        if (verificaCorretude (fillAllColumns thisGame))
                then do
                    -- print("Esse jogo e uma solucao correta")
                    printGame thisGame >> return (Just thisGame)
        else do
            -- print("Terminou sem retornar nada")
            return Nothing
--  Caso não tenha preenchido todas as linhas,
--  Se minha linha atual não estiver preenchida, tento uma de suas soluções com backtrack               
    | otherwise = do v <- return (getLinhaG n thisGame)
                     case v of
                             (L x [] y) -> gameBackTrack thisGame n (getOptions v) 
                             _  -> solveGame thisGame (n+1)

gameBackTrack :: Game -> Int -> [[Int]] -> IO (Maybe Game)
--  Caso não exista mais uma solução possível retorna nada
gameBackTrack thisGame n [] = do
    -- print("sem nova opcao na linha "++show(n))
    return Nothing
-- Caso ainda exista uma solução possível, preenche o jogo com ela e faz o backtrack
gameBackTrack thisGame n (v:vs) = do
    -- print("tentando com "++show(v)++" na linha "++show(n))
    -- print("opcoes restantes sao"++show(vs))
    -- printGame (writeLineG thisGame (L lineX v lineY) n)
-- Implementação do backtrack, tenta solucionar o jogo apartir da escolha atual
    solveGame (writeLineG thisGame (L lineX v lineY) n) n
-- Faz backtrack tirando a escolha atual das opções possíveis    
    gameBackTrack (writeLineG thisGame (L lineX [] lineY) n) n vs
   
    where lineX = getX (getLinhaG n thisGame)
          lineY = getY (getLinhaG n thisGame)

-- Escreve determinada linha em uma dada posição do jogo
writeLineG :: Game -> Linha -> Int -> Game
writeLineG (G lista) linha n = (G (lineOperator lista linha n))
    where lineOperator (l:ls) linha 1 =  [linha]++ls
          lineOperator (l:ls) linha n = [l]++lineOperator ls linha (n-1)



main = do
-- solveGame myEmpty40O 1
solveGame myEmpty50 1
-- solveGame myEmpty61 1