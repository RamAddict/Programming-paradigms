class Organismo:
    def __init__(self, position, size):
        self.position = position
        self.size  = size

class Parede_celular:
    def __init__(self, gram):
        self.gram = gram

class Despesa:
    def __init__(self, upkeep):
        self.upkeep = upkeep

class Cachorro(Organismo, Despesa):
    def __init__(self, position, size, cor_pelo, upkeep):
        Organismo.__init__(self, position, size)
        Despesa.__init__(self, upkeep)
        self.cor_pelo = cor_pelo
    @staticmethod
    def latir():
        print('woof')

# class Boxer(c)

class Celula(Organismo):
    def __init__(self, position, size, kind):
        Organismo.__init__(self, position, size)
        self.kind = kind
        self.parede_celular = Parede_celular('gram+')


    def fagocitose(self, celula):
        print('Fagocitei uma celula de {0} micrômetros'.format(celula.size))

import abc

class Shape(object):
    __metaclass__ = abc.ABCMeta

    @abc.abstractmethod
    def method_to_implement(self, input):

        return
def main():

    bacteria1 = Celula('chão', .5, 'Procarionte')
    bacteria2 = Celula('chão', .3, 'Procarionte')
    print('Eu sou {1} e estou no {0}.'.format(bacteria1.position, bacteria1.kind))
    bacteria2.fagocitose(bacteria1)

    bob = Cachorro('chão', 10, 'branco', 200)
    Cachorro.latir()

    shape = Shape()
    shape.method_to_implement(2)

if __name__ == "__main__":
    main()