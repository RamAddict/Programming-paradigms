import Control.Concurrent
import System.Posix.Process

myMatrix1 = [[2,7,6],
        [9,5,1],
        [4,3,8]]


myMatrix2 =   [[1,0,0],
        [0,0,1],
        [0,1,0]]

myMatrix3 =   [[1,0,0],
        [0,0,1],
        [0,1,1]]



mySudoku = [[1, 3, 2, 5, 7, 9, 4, 6, 8],
        [4, 9, 8, 2, 6, 1, 3, 7, 5],
        [7, 5, 6, 3, 8, 4, 2, 1, 9],
        [6, 4, 3, 1, 5, 8, 7, 9, 2],
        [5, 2, 1, 7, 9, 3, 8, 4, 6],
        [9, 8, 7, 4, 2, 6, 5, 3, 1],
        [2, 1, 4, 9, 3, 5, 6, 8, 7],
        [3, 6, 5, 8, 1, 7, 9, 2, 4],
        [8, 7, 9, 6, 4, 2, 1, 5, 3]]





myEmptyMagicSquare= [[0 ,12, 12],
                    [16, 10, 0],
                    [8 ,0, 0]]

myEmptyMagicSquare2 = [[0, 468, 0], 
                       [0,522,414],
                       [441,0,549]] 

myEmptyMagicSquare3 =  [[0, 0, 8], 
                        [9,0,1],
                        [0,7,0]] 

myEmptyMagicSquare4 =  [[0, 9, 0], 
                        [3,0,0],
                        [8,0,6]] 

myEmptyMagicSquare5 =  [[0,0,4], 
                        [0,0,3],
                        [6,0,8]] 



myEmptyMagicSquare6 =  [[0,0,2], 
                        [1,0,0],
                        [8,3,0]] 

myCompletelyEmptyMagicSquare =  [[0 | a <- [1..3]] | n <- [1..3]]

myEmptySudoku = [[0, 5, 0, 0, 6, 0, 0, 0, 1],
                [0, 0, 4, 8, 0, 0, 0, 7, 0],
                [8, 0, 0, 0, 0, 0, 0, 5, 2],
                [2, 0, 0, 0, 5, 7, 0, 3, 0],
                [0, 0, 0, 0, 0, 0, 0, 0, 0],
                [0, 3, 0, 6, 9, 0, 0, 0, 5],
                [7, 9, 0, 0, 0, 0, 0, 0, 8],
                [0, 1, 0, 0, 0, 6, 5, 0, 0],
                [5, 0, 0, 0, 3, 0, 0, 6, 0]]

myHardSudoku = [[0, 0, 0, 0, 6, 0, 0, 8, 0],
                [0, 2, 0, 0, 0, 0, 0, 0, 0],
                [0, 0, 1, 0, 0, 0, 0, 0, 0],
                [0, 7, 0, 0, 0, 0, 1, 0, 2],
                [5, 0, 0, 0, 3, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0, 4, 0, 0],
                [0, 0, 4, 2, 0, 1, 0, 0, 0],
                [3, 0, 0, 7, 0, 0, 6, 0, 0],
                [0, 0, 0, 0, 0, 0, 0, 5, 0]] 
                
myCompletelyEmptySudoku = [[0 | a <- [1..9]] | n <- [1..9]]



somaLinha :: [Int] -> Int
somaLinha [] = 0
somaLinha (a:b) = a + somaLinha b

transpose:: [[a]]->[[a]]
transpose ([]:_) = []
transpose x = (map head x) : transpose (map tail x)

somaElementos :: [[Int]] -> Int
somaElementos [] = 0
somaElementos (a:as) = somaLinha a + somaElementos as

getLinha :: [[Int]] -> Int -> [Int]
getLinha [] _ = []
getLinha (a:b) 1 = a
getLinha (a:b) n = getLinha b (n-1)

getElement :: [Int] -> Int -> Int
getElement [] _ = -1
getElement (a:b) 1 = a
getElement (a:b) n = getElement b (n-1)


somaMatrizes :: [[Int]] -> [[Int]] -> Int
somaMatrizes a b = (somaElementos a) + (somaElementos b)


getXY :: [[Int]] -> Int -> Int -> Int
getXY m x y = getElement (getLinha m x) y

lineContains :: [Int] -> Int -> Bool
lineContains [] _ = False
lineContains (a:b) n = (a == n) || lineContains b n


matrixContains :: [[Int]] -> Int -> Bool
matrixContains [] _ = False
matrixContains (a:b) n = (lineContains a n) || matrixContains b n

