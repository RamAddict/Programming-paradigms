
bs :: Float -> Float -> Float -> (Float, Float)
bs a b c = ((-b + sqrt(b*b - 4*a*c))/(2*a), (-b - sqrt(b*b - 4*a*c))/(2*a))

main = do
    a <- getLine
    b <- getLine
    c <- getLine
    let x = read a :: Float
    let y = read b :: Float
    let z = read c :: Float
    print (bs x y z)

