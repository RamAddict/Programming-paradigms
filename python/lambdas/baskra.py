[a,b,c] = input().split(' ')
import math as math
print((lambda a,b,c: (math.sqrt(b*b -4*(a*c)) - b)/2*a)(float(a), float(b), float(c)))
print((lambda a,b,c: (-math.sqrt(b*b -4*(a*c)) - b)/2*a)(float(a), float(b), float(c)))