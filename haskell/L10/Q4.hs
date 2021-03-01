calcPosicaoFinal2 :: [(Int, Int)] -> Maybe (Int, Int)
calcPosicaoFinal2 s@(a:xs) -- | (mod (length $ xs) 2) == 1 = (calcPosicaoFinal2 ([a]++s))
                            | (((length $ xs) == 0)) = (Just (last s))
                            | (jogadaValida a (xs!!0)) = (calcPosicaoFinal2 xs)
                            | otherwise = (Nothing)
                            


jogadaValida :: (Int, Int) -> (Int, Int) -> Bool
jogadaValida (a,b) (c,d) =
     ((c == (a+2) || c == (a -2)) && (d == (b+1) || d == (b-1)))
       ||  ((d == (b+2) || d == (b -2)) && (c == (a+1) || c == (a-1)))
       || ((a == c) && (d == b))
       && (a < 8) && (b < 8) && (c < 8) && (d < 8) 
       && (a >= 0) && (b >= 0) && (c >= 0) && (d >= 0)

main = do
    print (calcPosicaoFinal2 ((1,0):(2,2):(0,3):(2,4):[]))
    print (calcPosicaoFinal2  [(1,0), (2,2), (0,3), (3,3)])
    print (calcPosicaoFinal2 ((1,0):(3,1):(1,2):(2,4):[]))
    print (calcPosicaoFinal2  [(1,0), (2,2), (1,3)])
