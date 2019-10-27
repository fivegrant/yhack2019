// 16 link occu-unit
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (o:Occupant {name: coalesce(row.Occupant, 'Unknown')})
MATCH (u:Unit {name: coalesce(row.Unit, 'Unknown')})
MERGE (o)-[r:RESIDES_AT {year: row.Year}]->(u)
RETURN o, u;