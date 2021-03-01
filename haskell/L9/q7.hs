--Q7
fix :: (a -> a) -> a
fix f = let {x = f x} in x

main = do
  let v = [1,2,3,4,5,6,7]
  print(map (\x ->(mod x 2) == 0) v)
