--Q3
data Ponto = D2 Float Float | D3 Float Float Float

dist :: Ponto -> Ponto -> Float
dist (D2 a b) (D2 c d) = sqrt( ((a-c)**2) + ((b - d)**2))
dist (D3 a b x) (D3 c d y) = sqrt(((a-c)**2) + ((b - d)**2) + (x-y)**2)


-- meuPonto :: Ponto
-- meuPonto = d2 10 5


main = do
    print(dist (D2 1 2) (D2 2 3))
    print(dist (D3 1 2 2) (D3 1 2 65))

