module Main (main) where
import Fila
        
main = do
    -- cirando uma lista vazia e enfileirando 4 2 3
    let queue = enqueue(enqueue(enqueue emptyQueue 4)2)3
    print(queue)
    -- mostrando o primeiro da fila
    print(first queue)
    -- mostrando o retorno da remoção da fila
    print(dequeue queue)
    -- mostrando que a fila original nao foi alterada com a operação anterior
    print(queue)
