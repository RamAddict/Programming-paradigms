avaliacao :: Float -> Float -> Float
avaliacao x y = 
	x*y/2

main = do
	xs <- getLine
	let x = (read xs :: Float)
	ys <- getLine
	let y = (read xs :: Float)
	print (avaliacao x y)