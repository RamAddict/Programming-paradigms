-- listas sao usadas para modelar computações não determinísticas
-- que podem retornar qualquer numero de resultados
-- É possível traçar uma comparação entre Maybe que poderia retornar 
-- 0 ou 1 valor. Porém com listas pode-se retornar qualquer numero de valores

-- Este exemplo de lista demonstra como a função 
-- my concat pode retornar uma lista com qualquer numero de elementos
myconcat :: [[Int]] -> [Int]
myconcat m = m >>= id -- id = id :: a -> a 


main = do
    print (myconcat [[21], [24]])
    print (myconcat [[1]])
    print (myconcat [])