module Formas (Forma (Retangulo,
                        Trapezio,
                        Elipse,
                        Circulo,
                        Triangulo,
                        Poligono), area) where
data Forma = Retangulo Float Float
            | Trapezio Float Float Float
            | Elipse Float Float
            | Circulo Float
            | Triangulo Float Float
            | Poligono [(Float, Float)]
            deriving Show

area :: Forma -> Float
area (Retangulo base altura) = base * altura
area (Trapezio altura baseMaior baseMenor) = altura*(baseMaior+baseMenor)/2
area (Triangulo base altura) = base * altura
area (Elipse raio1 raio2) = pi * raio1 * raio2
area (Circulo raio) = pi * raio * raio