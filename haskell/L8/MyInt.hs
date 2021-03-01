module MyInt (MyInt (MyInt), (+++), (***)) where

data MyInt = MyInt Int deriving (Eq, Show)

(+++) :: MyInt -> MyInt -> MyInt
(MyInt a) +++ (MyInt b) = (MyInt (a + 5*b))

(***) :: MyInt -> MyInt -> MyInt
(MyInt a) *** (MyInt b) = (MyInt (a - b))

infixr  4 +++
infixr  3 ***