matrixRepeat :: [[Int]] -> Bool
matrixRepeat m = (length $ [a | a <- [1..n*n], matrixContains m a]) /= (n*n)
    where n = (length $ m)


verificaSoma :: [[Int]] -> Int -> Bool
verificaSoma [] _ = True
verificaSoma (a:b) magicCostant | (somaLinha a) == (magicCostant) = verificaSoma b magicCostant
                                | otherwise = False

somaDiagonal :: [[Int]] -> Int
somaDiagonal [] = 0
somaDiagonal a = somaLinha [getXY a x y| x <- [1..(length $ a)], y <- [1..(length $ a)], (x==y)] 

somaDiagonal2 :: [[Int]] -> Int
somaDiagonal2 [] = 0
somaDiagonal2 a = somaLinha [getXY a x y| x <- [1..(length $ a)], y <- [1..(length $ a)], ((x+y)==4)]

somaDiagonais :: [[Int]] -> Bool
somaDiagonais a = ((somaDiagonal a) == magicCostant) && ((somaDiagonal2 a) == magicCostant)
    where magicCostant = somaLinha (a!!0)


verificaQuadradoMagico :: (Maybe [[Int]]) -> Bool
verificaQuadradoMagico Nothing = False
verificaQuadradoMagico (Just a) = 
    ((somaDiagonais a) && (verificaSoma a magicCostant) && (verificaSoma (transpose a) magicCostant) && (not (matrixRepeat a)))
    where magicCostant = somaLinha (a!!0)

verificaQuadradoMagicoWithRepetition :: (Maybe [[Int]]) -> Bool
verificaQuadradoMagicoWithRepetition Nothing = False
verificaQuadradoMagicoWithRepetition (Just a) = 
    ((somaDiagonais a) && (verificaSoma a magicCostant) && (verificaSoma (transpose a) magicCostant))
    where magicCostant = somaLinha (a!!0)

removeZeros :: [Int] -> [Int]
removeZeros [] = []
removeZeros (a:b) | (a /= 0) = [a] ++ (removeZeros b)
                | otherwise = removeZeros b

verificaPermutacao :: [[Int]] -> Bool
verificaPermutacao [] = True
verificaPermutacao (a:b)  | (((length $ (removeZeros a)) == 1) && (((removeZeros a)!!0) == 1))  = verificaPermutacao b
                        | otherwise = False


linhaValida :: [Int] -> Bool
linhaValida a = (length $ [i | i <- [1..9], lineContains a i]) == 9

verificaLinhasSudoku :: [[Int]] -> Bool
verificaLinhasSudoku [] = True
verificaLinhasSudoku (a:b) = linhaValida a && verificaLinhasSudoku b

verificaColunasSudoku :: [[Int]] -> Bool
verificaColunasSudoku s = verificaLinhasSudoku (transpose s)

getNRegiao :: [[Int]] -> Int -> [Int]
getNRegiao sudoku n | (n == 1) =  [getXY sudoku x y | x <- [1..3], y <- [1..3]]
                    | (n == 2) =  [getXY sudoku x y | x <- [1..3], y <- [4..6]]
                    | (n == 3) =  [getXY sudoku x y | x <- [1..3], y <- [7..9]]
                    | (n == 4) =  [getXY sudoku x y | x <- [4..6], y <- [1..3]]
                    | (n == 5) =  [getXY sudoku x y | x <- [4..6], y <- [4..6]]
                    | (n == 6) =  [getXY sudoku x y | x <- [4..6], y <- [7..9]]
                    | (n == 7) =  [getXY sudoku x y | x <- [7..9], y <- [1..3]]
                    | (n == 8) =  [getXY sudoku x y | x <- [7..9], y <- [4..6]]
                    | otherwise =  [getXY sudoku x y | x <- [7..9], y <- [7..9]]

getRegiao :: [[Int]] -> Int -> Int -> [Int]
getRegiao sudoku a b    | ((a <= 3) && (b <= 3)) =  [getXY sudoku x y | x <- [1..3], y <- [1..3]]
                        | ((a <= 3) && (b <= 6)) =  [getXY sudoku x y | x <- [1..3], y <- [4..6]]
                        | ((a <= 3) && (b <= 9)) =  [getXY sudoku x y | x <- [1..3], y <- [7..9]]
                        | ((a <= 6) && (b <= 3)) =  [getXY sudoku x y | x <- [4..6], y <- [1..3]]
                        | ((a <= 6) && (b <= 6)) =  [getXY sudoku x y | x <- [4..6], y <- [4..6]]
                        | ((a <= 6) && (b <= 9)) =  [getXY sudoku x y | x <- [4..6], y <- [7..9]]
                        | ((a <= 9) && (b <= 3)) =  [getXY sudoku x y | x <- [7..9], y <- [1..3]]
                        | ((a <= 9) && (b <= 6)) =  [getXY sudoku x y | x <- [7..9], y <- [4..6]]
                        | otherwise =  [getXY sudoku x y | x <- [7..9], y <- [7..9]]


