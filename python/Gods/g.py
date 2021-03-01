linesize = int(input())
table = [[0 for x in range(4)] for y in range(linesize)] 
queue = []
for i in range(linesize):
    entry = input().split(' ')
    # print(entry, 'pushed')
    country = (int(entry[1]),int(entry[2]),int(entry[3]),str(entry[0]))
    queue.append(country)
out = sorted(queue, key = lambda x: x[3])
out = sorted(out, key = lambda x: (x[2]))
out = sorted(out, key = lambda x: (x[0], x[1]), reverse=True)

# for elemt in out:
#     print("{0} {1} {2} {3}".format(elemt[3],elemt[0],elemt[1],elemt[2]))
print(out.pop(0)[3])