module Fila (Fila (Queue), emptyQueue, enqueue, dequeue, first) where


data Fila t = Queue [t]
    deriving (Eq, Show)

enqueue :: Fila t -> t -> Fila t
enqueue (Queue q) x = Queue (q ++ [x])

dequeue :: Fila t -> Fila t
dequeue (Queue []) = error "Empty"
dequeue (Queue (a:q)) = Queue q

first :: Fila t -> t
first (Queue []) = error "Empty"
first (Queue (a:q)) = a

emptyQueue :: Fila t
emptyQueue = Queue []