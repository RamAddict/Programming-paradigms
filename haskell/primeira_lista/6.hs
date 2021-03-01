--Recebe um parâmetro Float e retorna String
avaliacao :: Int -> Int -> Int -> String
avaliacao x y z =
	if x + y < z || y+z<x || z+x<y then
		"Nao"
	else
		"Sim"
main = do
	notaString <- getLine
	let x = (read notaString :: Int)
	notaString <- getLine
	let y = (read notaString :: Int)
	notaString <- getLine
	let z = (read notaString :: Int)
	putStrLn (""++ (avaliacao x y z))