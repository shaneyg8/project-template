# Irish Constituencies Neo4j Database
##### Shane Gleeson, G00311793

## Introduction
This is my project I designed on a neo4j database which involves using the constituencies and the candidates that ran in the election in the Republic of Ireland. Here I must create relationships between the Constituencies and the Candidates and run interesting queries to find out useful information.


## Database
I Firstly created nodes for each of the 40 constituencies and then a node for each candidate. Each costituency has a set of properties, all icluding name, population, seats (number of seats in each constituency) and a description, here I used Wikipedia as a reference for this information. A total of 40 altogether. Example below:

```
CREATE (`nCarlow–Kilkenny`:Constituency {name: "Carlow–Kilkenny", population:145659, seats:5, boundary_areas_description: "The county of Kilkenny and the county of Carlow, except the part thereof which is comprised in the constituency of Wicklow." })
```
Next i added the Candidates, they also had a set of properties, each candidate was linked to the Constituencies through the name of the Constituency that they were running in. The properties I set for each candidate were name, Age, Gender, Party, Elected and Constituency. Example of a Candidate below that I had created:
```
CREATE (:Candidate { name: "Heather Humphreys", Age: "55", Gender: "Female", Party: "Fine Gael", Elected: "Yes", Constituency: "Cavan-Monaghan"	});
```
After I had finished with Candidates and Constituencies I then had to set up the Relationships. Here I matched the name of the Constituency with the name property of the Candidates. I created a label called RAN_IN which the relationship would be under. Example below:

```
MATCH (n:Constituency{name: "Dublin Fingal"}),(z:Candidate{Constituency: "Dublin Fingal"}) create (n)-[r:RAN_IN]->(z) return z,n,r

```
## Queries
1. -> Find the number of Constituencies that had people elected over the age of 65
2. -> How many Constituencies had Direct Democrats running.
3. -> Number of Constituencies that had Females running that were apart of Sinn Fein.

#### Query one - Constituencies over 65 years of age
Here this query checks how many constituencies had people running in the election over the age of 65
```
MATCH (a:Constituency)-[RAN_IN]-> 
(n:Candidate) 
WHERE n.Elected = "Yes" 
AND n.Age > "65" 
RETURN a;

```

#### Query two - How many Constituencies had Direct Democrats running
This query shows how many Constituencies had Direct Democrats runnning in the election in the Republic Of Ireland.
```
MATCH (a:Constituency)-[RAN_IN]-> 
(n:Candidate) 
WHERE n.Elected = "No"
AND n.Party = "Direct Democracy Ireland"  
RETURN a;
```

#### Query three - Number of Constituencies that had Females running that were apart of Sinn Fein
This Query finds out how many Constituencies had Females running that were apart of Sinn Fien
```
MATCH (a:Constituency)-[RAN_IN]-> 
(n:Candidate) 
WHERE n.Gender = "Female"
AND n.Party = "Sinn Fein"  
RETURN a;
```

## References
1. [Neo4J website](http://neo4j.com/), the website of the Neo4j database.
2. [TheJournal website - Candidates](http://www.thejournal.ie/election-2016/constituency/), the website with information on all the candidates running.
3. [Wikipedia website - Irish Parties](https://en.wikipedia.org/wiki/List_of_political_parties_in_the_Republic_of_Ireland), the website with information on all Irish Parties in government.
4. [Wikipedia website for Constituencies](https://en.wikipedia.org/wiki/Parliamentary_constituencies_in_the_Republic_of_Ireland)
5. Other Students-**Andy Blankley** Helped me think of some interesting queries 
