MATCH (a:Constituency)-[RAN_IN]-> 
(n:Candidate) 
WHERE n.Gender = "Female"
AND n.Party = "Sinn Fein"  
RETURN a;