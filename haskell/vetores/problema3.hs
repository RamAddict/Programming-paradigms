--Q3
soma :: [Int] -> Int 
soma (a:b) = a + soma b
soma [] = 0

tamanho :: [Int] -> Int
tamanho (a:b) = 1 + tamanho b 
tamanho [] = 0

media :: [Int] -> Float
media [] = 0
media a = fromIntegral(soma a) / fromIntegral(tamanho a)

menor :: [Int] -> Int
menor (a:b) | tamanho b == 0 = a
            | otherwise = minimo a (menor b)
menor [] = 0

minimo :: Int -> Int -> Int
minimo a b | a > b = b
          | otherwise = a

main = do
    let x = 2:4:6:8:[ ]
    print (soma x)
    print (tamanho x)
    print (menor x)
