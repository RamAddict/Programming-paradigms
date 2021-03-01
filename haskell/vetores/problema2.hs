--Q2
f :: [Int] -> Int 
f (a:b) = a + f b
f [] = 0

tamanho :: [Int] -> Int
tamanho (a:b) = 1 + tamanho b 
tamanho [] = 0

media :: [Int] -> Float
media [] = 0
media a = fromIntegral(f a) / fromIntegral(tamanho a)

main = do
    let x = 2:4:6:8:[ ]
    print (f x)
    print (tamanho x)
