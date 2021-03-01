fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib(n-2)

main = do
	notaString <- getLine
	let x = (read notaString :: Int)
	print (fib x)