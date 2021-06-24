import random

letters = "ABEZHIKMNOPTYX"
letters = list(letters)
for i in range(0, 500):
    f = open("pinakides.txt", 'r')
    pinakida = random.choice(letters) + random.choice(letters) + random.choice(letters) + " - " + str(random.randrange(1000, 10000))
    previous_pinakides = f.read().split('\n')
    if pinakida not in previous_pinakides:
        file = open("pinakides.txt", 'a')
        file.write(pinakida + '\n')
        print(pinakida)
        file.close()
    f.close()