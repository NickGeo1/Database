'''f = open('CUSTOMER.sql', 'r')
lines = f.read()
lines = lines.split('\n')
f.close()

f = open('ADDRESS.sql', 'r')
lines_2 = f.read()
lines_2 = lines_2.split('\n')
f.close()

new_file = open('ADDRESS2.sql', 'a')

for i in range(0, 500):
    previous_query  = lines[i].replace(',', '')
    previous_query  = previous_query.split()
    email           = previous_query[16]
    contract_number = previous_query[11].strip('()')
    query = lines_2[i]
    query = query.replace("'email',", email + ",")
    query = query.replace("'contract');", contract_number + ");")
    print(query)
    new_file.write(query + '\n')

new_file.close()'''

query = "insert into ADDRESS (zip_code, city, country, street, number, license, type) values (30144, 'Huaibei', 'China', 'Dapin', '12', 49498315691, 'driver');"
query = query.replace(',', '')
query = query.split()
print(query)