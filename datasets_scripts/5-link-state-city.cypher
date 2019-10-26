// 5 link state-city
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (s:State {name: row.State})
MATCH (c:City {name:row.City})
MERGE (s)-[r:CONTAINS]->(c)
RETURN s, c;