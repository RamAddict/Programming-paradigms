-- Como o próprio nome sugere, Either pode representar um de dois valores.
-- A definição de Either é a seguinte:
-- data Either a b = Left a | Right b
-- either pode ser construido utilizando quaisquer construtores

-- Esta função retorna uma string caso haja uma divisão por zero
-- E um Float caso seja válida a divisão
safeDivisao :: Float -> Float -> Either String Float
safeDivisao _ 0 = Left "Divisao por zero!"
safeDivisao a b = Right (a / b)

main = do
    print (safeDivisao 12 3)
    print (safeDivisao 12 0)