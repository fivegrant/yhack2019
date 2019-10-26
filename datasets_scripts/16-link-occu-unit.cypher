// 16 link occu-unit
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (o:Occupant {name: row.Occupant})
MATCH (u:Unit {name:row.Unit})
MERGE (o)-[r:RESIDES_AT {year: row.Year}]->(u)
RETURN o, u;