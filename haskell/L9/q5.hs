
--Q5

fix :: (a -> a) -> a
fix f = let {x = f x} in x

main = do
  m <- getLine
  p <- getLine
  g <- getLine
  let a = read m :: Float
  let b = read p :: Float
  let c = read g :: Float
  l <- getLine
  h <- getLine
  j <- getLine
  let d = read l :: Float
  let e = read h :: Float
  let f = read j :: Float

  print ((\x y z w k o-> (sqrt $ (((x-w)**2) + (y-k)**2 + (z-o)**2)) ) a b c d e f)

