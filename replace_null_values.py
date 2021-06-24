f = open('CONTRACTS.sql', 'r')
lines = f.read()
lines = lines.split('\n')
f.close()

p = open('pinakides.txt', 'r')
pinakides = p.read()
pinakides = pinakides.split('\n')
p.close()

new_file = open('CONTRACTS2.sql', 'a')

for i in range(0, 500):
    line = lines[i].replace('null', "'" + pinakides[i] + "'") + '\n'
    new_file.write(line)
    print(line)

new_file.close()
