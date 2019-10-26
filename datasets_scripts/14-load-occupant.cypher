// 14 load occupant
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row   
WITH row WHERE row.Occupant IS NOT NULL
MERGE (o:Occupant {name: row.Occupant})
RETURN o;