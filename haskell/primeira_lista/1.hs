avaliacao :: Float -> Float -> Float
avaliacao x y = x**y

main = do
	xs <- getLine
	ys <- getLine
	let x = (read xs :: Float)
	let y = (read ys :: Float)
	print (avaliacao x y)