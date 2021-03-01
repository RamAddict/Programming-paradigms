avaliacao :: Float -> Float -> Float -> Float -> Float -> Float -> Float
avaliacao a b c x y z = sqrt((a-x)**2 + (b-y)**2 + (c-z)**2)

main = do
    a <- getLine
    b <- getLine
    c <- getLine
    aLinha <- getLine
    bLinha <- getLine
    cLinha <- getLine
    let x = read a :: Float
    let y = read b :: Float
    let z = read c :: Float
    let xLinha = read aLinha :: Float
    let yLinha = read bLinha :: Float
    let zLinha = read cLinha :: Float
    print (avaliacao x y z xLinha yLinha zLinha)

