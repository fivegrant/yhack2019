// 15 link occu-hn
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (o:Occupant {name: coalesce(row.Occupant, 'Unknown')})
MATCH (hn:HouseNum {name: coalesce(row.HouseNum, 'Unknown')})
MERGE (o)-[r:RESIDES_AT {year: row.Year}]->(hn)
RETURN o, hn;