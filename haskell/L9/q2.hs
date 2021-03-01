--Q2

main = do
  d <- getLine
  f <- getLine
  g <- getLine
  let a = read d :: Float
  let b = read f :: Float
  let c = read g :: Float
  print ((\x y z-> if (((x + y + z)/3) >= 6) then True else False) a b c)
