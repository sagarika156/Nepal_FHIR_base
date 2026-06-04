# Nepal HMIS Caste and Ethnicity Group Code System - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Nepal HMIS Caste and Ethnicity Group Code System**

## CodeSystem: Nepal HMIS Caste and Ethnicity Group Code System 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/CodeSystem/nepal-caste-ethnicity-cs | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalCasteEthnicityCS |

 
Official classification of caste and ethnic groups utilized by the Ministry of Health and Population (MoHP) Nepal for health management information systems (HMIS). 

 This Code system is referenced in the content logical definition of the following value sets: 

* [NepalCasteEthnicityVS](ValueSet-nepal-caste-ethnicity-vs.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "nepal-caste-ethnicity-cs",
  "url" : "http://fhir.mohp.gov.np/CodeSystem/nepal-caste-ethnicity-cs",
  "version" : "0.1.0",
  "name" : "NepalCasteEthnicityCS",
  "title" : "Nepal HMIS Caste and Ethnicity Group Code System",
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
  "description" : "Official classification of caste and ethnic groups utilized by the Ministry of Health and Population (MoHP) Nepal for health management information systems (HMIS).",
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 6,
  "concept" : [{
    "code" : "1",
    "display" : "Dalit",
    "definition" : "Disadvantaged or marginalized groups under national dalit schedules"
  },
  {
    "code" : "2",
    "display" : "Janajati",
    "definition" : "Indigenous nationalities / Adibasi Janajati groups"
  },
  {
    "code" : "3",
    "display" : "Madhesi",
    "definition" : "Terai / Madhesh regional communities"
  },
  {
    "code" : "4",
    "display" : "Muslim",
    "definition" : "Islamic religious/cultural minority demographic"
  },
  {
    "code" : "5",
    "display" : "Brahmin/Chhetri",
    "definition" : "Relatively advantaged hill and plain socio-cultural groups"
  },
  {
    "code" : "6",
    "display" : "Others",
    "definition" : "Other unclassified ethnic or linguistic identities"
  }]
}

```
