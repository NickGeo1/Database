f = open("pinakides.txt", "w")
letters = "ABEZHIKMNOPTYX"
for letter_a in letters:
    for letter_b in letters:
        for letter_c in letters:
            for i in range(1000, 10000):
                f.write(letter_a + letter_b + letter_c + " - " + str(i))
                print(letter_a + letter_b + letter_c + " - " + str(i))
f.close()