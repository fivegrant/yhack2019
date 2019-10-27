import modules

see_stuff = 'match (c:Country) return c;'
db_address="bolt://localhost:7687"
db_password="password"
jdb = graph.AddressGraph(db_address, db_password)
for thing in db.read(queries.see_stuff): 
    print(thing)

