// 11 link hn-street
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (hn:HouseNum {name: coalesce(row.HouseNum, 'Unknown')})
MATCH (str:Street {name: coalesce(row.Street, 'Unknown')})
MERGE (hn)-[r:LIES_ALONG]->(str)
RETURN hn, str;