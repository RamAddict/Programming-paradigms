avaliacao :: Int -> Int
avaliacao x = 
	if x < 0 then
		-x
	else
		x

main = do
	xs <- getLine
	let x = (read xs :: Int)
	print (avaliacao x)