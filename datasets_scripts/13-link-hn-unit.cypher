// 13 link hn-unit
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (hn:HouseNum {name: coalesce(row.HouseNum, 'Unknown')})
MATCH (u:Unit {name: coalesce(row.Unit, 'Unknown')})
MERGE (hn)-[r:HAS_UNIT]->(u)
RETURN hn, u;