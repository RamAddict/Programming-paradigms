primo :: Int -> Int -> Int -> Bool
primo m k n
    | n > (div m 2) && k > 1 = False
    | n > (div m 2) && k == 1 = True
    | (mod m n) == 0 = (primo m (k+1) (n+1))
    | (mod m n) /= 0 = (primo m k (n+1))

main = do
    m <- getLine
    let x = (read m :: Int)
    print("Primo = " ++ (show (primo x 0 1)))
