mdc :: Int -> Int -> Int
mdc m n
	| m == 0 = n
	| m > 0 = mdc (n `mod` m) m

main = do
	x <- getLine
	y <- getLine
	let m = (read x :: Int)
	let n = (read y :: Int)
	print("MDC = " ++ (show (mdc m n)))	