verificaRegioes :: [[Int]] -> Bool
verificaRegioes [] = True
verificaRegioes a = (length $ [i | i <- [1..9], linhaValida (getNRegiao a i)]) == 9

verificaSudoku :: [[Int]] -> Bool
verificaSudoku sudoku = (verificaLinhasSudoku sudoku) && (verificaColunasSudoku sudoku) && (verificaRegioes sudoku)

options :: [Int]
options = [1..9]

remove :: Int -> [Int] -> [Int]
remove deleted xs = [ x | x <- xs, x /= deleted ]

getColuna :: [[Int]] -> Int -> [Int]
getColuna a n = getLinha (transpose a) n


--  Removes elements in list a that appear in b and returns a
removeOptionsFrom :: [Int] -> [Int] -> [Int]
removeOptionsFrom [] _ = []
removeOptionsFrom a [] = a
removeOptionsFrom a (b:bs) | (elem b a) = removeOptionsFrom (remove b a) bs
                           | otherwise = removeOptionsFrom a bs 

uniao :: [Int] -> [Int] -> [Int]
uniao a [] = a
uniao [] b = b
uniao a (b:bs) | (elem b a) = uniao a bs
               | otherwise = uniao (a++[b]) bs

getOptions :: [[Int]] -> Int -> Int -> [Int]
getOptions a x y = removeZeros (removeOptionsFrom (removeOptionsFrom (removeOptionsFrom options (getLinha a x))  (getColuna a y)) (getRegiao a x y))




-- - the meat of the program.  Checks the current square.
-- -- If 0, then get the list of nums and try to "solve' "
-- -- Otherwise, go to the next square.
-- solve :: SodokuBoard  -> (Int, Int) -> IO (Maybe SodokuBoard)
-- solve a (10,y) = solve a (1,y+1)
-- solve a (_, 10)= printSodokuBoard a >> return (Just a)
-- solve a (x,y)  = do v <- readBoard a (x,y)
-- case v of
--     0 -> availableNums a (x,y) >>= solve' a (x,y)
--     _ ->  solve a (x+1,y)
--     -- solve' handles the backtacking
--     where solve' a (x,y) []     = return Nothing
--     solve' a (x,y) (v:vs) = do writeBoard a (x,y) v   -- put a guess onto the board
--     r <- solve a (x+1,y)
--     writeBoard a (x,y) 0   -- remove the guess from the board
--     solve' a (x,y) vs      -- recurse over the remainder of the list

writeLine :: [Int] -> Int -> Int ->[Int]
writeLine [] _ _ = []
writeLine (a:xs) 1 n = [n] ++ xs
writeLine (a:xs) i n = [a]++(writeLine xs (i-1) n)

writeBoard :: [[Int]] -> Int -> Int -> Int -> [[Int]]
writeBoard [] _ _ _ = []
writeBoard (s:rs) x y n | (x == 1) = [writeLine s y n]++rs
                        | otherwise = [s] ++ writeBoard rs (x-1) y n


solveMagicSquare :: [[Int]] -> Int -> Int -> IO (Maybe [[Int]])
solveMagicSquare a 4 y = solveMagicSquare a 1 (y+1)
solveMagicSquare a _ 4 | (verificaQuadradoMagicoWithRepetition (Just a)) = printMatrix a >> return (Just a)
                       | otherwise = return Nothing
solveMagicSquare a x y = do v <- return (getXY a x y)
                            case v of 
                                0 ->  (solveBackTrack a x y [1..20])
                                _ -> solveMagicSquare a (x+1) y
    


solveBackTrack :: [[Int]] -> Int -> Int -> [Int] -> IO (Maybe [[Int]])
solveBackTrack a x y [] = return Nothing
solveBackTrack a x y (v:vs) = do 
        solveMagicSquare (writeBoard a x y v) (x+1) y
        solveBackTrack (writeBoard a x y 0) x y vs


printMatrixOP :: [[Int]] -> IO ()
printMatrixOP [] = print("-------------------")
printMatrixOP (a:b) = do
        print(a)
        printMatrixOP b

printMatrix :: [[Int]] -> IO ()
printMatrix [] = putChar('.')
printMatrix a = do
        pri(" ")
        print("-------------------")
        printMatrixOP a

