mdc :: Int -> Int -> Int
mdc m n
    | m == 0 = n
    | m > 0 = mdc (n `mod` m) m

coprimos :: Int -> Int -> Bool
coprimos m n
    | (mdc m n) == 1 = True
    | otherwise = False

euler :: Int -> Int -> Int -> Int
euler n k j
    | n == 1 = k
    | (coprimos (n-1) j) == True = (euler (n-1) (k+1) j)
    | (coprimos (n-1) j) == False = (euler (n-1) k j)

main = do
    x <- getLine
    let m = (read x :: Int)
    print("Euler = " ++ (show (euler m 0 m)))

