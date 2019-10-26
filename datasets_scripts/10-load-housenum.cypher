// 10 load housenum
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
WITH row WHERE row.HouseNum IS NOT NULL
MERGE (hn: HouseNum {name:row.HouseNum})
RETURN hn;