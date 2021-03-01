--Q1
f :: [Int] -> Int 
f (a:b) = a + f b
f [] = 0

tamanho :: [t] -> Int
tamanho (a:b) = 1 + tamanho b 
tamanho [] = 0

media :: [Int] -> Float
media [] = 0
media a = fromIntegral(f a) / fromIntegral(tamanho a)

menor :: [Int] -> Int
menor (a:b) | tamanho b == 0 = a
            | otherwise = minimo a (menor b)
menor [] = 0

minimo :: Int -> Int -> Int
minimo a b | a > b = b
          | otherwise = a

maximo :: Int -> Int -> Int
maximo a b | a > b = a
          | otherwise = b

maior :: [Int] -> Int
maior (a:b) | tamanho b == 0 = a
        | otherwise = maximo a (maior b)
maior [] = 0

busca :: [Int] -> Int -> Bool
busca (a:b) c | a == c = True
            | otherwise = busca b c
busca [] c = False

ocorrencias :: [Int] -> Int -> Int
ocorrencias (a:b) c | a == c = 1 + ocorrencias b c
            | otherwise = ocorrencias b c
ocorrencias [] c = 0

inverte :: [Int] -> [Int]
inverte [] = []
inverte (a:b) | tamanho b == 0 = a:[]
            | otherwise = inverte(b) ++ a:[]

mapear :: (t -> y) -> [t] -> [y]
mapear f [] = []
mapear g (a:b) | tamanho b == 0 = (g a):[]
            | otherwise = mapear g b ++ (g a):[]

somaum :: Int -> Int
somaum a = a+1

filtrar :: (t -> Bool) -> [t] -> [t]
filtrar func a = [c | c <- a, func c]

impar :: Int -> Bool
impar a | mod a 2 == 1 = True
impar a | otherwise = False

primeiros :: Int -> [t] -> [t]
primeiros _ [] = []
primeiros n _ | n <= 0 = []
primeiros n (a:b) = [a] ++ primeiros (n-1) b

apagar :: Int -> [t] -> [t]
apagar n l | n <= 0 = l
apagar _ [] = []
apagar n (a:b) = apagar (n-1) b

apagarEnquanto :: (t -> Bool) -> [t] -> [t]
apagarEnquanto _ [] = []
apagarEnquanto f (a:b) | (f a) == True = apagarEnquanto f b
apagarEnquanto f (a:b) | (f a) == False = (a:b)

main = do
    let x = 3:3:6:8:2:3:7:[ ]
    print (f x)
    print (tamanho x)
    print (menor x)
    print (maior x)
    print (busca x 21)
    print (ocorrencias x 4)
    print (inverte x)
    print (mapear somaum x)
    print (filtrar impar x)
    print (primeiros 10 x)
    print (apagar (4) x)
    print (apagarEnquanto impar x)