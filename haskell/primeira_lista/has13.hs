mdc :: Int -> Int -> Int
mdc m n
    | m == 0 = n
    | m > 0 = mdc (n `mod` m) m

mmc :: Int -> Int -> Int
mmc m n
    | m == n = m
    | otherwise = div (m * n) (mdc m n)

main = do
    x <- getLine
    y <- getLine
    let m = (read x :: Int)
    let n = (read y :: Int)
    print("MMC = " ++ (show (mmc m n)))
