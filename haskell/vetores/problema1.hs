--Q1
f :: [Int] -> Int 
f (a:b) = a + f b
f [] = 0

main = do
    let x = 2:4:6:8:[ ]
    print (f x)
