// 15 link occu-hn
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (o:Occupant {name: row.Occupant})
MATCH (hn:HouseNum {name:row.HouseNum})
MERGE (o)-[r:RESIDES_AT {year: row.Year}]->(hn)
RETURN o, hn;