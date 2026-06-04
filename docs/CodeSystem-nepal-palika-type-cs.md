# Nepal Local Level Tier Code System - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Nepal Local Level Tier Code System**

## CodeSystem: Nepal Local Level Tier Code System 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/CodeSystem/nepal-palika-type-cs | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalPalikaTypeCS |

 
Official code system for types of local governance bodies (Palikas) in Nepal. 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NepalPalikaTypeVS](ValueSet-nepal-palika-type-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nepal-palika-type-cs",
  "url" : "http://fhir.mohp.gov.np/CodeSystem/nepal-palika-type-cs",
  "version" : "0.1.0",
  "name" : "NepalPalikaTypeCS",
  "title" : "Nepal Local Level Tier Code System",
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
  "description" : "Official code system for types of local governance bodies (Palikas) in Nepal.",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 4,
  "concept" : [{
    "code" : "metropolitan",
    "display" : "Metropolitan City (Mahanagarpalika)"
  },
  {
    "code" : "sub-metropolitan",
    "display" : "Sub-Metropolitan City (Upamahanagarpalika)"
  },
  {
    "code" : "municipality",
    "display" : "Municipality (Nagarpalika)"
  },
  {
    "code" : "rural-municipality",
    "display" : "Rural Municipality (Gaupalika)"
  }]
}

```
