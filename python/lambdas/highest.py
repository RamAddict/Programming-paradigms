print('point1: x y z')
[a,b,c] = input().split(' ')

print((lambda a, b, c: a if a >= b and a >= c else (lambda a, b, c: b if b >= a and b >= c else c )(a,b,c))(int(a),int(b),int(c)))