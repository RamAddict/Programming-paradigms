

--Q1
main = do
  d <- getLine
  f <- getLine
  let a = read d :: Bool
  let b = read f :: Bool
  print ((\z x-> (not z && x) || (not x && z)) a b)

