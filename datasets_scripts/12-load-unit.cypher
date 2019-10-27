// 12 load unit
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
MERGE(u: Unit {name: coalesce(row.Unit, 'Unknown')})
RETURN u;