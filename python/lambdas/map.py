print('list as x y z ...')
a = []
a = input().split(' ')
a = list(map(int, a))

for elemt in (map(lambda x: 'par' if x%2 == 0 else 'impar', a)):
    print (elemt)