
--Q6
fix :: (a -> a) -> a
fix f = let {x = f x} in x

main = do
  m <- getLine
  p <- getLine
  g <- getLine
  let a = read m :: Float
  let b = read p :: Float
  let c = read g :: Float

  print ((\x y z-> if x > y && x >z then x else if y > x && y > z then y else z) a b c )
