[a, b, c] = input().split(' ')

print((lambda a: True if a/3 >= 6 else False)(float(a)+float(b)+float(c)))