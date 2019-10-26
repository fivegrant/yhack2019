// 2 load state
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
WITH row WHERE row.State IS NOT NULL
MERGE (s: State {name: row.State})
RETURN s;