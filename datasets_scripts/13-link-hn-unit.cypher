// 13 link hn-unit
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (hn:HouseNum {name: row.HouseNum})
MATCH (u:Unit {name:row.Unit})
MERGE (hn)-[r:HAS_UNIT]->(u)
RETURN hn, u;