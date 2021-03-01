f :: String -> Float -> Float -> Float
f op y z | op == "+" = y + z
        | op == "/" = y / z
        | op == "-" = y - z
        | otherwise = y * z

main = do
    putStrLn "Informe operador: "
    a <- getLine
    putStrLn "Informe x: "
    b <- getLine
    putStrLn "Informe y: "
    c <- getLine

    let x = read b :: Float
    let y = read c :: Float
    print (f a x y)

