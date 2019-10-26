// 12 load unit
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
WITH row WHERE row.Unit IS NOT NULL
MERGE (u: Unit {name: row.Unit})
RETURN u;