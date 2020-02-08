# HW3 

**Name:** Timo Wang

**NetID:** nwt8362

**Due Date:** 02/06/2019

## Query 1

### Answer

Ithaca

### Query Formation

```SPARQL
SELECT ?city ?cityLabel ?uni WHERE {
  ?uni wdt:P31 wd:Q902104, wd:Q615150.
  ?city wdt:P31/wdt:P279* wd:Q515;
    rdfs:label ?cityLabel.
  FILTER((LANG(?cityLabel)) = "en")
  
  ?uni wdt:P131 ?city.
}
```

## Query 2

### Answer

Istanbul

### Query Formation

```SPARQL
SELECT DISTINCT ?city ?cityLabel WHERE {
  ?country wdt:P31 wd:Q6256.
  ?city (wdt:P31/(wdt:P279*)) wd:Q515;
    wdt:P30 wd:Q48, wd:Q46;
    wdt:P17 ?country;
    rdfs:label ?cityLabel.
  ?country wdt:P571 ?date.
  BIND((NOW()) - ?date AS ?distance)
  FILTER((0  <= ?distance) && (?distance <= 36500 ))
  FILTER((LANG(?cityLabel)) = "en")
}
```



## Query 3

### Answer

- Malmö Municipality
- Malmö Redhawks

### Query Formation

**City**

```
SELECT DISTINCT ?swedishCityName WHERE {
  ?bridgeId (wdt:P31/(wdt:P279*)) wd:Q12280;
    wdt:P17 wd:Q34, wd:Q35;
    wdt:P131 ?swedishCityId, ?danishCityId;
    rdfs:label ?bridgeName.
  ?swedishCityId wdt:P17 wd:Q34;
    rdfs:label ?swedishCityName.
  FILTER((LANG(?bridgeName)) = "en")
  FILTER((LANG(?swedishCityName)) = "en")
}
```

**Team**

```
SELECT DISTINCT ?hockeyTeamName WHERE {
  ?bridgeId (wdt:P31/(wdt:P279*)) wd:Q12280;
    wdt:P17 wd:Q34, wd:Q35;
    wdt:P131 ?swedishCityId, ?danishCityId;
    rdfs:label ?bridgeName.
  ?swedishCityId wdt:P17 wd:Q34;
    rdfs:label ?swedishCityName.
  FILTER((LANG(?bridgeName)) = "en")
  FILTER((LANG(?swedishCityName)) = "en")
  
  ?hockeyTeamId wdt:P31 wd:Q4498974;
                wdt:P115 ?homeVenueId;
                rdfs:label ?hockeyTeamName.
  FILTER((LANG(?hockeyTeamName)) = "en")
  ?homeVenueId wdt:P131 ?swedishCityId. 
}
```



