import io

f = open('CUSTOMER.sql', 'r')
lines = f.read()
lines = lines.split('\n')
f.close()

f = io.open('ADDRESS.sql', 'r', encoding='UTF-8')
lines_2 = f.read()
lines_2 = lines_2.split('\n')
f.close()

new_file = io.open('ADDRESS2.sql', 'a', encoding='UTF-8')

for i in range(0, 500):
    previous_query  = lines[i].replace(',', '')
    previous_query  = previous_query.split()
    license         = previous_query[-3]
    query = lines_2[i]
    query = query.replace("'license'", license)
    print(query)
    new_file.write(query + '\n')

new_file.close()

'''query = "insert into CUSTOMER (firstname, lastname, gender, date_of_birth, license_number, email, CONTRACTS_number) values ('Mychal', 'Eslinger', 'Male', '24/7/1960', 9141099782, 'mtupper0@twitter.com', 3922661562);"
query = query.replace(',', '')
query = query.split()
print(query[-3])'''