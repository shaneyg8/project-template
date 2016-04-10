MATCH (a:Constituency)-[RAN_IN]-> 
(n:Candidate) 
WHERE n.Elected = "No"
AND n.Party = "Direct Democracy Ireland"  
RETURN a;