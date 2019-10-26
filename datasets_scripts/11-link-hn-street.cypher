// 11 link hn-street
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (hn:HouseNum {name: row.HouseNum})
MATCH (str:Street {name:row.Street})
MERGE (hn)-[r:LIES_ALONG]->(str)
RETURN hn, str;