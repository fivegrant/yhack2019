// 6 load zip
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
WITH row WHERE row.ZipCode IS NOT NULL
MERGE (zip: ZipCode {name:row.ZipCode})
RETURN zip;