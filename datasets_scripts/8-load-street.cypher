// 8 load street
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
WITH row WHERE row.Street IS NOT NULL
MERGE (s: Street {name: row.Street})
RETURN s;