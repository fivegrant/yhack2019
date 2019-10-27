// 8 load street
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
MERGE (s:Street {name: coalesce(row.Street, "Unknown")})