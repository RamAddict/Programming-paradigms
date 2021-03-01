escrevaDo :: String -> Int -> IO ()
escrevaDo "" _ = putChar '\n'
escrevaDo _ 0 = putChar '\n'
escrevaDo (a:b) n = do
    putChar a
    escrevaDo b (n-1)

escrevaOp :: String -> Int -> IO ()
escrevaOp "" _ = putChar '\n'
escrevaOp _ 0 = putChar '\n'
escrevaOp (a:b) n = putChar a >>=
            (\m -> (escrevaOp b (n-1)))

main = do
    print(1)
    escrevaDo "кошка" 3
    escrevaOp "кошка" 3