module Pontos (Ponto (Ponto2D), distancia, colineares, formaTriangulo) where

data Ponto = Ponto2D (Float, Float)
            deriving Show


distancia :: Ponto -> Ponto -> Float
distancia (Ponto2D (x1, y1)) (Ponto2D (x2, y2)) = sqrt $ ((x1 - x2)**2 + (y1 - y2)**2)

colineares :: Ponto -> Ponto -> Ponto -> Bool
colineares (Ponto2D (x1, y1)) 
           (Ponto2D (x2, y2))
           (Ponto2D (x3, y3))
           = not (determinanteNotZero (Ponto2D (x1, y1)) (Ponto2D (x2, y2)) && 
           determinanteNotZero (Ponto2D (x1, y1)) (Ponto2D (x3, y3)) && 
           determinanteNotZero (Ponto2D (x3, y3)) (Ponto2D (x2, y2)))

formaTriangulo :: Ponto -> Ponto -> Ponto -> Bool
formaTriangulo  (Ponto2D (x1, y1))
                (Ponto2D (x2, y2))
                (Ponto2D (x3, y3))
                = not (colineares (Ponto2D (x1, y1)) (Ponto2D (x2, y2)) (Ponto2D (x3, y3)))
determinanteNotZero :: Ponto -> Ponto -> Bool
determinanteNotZero (Ponto2D (x1, y1))
                    (Ponto2D (x2, y2))
                    = ((x1 * y2) - (x2 * y1) /= 0)