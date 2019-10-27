// 1 load country
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row   
WITH row WHERE row.Country IS NOT NULL
MERGE (c:Country {name: row.Country})
RETURN c;