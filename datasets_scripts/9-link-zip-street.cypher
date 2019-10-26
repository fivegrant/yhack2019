// 9 link zip-street
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (zip:ZipCode {name: row.ZipCode})
MATCH (str:Street {name:row.Street})
MERGE (zip)-[r:CONTAINS]->(str)
RETURN zip, str;