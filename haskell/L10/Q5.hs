A classe Monad possui também (>>) e fail.
O operador (>>) age igualmete ao (>>=) porém (>>) descarta o intermediário.
Em verdade é possível implementar o (>>) da seguinte maneira
a >> b = >>= \ _ -> b