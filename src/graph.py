from neo4j import GraphDatabase

class AddressGraph:

  def __init__(self, address, password):
    self.connection = GraphDatabase.driver(address, auth=("neo4j", password))
 
  def write(self, query):
    with self.connection.session() as session:
      session.run(query)

  def read(self, query):
    with self.connection.session() as session:
      return session.run(query)
     
