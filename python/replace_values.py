import io

f = open('CONTRACTS.sql', 'r')
lines = f.read()
lines = lines.split('\n')
f.close()

f = io.open('VEHICLES.sql', 'r', encoding='UTF-8')
lines_2 = f.read()
lines_2 = lines_2.split('\n')
f.close()

new_file = io.open('VEHICLES2.sql', 'a', encoding='UTF-8')

for i in range(0, 500):
    previous_query  = lines[i]
    previous_query  = previous_query.split()
    contract         = previous_query[11][1:-1]
    query = lines_2[i]
    query = query.replace("'contract'", contract)
    print(query)
    new_file.write(query + '\n')

new_file.close()

'''query = "insert into CONTRACTS (number, category, starting_date, end_date, price, CUSTOMER_email, VEHICLES_plates) values (3922661562, 'Simple', '1991-07-29', '1985-05-10', 19806, 'mtupper0@twitter.com', 'PME - 7929');"
query = query.split()
print(query[11][1:-1])'''