
file = open('MODEL.sql', 'r')
lines = file.read()

lines = lines.split('(')
file.seek(0)
wholelines = file.readlines()

models=[]
lineindex=0
temp = ''

for i in range (2,len(lines),2):

    lineindex = lineindex+1 if i>2 else lineindex
    
    for c in lines[i]:
        if(c != ','):
            temp += c
        elif(temp in models):
            temp=''
            wholelines[lineindex] = ''
            break
        else:
            models.append(temp)
            temp=''
            break

print("Unique models: "+str(len(models)) + " Duplicates: "+ str(len(wholelines)-len(models)))

file.close()

newfile = open('UNIQUE_MODEL.sql', 'w+')
for l in wholelines:
    newfile.write(l)

newfile.close()

print("Exported unique models successfuly")
