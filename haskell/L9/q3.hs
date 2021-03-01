
--Q3

fix :: (a -> a) -> a
fix f = let {x = f x} in x

main = do
  d <- getLine
  let a = read d :: Double
  print (fix ((\f x-> if x <= 1/1 then 1 else (f(x-1)+f(x-2))) )a)
