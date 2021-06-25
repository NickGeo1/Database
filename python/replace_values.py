import io

f = open('MODEL.sql', 'r')
lines = f.read()
lines = lines.split('\n')
f.close()

f = io.open('VEHICLES.sql', 'r', encoding='UTF-8')
lines_2 = f.read()
lines_2 = lines_2.split('\n')
f.close()

new_file = io.open('VEHICLES_2.sql', 'a', encoding='UTF-8')

for i in range(327):
    previous_query = lines[i]
    previous_query = previous_query.replace("insert into MODEL (model, type, manufacturer) values ", '').strip("();").split(',')[0]
    query          = lines_2[i].replace("'model')", previous_query + ')')
    print(query)
    new_file.write(query + '\n')

for i in range(173):
    previous_query = lines[i]
    previous_query = previous_query.replace("insert into MODEL (model, type, manufacturer) values ", '').strip("();").split(',')[0]
    query          = lines_2[i+327].replace("'model')", previous_query + ')')
    print(query)
    new_file.write(query + '\n')

new_file.close()

'''query = "insert into MODEL (model, type, manufacturer) values ('Camry', 'Vans & Trucks', 'Toyota');"

query = query.replace("insert into MODEL (model, type, manufacturer) values ", '').strip("();").split(',')[0]
#query = query.strip("();")
#query = query.split(',')[0]
print(query)'''