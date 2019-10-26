// 7 link city-zip
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (cty:City {name: row.City})
MATCH (zip:ZipCode {name:row.ZipCode})
MERGE (cty)-[r:CONTAINS]->(zip)
RETURN cty, zip;