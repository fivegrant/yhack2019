// script builder
// 1 load country
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row   
WITH row WHERE row.Country IS NOT NULL
MERGE (c:Country {name: row.Country})
RETURN count(*);

// 2 load state
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
WITH row WHERE row.State IS NOT NULL
MERGE (s: State {name: row.State})
RETURN count(*);

// 3 country-state
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (c: Country)
MATCH (s: State)
MERGE (c)-[r:CONTAINS]->(s)
RETURN count(*);

// 4 load city
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
WITH row WHERE row.City IS NOT NULL
MERGE (cty: City {name:row.City})
RETURN count(*);

// 5 link state-city
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (s:State {name: row.State})
MATCH (c:City {name:row.City})
MERGE (s)-[r:CONTAINS]->(c)
RETURN count(*);

// 6 load zip
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
WITH row WHERE row.ZipCode IS NOT NULL
MERGE (zip: ZipCode {name:row.ZipCode})
RETURN count(*);

// 7 link city-zip
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (cty:City {name: row.City})
MATCH (zip:ZipCode {name:row.ZipCode})
MERGE (cty)-[r:CONTAINS]->(zip)
RETURN count(*);

// 8 load street
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
MERGE (s:Street {name: coalesce(row.Street, "Unknown")})
RETURN count(*);

// 9 link zip-street
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (zip:ZipCode {name: row.ZipCode})
MATCH (str:Street {name: coalesce(row.Street, 'Unknown')})
MERGE (zip)-[r:CONTAINS]->(str)
RETURN count(*);

// 10 load housenum
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
MERGE (hn: HouseNum {name: coalesce(row.HouseNum, "Unknown")})
RETURN count(*);

// 11 link hn-street
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (hn:HouseNum {name: coalesce(row.HouseNum, 'Unknown')})
MATCH (str:Street {name: coalesce(row.Street, 'Unknown')})
MERGE (hn)-[r:LIES_ALONG]->(str)
RETURN count(*);

// 12 load unit
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row
MERGE(u: Unit {name: coalesce(row.Unit, 'Unknown')})
RETURN count(*);

// 13 link hn-unit
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (hn:HouseNum {name: coalesce(row.HouseNum, 'Unknown')})
MATCH (u:Unit {name: coalesce(row.Unit, 'Unknown')})
MERGE (hn)-[r:HAS_UNIT]->(u)
RETURN count(*);

// 14 load occupant
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM "file:///test.csv" AS row   
WITH row WHERE row.Occupant IS NOT NULL
MERGE (o:Occupant {name: row.Occupant})
RETURN count(*);

// 15 link occu-hn
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (o:Occupant {name: coalesce(row.Occupant, 'Unknown')})
MATCH (hn:HouseNum {name: coalesce(row.HouseNum, 'Unknown')})
MERGE (o)-[r:RESIDES_AT {year: row.Year}]->(hn)
RETURN count(*);

// 16 link occu-unit
USING PERIODIC COMMIT 10000
LOAD CSV WITH HEADERS FROM 'file:///test.csv' AS row
MATCH (o:Occupant {name: coalesce(row.Occupant, 'Unknown')})
MATCH (u:Unit {name: coalesce(row.Unit, 'Unknown')})
MERGE (o)-[r:RESIDES_AT {year: row.Year}]->(u)
RETURN count(*);
