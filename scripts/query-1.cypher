MATCH (a:Constituency)-[RAN_IN]-> 
(n:Candidate) 
WHERE n.Elected = "Yes" 
AND n.Age > "65" 
RETURN a;