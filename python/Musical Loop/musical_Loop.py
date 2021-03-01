def is_b_local_max_or_min(a, b, c):
    # min
    a = int(a)
    b = int(b)
    c = int(c)
    if b < c and b < a:
        return 1
    elif b > c and b > a:
        return 1
    else:
        return 0

try:
    while True:
        linesize = int(input())
        if linesize == 0:
            continue
        if linesize == 1:
            print(1)
            continue
        line = [linesize]
        line = input().split(' ')
        points = 0
        if linesize == 2:
            if (line[0] != line[1]):
                print(2)
                continue
            else:
                print(1)
                continue
        for i in range(1,len(line)-1):
            points += is_b_local_max_or_min(line[i-1], line[i], line[i+1])
            # print(points)
            # print(line[i])
        points += is_b_local_max_or_min(line[len(line)-2], line[len(line)-1], line[0])
        # print("i am %s",a)
        points += is_b_local_max_or_min(line[len(line)-1], line[0], line[1])
        # print("i am %s",b)
        print(points)



except EOFError as e:
    pass

