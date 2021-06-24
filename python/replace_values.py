import io

f = open('CUSTOMER.sql', 'r')
lines = f.read()
lines = lines.split('\n')
f.close()

'''f = io.open('DRIVER_CONTRACT.sql', 'r', encoding='UTF-8')
lines_2 = f.read()
lines_2 = lines_2.split('\n')
f.close()'''

new_file = io.open('DRIVER.sql', 'a', encoding='UTF-8')

for i in range(0, 500):
    previous_query  = lines[i]
    previous_query  = previous_query.split()
    previous_query  = previous_query[11] + previous_query[12] + previous_query[13] + previous_query[14] + previous_query[15][:-1] + ")"
    query = "insert into DRIVER (firstname, lastname, gender, date_of_birth, license_number) values " + previous_query
    print(query)
    new_file.write(query + '\n')

new_file.close()

query = "insert into CUSTOMER (firstname, lastname, gender, date_of_birth, license_number, email, CONTRACTS_number) values ('Phil', 'Pennacci', 'Male', '18/11/1975', 7701984209, 'cblazekdv@geocities.jp', 4755150079);"

query = query.split()
query = query[11] + query[12] + query[13] + query[14] + query[15][:-1] + ")"
print(query)