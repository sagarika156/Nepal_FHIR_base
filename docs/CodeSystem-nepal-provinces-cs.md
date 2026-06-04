# Nepal Provinces Code System - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Nepal Provinces Code System**

## CodeSystem: Nepal Provinces Code System 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/CodeSystem/nepal-provinces-cs | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalProvincesCS |

 
The 7 federal provinces of Nepal as established by the Constitution. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NepalProvincesVS](ValueSet-nepal-provinces-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nepal-provinces-cs",
  "url" : "http://fhir.mohp.gov.np/CodeSystem/nepal-provinces-cs",
  "version" : "0.1.0",
  "name" : "NepalProvincesCS",
  "title" : "Nepal Provinces Code System",
  "status" : "draft",
  "experimental" : false,
  "date" : "2026-06-04T10:24:25+05:45",
  "publisher" : "Sagarika",
  "contact" : [{
    "name" : "Sagarika",
    "telecom" : [{
      "system" : "url",
      "value" : "https://github.com/sagarika156"
    }]
  }],
  "description" : "The 7 federal provinces of Nepal as established by the Constitution.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 7,
  "concept" : [{
    "code" : "p1",
    "display" : "Koshi Province"
  },
  {
    "code" : "p2",
    "display" : "Madhesh Province"
  },
  {
    "code" : "p3",
    "display" : "Bagmati Province"
  },
  {
    "code" : "p4",
    "display" : "Gandaki Province"
  },
  {
    "code" : "p5",
    "display" : "Lumbini Province"
  },
  {
    "code" : "p6",
    "display" : "Karnali Province"
  },
  {
    "code" : "p7",
    "display" : "Sudurpashchim Province"
  }]
}

```
