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
    keys_to_be_passed = [line[line.find('(', line.find('values')):].strip("();").split(',')[key - 1].replace("'", '') if line[line.find('(', line.find('values')):].strip("();").split(',')[key - 1].replace("'", '')[0] != ' ' else line[line.find('(', line.find('values')):].strip("();").split(',')[key - 1].replace("'", '')[1:] for line in from_lines]
except IndexError:
    print("The key is out of range.")

print(len(keys_to_be_passed))

'''query = "insert into ACCIDENT (id, date, time, description) values (1205, '25-Feb-1998', '12:36 PM', 'The other driver was looking at his phone');"
query = query[query.find('(', query.find('values')):].strip("();").split(',')
print(query)'''