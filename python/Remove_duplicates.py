import io

k = int(input("Give the column number (starting from 1) where the primary key is --> "))
filename = input("Give the file name without the sql extension --> ")

file = io.open(filename+".sql", 'r', encoding='UTF-8')
lines = file.read()

lines = lines.split('(')
file.seek(0)
wholelines = file.readlines()

primary_keys=[]
lineindex=0

for i in range (2,len(lines),2):

    lineindex = lineindex+1 if i>2 else lineindex
    
    if(i!=len(lines)-1):
        lines[i] = lines[i][0:-16-len(filename)]
    else:
        lines[i] = lines[i][0:-2]

    temp=lines[i].split(",")[k-1]

    if(temp in primary_keys):
        wholelines[lineindex] = ''       
    else:
        primary_keys.append(temp)

print("Unique primary keys: "+str(len(primary_keys)) + " Duplicates: "+ str(len(wholelines)-len(primary_keys)))

file.close()

newfile = io.open("UNIQUE_"+filename+".sql", 'w+', encoding='UTF-8')
for l in wholelines:
    newfile.write(l)

newfile.close()

print("Exported unique primary keys successfuly")