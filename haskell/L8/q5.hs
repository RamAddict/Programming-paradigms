-- Precedências em haskell podem ser designadas
-- por meio de fixity. Utilizando a keyword infixr
-- É possivel estabelecer precedências inclusive de novos operadores


module Main (main) where
import MyInt

-- Neste exemplo criei um tipo Meuint onde defini a prioridade dos operadores
-- No caso o operador +++ tem prioridade sobre ***. Caso mude a prioridade, o resultado é diferente

main = do
    -- neste exemplo primeiro ocorre +++
    -- que resulta em a + 5*b = 27
    -- depois opera-se 27 com 1 
    -- que é simplesmente a - b = 26
  print((MyInt 2) +++ (MyInt 5) *** (MyInt 1))
