
print("provide nothing for false, anything for true:")
a = bool(input())
print(a)
print("provide nothing for false, anything for true:")
b = bool(input())
print(b)
print(bool((lambda x,y: x!=y)(a,b)))