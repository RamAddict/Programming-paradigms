import math as math
print('point1: x y z')
[a,b,c] = input().split(' ')
print('point2: x y z')
[d,e,f] = input().split(' ')

print((lambda a,b,c,d,e,f: math.sqrt(((a-d)**2)+((b-e)**2)+((c-f)**2)))(float(a),float(b),float(c),float(d),float(e),float(f)))
