a = int(input())
f = lambda x: 1 if x in (1,2) else f(x-1)+f(x-2)
print(f(a))
