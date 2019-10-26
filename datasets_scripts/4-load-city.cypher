// 4 load city
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
WITH row WHERE row.City IS NOT NULL
MERGE (cty: City {name:row.City})
RETURN cty;