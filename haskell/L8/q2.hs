module Main (main) where
import Pontos

main = do
    print(distancia (Ponto2D (2, 4)) (Ponto2D (1, 2)))
    print(colineares (Ponto2D (2, 4)) (Ponto2D (1, 3)) (Ponto2D (1, 2)))
    print(formaTriangulo (Ponto2D (2, 4)) (Ponto2D (1, 3)) (Ponto2D (1, 2)))