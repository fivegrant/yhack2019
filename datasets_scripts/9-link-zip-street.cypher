// 9 link zip-street
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (zip:ZipCode {name: row.ZipCode})
MATCH (str:Street {name: coalesce(row.Street, 'Unknown')})
MERGE (zip)-[r:CONTAINS]->(str)
RETURN zip, str;