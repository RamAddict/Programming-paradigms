-- O "Functor" em haskell representa o mapeamento entre categorias no contexto de teoria das categorias.
-- Na prática um functor representa um tipo o qual pode ser mapeado.
-- Declarando "f" como uma instância de Functor
-- permite que funções relacionadas a mapeamento possam ser invocadas sobre tipo "f a" para todo "a"

-- Um "Applicative Functor" é um Functor porém possui mais features que um functor e menos que um monad
import Control.Applicative
-- Utilizando functor, é possível mapear uma função existente com outra função declarada dentro dela.
-- Porém não é possivel mapear uma função dentro de Functor com outro Functor.
-- Applicative functor entra providenciando o operador <*> e pure
-- Abaixo estão suas implementações
-- class (Functor f) => Applicative f where   
--     pure :: a -> f a   
--     (<*>) :: f (a -> b) -> f a -> f b   
-- O método pure recebe um valor de qualquer tipo e retorna um Applicative functor sobre o valor

f1:: Int -> Int -> Int 
f1 x y = (2+x+y)*2

main = do 
   -- A função fmap age como map, porém permite mapeamento de monads
   print (fmap  (+7)(Just 10)) 
   print (fmap  (+7) Nothing)
   -- Este exemplo não funciona pois map não é um functor 
--    print (map (+8) Nothing)

   print(show $ f1 <$> (Just 1) <*> (Just 3))
