module Main (main) where
import Arvores
    
main = do
    let t = minhaArvore
    print(somaElementos t)
    print(buscaElemento t 52)