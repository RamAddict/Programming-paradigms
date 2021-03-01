class (Integral x) => MeuInt x where
    bigger :: x -> x -> x
    smaller :: x -> x -> x
    par :: x -> Bool
    impar :: x-> Bool
    primo :: x -> Bool
    mdc :: x -> x -> x
    -- Retorna se o número é múltiplo de 24
    multiploDe24 :: x -> Bool
    (===) :: x -> x -> Bool
    -- Retorna se os 2 números são pares
    (*-*) :: x -> x -> Bool

    bigger a b | a > b = a
            | otherwise = b

    smaller a b | a == (bigger a b) = b
            | otherwise = a

    par a | mod a 2 == 0 = True
          | otherwise = False

    impar a | par a == True = False
            | otherwise = True

    primo 0 = True
    primo n = ((length $ ([a | a<-[2..floor (sqrt (fromIntegral  n-1))], ((mod n a) == 0) ])) == 0)

    mdc a 0 = a
    mdc a b = mdc b (mod a b)

    multiploDe24 a = (mod a 24 == 0)

    a === b | (a + 1) == b = True
            | a == b = True
            | (a - 1) == b = True
            | otherwise = False

    a *-* b | (mod a 2 == 0) && (mod b 2 == 0) = True
            | otherwise = False
instance MeuInt Integer

main = do
    print (bigger (1::Integer) (2::Integer))
    print (par (2::Integer))
    print (impar (2::Integer))
    print (primo (20023121::Integer))
    print (mdc (23732::Integer) (180::Integer))
    print ((0::Integer) === (2::Integer))
    --Meus métodos
    print (multiploDe24 (48::Integer))
    print ((24::Integer) *-* (22::Integer))