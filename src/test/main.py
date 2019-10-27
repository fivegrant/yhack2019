import module.graph
import test.queries

db_address="bolt://localhost:7687"
db_password="password"

db = graph.AddressGraph(db_address, db_password)

#db.write(queries.add_stuff)
for thing in db.read(queries.see_stuff): 
  print(thing)

