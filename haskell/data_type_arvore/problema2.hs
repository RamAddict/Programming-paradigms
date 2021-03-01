--Q2
data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float

area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo a b) = a * b
area (Triangulo b a) = (b * a)/2


minhaForma :: Forma
minhaForma = Triangulo 10 5

main = do 
    print (area (Circulo 2))
    print (area (minhaForma))

