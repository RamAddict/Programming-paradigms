mdc :: Int -> Int -> Int
mdc m n
    | m == 0 = n
    | m > 0 = mdc (n `mod` m) m

main = do
    x <- getLine
    y <- getLine
    z <- getLine
    let m = (read x :: Int)
    let n = (read y :: Int)
    let o = (read z :: Int)
    print("MDC = " ++ (show (mdc (mdc m n) o)))
