-- exemplo de enum
-- Card possui construtores por cada numero de um baralho
data Card = Two | Three | Four | Five | Six
          | Seven | Eight | Nine | Ten
          | Jack | Queen | King | Ace deriving (Eq, Ord, Enum, Show, Bounded)
