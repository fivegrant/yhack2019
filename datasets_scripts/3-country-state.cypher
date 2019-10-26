// 3 country-state
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (c: Country)
MATCH (s: State)
MERGE (c)-[r:CONTAINS]->(s)
RETURN c, s;