-- Expr ::- Number | Div Expr Expr

data Expr = Val Int | Div Expr Expr | Mul Expr Expr | Add Expr Expr | Sub Expr Expr

mydiv :: Int -> Int -> Maybe Int
mydiv n m | m == 0 = Nothing
          | otherwise = Just (n `div` m)

myMul :: Int -> Int -> Maybe Int
myMul n m = Just (n * m)

myAdd :: Int -> Int -> Maybe Int
myAdd n m = Just (n + m)

mySub :: Int -> Int -> Maybe Int
mySub n m = Just (n - m)

eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Div x y) = case (eval x) of
          Nothing -> Nothing
          Just n -> case (eval y) of
                    Nothing -> Nothing
                    Just m -> (mydiv n m)
eval (Mul x y) = case (eval x) of
            Nothing -> Nothing
            Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (myMul n m)
eval (Add x y) = case (eval x) of
            Nothing -> Nothing
            Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (myAdd n m)
eval (Sub x y) = case (eval x) of
            Nothing -> Nothing
            Just n -> case (eval y) of
                        Nothing -> Nothing
                        Just m -> (mySub n m)


evalMonad :: Expr -> Maybe Int
evalMonad (Val n) = return n
evalMonad (Div x y) = evalMonad x >>=
                            (\n -> evalMonad y >>=
                                \m -> (mydiv n m))
evalMonad (Sub x y) = evalMonad x >>=
                            (\n -> evalMonad y >>=
                                \m -> (mySub n m))
evalMonad (Mul x y) = evalMonad x >>=
                            (\n -> evalMonad y >>=
                                \m -> (myMul n m))
evalMonad (Add x y) = evalMonad x >>=
                            (\n -> evalMonad y >>=
                                \m -> (myAdd n m))

evalfinal :: Expr -> Maybe Int
evalfinal (Val n) = return n
evalfinal (Div x y) = do
    n <- evalfinal x
    m <- evalfinal y
    mydiv n m
evalfinal (Sub x y) = do
    n <- evalfinal x
    m <- evalfinal y
    mySub n m
evalfinal (Mul x y) = do
    n <- evalfinal x
    m <- evalfinal y
    myMul n m
evalfinal (Add x y) = do
    n <- evalfinal x
    m <- evalfinal y
    myAdd n m

main = do
    print(mydiv 5 0)
    print(eval (Div (Val 5) (Val 2)))
    print(evalMonad (Div (Val 5) (Val 2)))
    print(evalfinal (Div (Val 5) (Val 2)))
    -- A versão abaixo foi a mais simples e direta de se implementar
    print (evalfinal (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)))
    print (evalfinal (Mul (Div (Val 2) (Sub (Val 6) (Val 1))) (Add (Val 3) (Val 3))))

    print (evalMonad (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3)))
    print (evalMonad (Sub (Add (Add (Val 282) (Val 21)) (Sub (Val 56) (Val 21))) (Val 5123)))
    
    -- evidentemente esta versão abaixo foi a mais verbosa de se implementar
    print ((eval (Mul (Div (Add (Val 28) (Val 2)) (Sub (Val 6) (Val 1))) (Val 3))))
    print ((eval (Mul (Add (Mul (Val 26) (Val 22)) (Sub (Val 26) (Val 3))) (Val 34))))