def play(list):
    discarded = pile.pop(0)
    send_to_back = pile.pop(0)
    pile.append(send_to_back)
    return discarded

while True:
    card = int(input())
    if card == 0:
        break
    if card == 1:
        print('Discarded cards:')
        print('Remaining card: 1')
        continue
    discard_pile = []
    pile = list(range(1,card+1))
    # print(pile)
    while len(pile) > 1: #adapt to pop more than one at a time maybe
        discarded = pile.pop(0)
        send_to_back = pile.pop(0)
        pile.append(send_to_back)
        discard_pile.append(discarded)
    
    print('Discarded cards: ', end = '') #build this directly and just print rather than construct
    for i in discard_pile[:-1]:
        print('%s,'% i , end = ' ')
    print('%s'% discard_pile[-1] )
    print('Remaining card: %s'% pile[0])

# while True:
#     n = int(input())
#     if n == 0:
#         break

#     lista = []
#     for i in range(n, 0, -1):
#         lista.append(i)

#     tamanho = n
#     top = n - 1
#     agregados = ""
#     while tamanho >= 2:
#         num = lista.pop(top)
#         if tamanho == 2:
#             agregados += str(num)
#         else:
#             agregados += str(num) + ", "
#         tamanho -= 1

#         if top == 0:
#             top = tamanho - 2
#         elif top == 1:
#             top = tamanho - 1
#         else:
#             top -= 2
#     sobrou = str(lista[top])

#     print("Discarded cards: %s"%agregados)
#     print("Remaining card: %s"%sobrou)