
--Q4

fix :: (a -> a) -> a
fix f = let {x = f x} in x

main = do
  d <- getLine
  f <- getLine
  g <- getLine
  let a = read d :: Float
  let b = read f :: Float
  let c = read g :: Float

  print ((\x y z -> (((sqrt $ (y*y -4*x*z)) -y)/(2*x))) a b c)
  print ((\x y z -> (((sqrt $ (y*y -4*x*z)) +y)/(2*x))) a b c)

