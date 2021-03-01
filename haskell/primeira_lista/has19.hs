-- y starts at 2
g :: Int -> Int -> Bool
g x y | x < 2 = False
      | x == 2 = True
      | mod x y == 0 = False
      | y == x-1 = True
      | otherwise = g x (y+1)
-- y starts at 2
f :: Int -> Int -> Int
f x y | g y 2 && g (x - y) 2 = y
      | otherwise = f x (y+1)

main = do
    putStrLn "Informe x: "
    a <- getLine

    let x = read a :: Int
    print (f x 2)

