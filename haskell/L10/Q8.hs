echoDo :: IO ()
echoDo = do
    c <- getChar
    putChar c

echoOP :: IO ()
echoOP = getChar >>=
    (\n -> (putChar n))


main = do
    -- echoDo
    echoOP