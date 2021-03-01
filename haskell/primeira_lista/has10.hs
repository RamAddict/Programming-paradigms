maior :: Int -> Int -> Int -> Int
maior a b c = 
	if (a >= b && a >= c) then
		a
	else
		if (b >= a && b >= c) then
		b
	else
		c

main = do
	as <- getLine
	bs <- getLine
	cs <- getLine
	let a = (read as :: Int)
	let b = (read bs :: Int)
	let c = (read cs :: Int)
	print(maior a b c)
