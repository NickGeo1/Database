import io

from_file = ""
while True:
    from_file = input("Enter the SQL (without the .sql) file you want to pass data FROM --> ")
    try:
        from_file = io.open(from_file + ".sql", 'r', encoding='UTF-8')
        break
    except:
        print("This file doesn't exist.")

to_file = ""
while True:
    to_file = input("Enter the SQL (without the .sql) file you want to pass data TO --> ")
    try:
        to_file = io.open(to_file + ".sql", 'r', encoding='UTF-8')
        break
    except:
        print("This file doesn't exist.")

key = int(input("Starting from 1, in what position is the key to be passed located? --> "))
from_lines = from_file.read().split('\n')

keys_to_be_passed = []
try:
    for line in from_lines:
        key_to_be_passed = line[line.find('(', line.find('values')):].strip("();").split(',')[key - 1].replace("'", '') if line[line.find('(', line.find('values')):].strip("();").split(',')[key - 1].replace("'", '')[0] != ' ' else line[line.find('(', line.find('values')):].strip("();").split(',')[key - 1].replace("'", '')[1:]
        try:
            key_to_be_passed = int(key_to_be_passed)
        except:
            key_to_be_passed = key_to_be_passed
        keys_to_be_passed.append(key_to_be_passed)
except IndexError:
    print("The key is out of range.")

placeholder = input("What is the placeholder value name to be replaced? --> ")

to_lines = to_file.read().split('\n')

writefile = io.open("NEWFILE.sql", "a", encoding="UTF-8")
for i in range(len(to_lines) - 1):
    new_line = to_lines[i].replace("'" + placeholder + "'", "'" + keys_to_be_passed[i] + "'" if type(keys_to_be_passed[i]) == str else str(keys_to_be_passed[i]))
    writefile.write(new_line + '\n')

print("Successfully replaced values to a new file.")
from_file.close()
to_file.close()
writefile.close()

'''query = "insert into ACCIDENT (id, date, time, description) values (1205, '25-Feb-1998', '12:36 PM', 'The other driver was looking at his phone');"
query = query[query.find('(', query.find('values')):].strip("();").split(',')
print(query)'''