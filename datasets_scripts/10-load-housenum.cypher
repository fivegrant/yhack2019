// 10 load housenum
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
MERGE (hn: HouseNum {name: coalesce(row.HouseNum, "Unknown")})
RETURN hn;