mdc :: Int -> Int -> Int
mdc m n
    | m == 0 = n
    | m > 0 = mdc (n `mod` m) m

coprimos :: Int -> Int -> Bool
coprimos m n
    | (mdc m n) == 1 = True
    | otherwise = False

main = do
    x <- getLine
    y <- getLine
    let m = (read x :: Int)
    let n = (read y :: Int)
    print("Coprimos = " ++ (show (coprimos m n)))
