import io
import random

rand = random.randint(0,10)

contracts = io.open("UNIQUE_CONTRACTS.sql",'r',encoding='UTF-8')
vehicles = io.open("UNIQUE_VEHICLES.sql",'r',encoding='UTF-8')

linesc = contracts.readlines()
linesv = vehicles.readlines()

for i in range(len(linesc)):
    rand = random.randint(1,10)
    if(rand <= 4):
        r = linesc[i].find("'Simple'",0,-1)
        linesc[i] = linesc[i].replace("'Simple'","'Professional'") if r != -1 else linesc[i].replace("'Mixed'","'Professional'")
        value="'Professional'"
    else:
        value = linesc[i][linesc[i].find('(', linesc[i].find('values')):].strip("();").split(',')[1]

    s = linesv[i].find("'simple'",0,-1)

    if(s!=-1):
        linesv[i] = linesv[i].replace("'simple'",value)
    elif(linesv[i].find("'mixed'",0,-1) != -1):
        linesv[i] = linesv[i].replace("'mixed'",value)
    else:
        linesv[i] = linesv[i].replace("'professional'",value)

contracts.close()
vehicles.close()

new_contracts = io.open("UNIQUE_CONTRACTS.sql",'w+',encoding='UTF-8')
new_vehicles = io.open("UNIQUE_VEHICLES.sql",'w+',encoding='UTF-8')

for l in linesc:
    new_contracts.write(l)

for l in linesv:
    new_vehicles.write(l)

new_contracts.close()
new_vehicles.close()








