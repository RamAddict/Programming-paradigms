--Recebe um parâmetro Float e retorna String
avaliacao :: Float -> String
avaliacao x =
	if x < 6.0 then
		"Reprovado"
	else
		"Aprovado"
main = do
	notaString <- getLine
	let nota1 = (read notaString :: Float)
	notaString <- getLine
	let nota2 = (read notaString :: Float)
	notaString <- getLine
	let nota3 = (read notaString :: Float)
	let media = (nota3+nota2+nota1)/3
	putStrLn (""++ (avaliacao media))