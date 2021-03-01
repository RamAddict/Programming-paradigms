#     while True:
try:
    lineammount = int(input())
    for i in range(0, lineammount):
        parenthesis_counter = 0
        line = input()
        diamond_ammt = 0
        for character in line:
            if character == '<':
                parenthesis_counter+=1
            elif character == '>':
                parenthesis_counter-=1
                if parenthesis_counter < 0:
                    parenthesis_counter = 0
                    # break
                else:
                    diamond_ammt+=1
        print(diamond_ammt)


except EOFError as e:
    pass