solveSudoku :: [[Int]] -> Int -> Int -> IO ()
solveSudoku a 10 y = solveSudoku a 1 (y+1)
solveSudoku a _ 10 | (verificaSudoku a) =  printMatrix a
                   | otherwise = print()
solveSudoku a x y | (getXY a x y) == 0 = (sudokuBackTrack a x y (getOptions a x y)) 
                  | otherwise = solveSudoku a (x+1) y
-- solveSudoku a x y = do v <- return (getXY a x y)
--                        case v of 
--                            0 ->  (sudokuBackTrack a x y (getOptions a x y))
--                            _ -> solveSudoku a (x+1) y

sudokuBackTrack :: [[Int]] -> Int -> Int -> [Int] -> IO ()
sudokuBackTrack a x y [] = do 
        -- print("sem opcao possivel em ("++show(x)++","++show(y)++"). backtrack")
        printMatrix []
sudokuBackTrack a x y (v:vs) = do 
        -- print("tentando com "++show(v)++" na posicao ("++show(x)++","++show(y)++").")
        -- print("as opcoes restantes sao:"++show(vs))
        -- printMatrix(writeBoard a x y v)

        children <- myForkIO (do
                solveSudoku (writeBoard a x y v) (x+1) y
                sudokuBackTrack (writeBoard a x y 0) x y vs)

        takeMVar children

        myForkIO :: IO () -> IO (MVar ())
        myForkIO io = do
                mvar <- newEmptyMVar
                forkFinally io (\_ -> putMVar mvar ())
                return mvar        


-- ghc -O3 -o ben L9/q8.hs -threaded
-- time ./ben  +RTS -N -s > kel.txt
        
main = do
        
        --------- TESTING CREATED FUNCTIONS ---------
--     print(somaElementos myMatrix1)
--     print(somaMatrizes myMatrix1 myMatrix1)
    -- print(getXY myMatrix1 3 1)
    -- print(matrixRepeat myMatrix1)
    -- print(verificaSoma myMatrix1 (somaLinha (myMatrix1!!1)))
    -- print(verificaSoma (transpose myMatrix1) (somaLinha (myMatrix1!!1)))
    -- print(myMatrix1)
    -- print(transpose myMatrix1)
    -- print((somaLinha (myMatrix1!!1)) == somaDiagonal2 myMatrix1)
--     print(verificaQuadradoMagico (Just myMatrix1))
    -- print(verificaPermutacao myMatrix2)
    -- print(verificaPermutacao myMatrix3)
    --print(linhaValida [1..9])
    -- print(verificaColunasSudoku (transpose [[1..9],[1..9],[1..9],[1..9],[1..9],[1..9]]))
    -- print(getRegiao [[1..9],[1..9],[1..9],[1..9],[1..9],[1..9]] 2)
    -- print(verificaSudoku mySudoku)
    -- print(getLinha mySudoku 1)
    -- print(getColuna mySudoku 1)
    -- print(getRegiao mySudoku 9 9)
    -- print(uniao [1..9] [9..19])
    -- print(getOptions myEmptySudoku 5 5)
    
    ------ SOLVING MAGIC SQUARES ------

--     print("Trying to solve magic square:")
--     print(myEmptyMagicSquare)
--     print("The solution is:")
--     solveMagicSquare myEmptyMagicSquare 1 1

--     print("Trying to solve magic square:")
--     print(myEmptyMagicSquare2)
--     print("The solution is:")
--     solveMagicSquare myEmptyMagicSquare2 1 1

--     print("Trying to solve magic square:")
--     print(myEmptyMagicSquare3)
--     print("The solution is:")
--     solveMagicSquare myEmptyMagicSquare3 1 1

--     print("Trying to solve magic square:")
--     print(myEmptyMagicSquare4)
--     print("The solution is:")
--     solveMagicSquare myEmptyMagicSquare4 1 1

--     print("Trying to solve magic square:")
--     print(myEmptyMagicSquare5)
--     print("The solution is:")
--     solveMagicSquare myEmptyMagicSquare5 1 1


---------- SHOWING ALL POSSIBLE MAGIC SQUARES ---------

--     print("Creating all possible magic squares 0..9")
--     solveMagicSquare myCompletelyEmptyMagicSquare 1 1

------- SOLVING SUDOKU -----------

    print("Trying to solve sudoku:")
    printMatrix (myEmptySudoku)
    print("The solution is:")
    solveSudoku myEmptySudoku 1 1
    
    print("Trying to solve sudoku:")
    printMatrix (myHardSudoku)
    print("The solution is:")
    solveSudoku myHardSudoku 1 1
