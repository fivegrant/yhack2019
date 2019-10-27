// 3 country-state
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (c: Country)
MATCH (s: State)
MERGE (c)-[r:CONTAINS]->(s)
RETURN c, s;