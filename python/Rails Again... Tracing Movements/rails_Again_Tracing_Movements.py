while True:
    linesize = int(input())
    if (linesize <= 0):
        break
    # if linesize == 2:
    #     print('IR')
    #     break
    A_pile = []
    B_pile = []
    desired_B = []
    output_str = ''
    station = []

    X_pile = input().split(' ')
    for i in X_pile:
        A_pile.append(str(i))
    # print(A_pile)
    T_pile = input().split(' ')
    for i in T_pile:
        desired_B.append(str(i)) 
    # print(desired_B)
    desired_B_cp = []
    desired_B_cp = desired_B.copy()

    pos = 0
    for char in A_pile[:]:
        if char == desired_B[0]:
            output_str+='IR'
            desired_B.pop(0)
            B_pile.append(char)
            pos+=1
        else:
            output_str+='I'
            station.append(char)
        A_pile.pop(0)
    # print(station, 'station')
    # print(station)
    # print(desired_B_cp, 'desired_B_cp')
    # print(desired_B_cp)
    # print('B_pile','' )
    # print(B_pile)
    while station:
        # print('FUCK OFF')
        # print(pos)
        if station[-1] == desired_B_cp[pos]:
            pos+=1
            station.pop()
            output_str += 'R'
        else:
            output_str+= ' Impossible'
            break
        # B_pile.append(char)
        # output_str += 'R'

        # if (char == desired_B_cp[pos]):
        #     output_str += char
        # print(pos)

    print(output_str)
print('')