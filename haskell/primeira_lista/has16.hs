divi :: Int -> Int -> Bool
divi x y
    | mod x y == 0 = True
    | otherwise = False

main = do
    m <- getLine
    n <- getLine
    let x = (read m :: Int)
    let y = (read n :: Int)
    print("Divi = " ++ (show (divi x y)))
