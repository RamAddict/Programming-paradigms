try:
    input()
    while True:
        parenthesis_counter = 0
        bracket_counter = 0
        curly_counter = 0
        last = ''
        n = input()
        line = []
        bracket_pile = []
        parenthesis_pile = []
        curly_pile = []
        varible = 0
        for elemt in n:
            line.append(elemt)
            if elemt == '[':
                bracket_pile.insert(0)
            elif elemt == '(':
                parenthesis_pile(0)
            elif elemt = '{':
                curly_pile.insert(0)
            elif elemt == '}':
                if len(curly_pile) != 0:
                    if line[varible]
        
            varible+=1
        pos =0
        any(('}', ']', ')'))
        while line:
            top = line.pop(0)
                bracket_counter+=1
            if (top == '['):
            elif (top == '('):
                parenthesis_counter+=1
            elif top == '{':
                curly_counter+=1

        print(curly_counter)
        if parenthesis_counter != 0 or curly_counter != 0 or bracket_counter != 0:
            print('N')
        else:
            print('S')


except EOFError as e:
    pass
