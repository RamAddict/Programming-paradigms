-- Expr ::- Number | Div Expr Expr

data Expr = Val Float | Div Expr Expr | Mul Expr Expr | Add Expr Expr | Sub Expr Expr | Sqrt Expr

mydiv :: Float -> Float -> Maybe Float
mydiv n m | m == 0 = Nothing
          | otherwise = Just (n / m)

myMul :: Float -> Float -> Maybe Float
myMul n m = Just (n * m)

myAdd :: Float -> Float -> Maybe Float
myAdd n m = Just (n + m)

mySub :: Float -> Float -> Maybe Float
mySub n m = Just (n - m)

mySqrt :: Float -> Maybe Float
mySqrt n | (n < 0) = Nothing
         | otherwise = (Just (sqrt n))

-- eval :: Expr -> Maybe Float -- PErguntar pro professor
-- eval (Val n) = Just n
-- eval (Sqrt x) = case (eval x) of
--             Nothing -> Nothing
--             Just n -> (mySqrt n)

eval :: Expr -> Maybe Float
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
eval (Sqrt x) = case (eval x) of
            Nothing -> Nothing
            Just n -> (mySqrt n)

evalMonad :: Expr -> Maybe Float
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
evalMonad (Sqrt x) = evalMonad x >>=
                            (\n -> (mySqrt n))

evalfinal :: Expr -> Maybe Float
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
evalfinal (Sqrt x) = do
    n <- evalfinal x
    mySqrt n

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