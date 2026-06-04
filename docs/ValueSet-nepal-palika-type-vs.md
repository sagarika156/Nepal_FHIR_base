# Nepal Local Level Tier Value Set - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Nepal Local Level Tier Value Set**

## ValueSet: Nepal Local Level Tier Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/ValueSet/nepal-palika-type-vs | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalPalikaTypeVS |

 
Value set for selecting allowed structural types for local governance (Palika) in Nepal. 

 **References** 

* [Nepal Administrative Local Level (Palika) Type](StructureDefinition-nepal-palika-type.md)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "nepal-palika-type-vs",
  "url" : "http://fhir.mohp.gov.np/ValueSet/nepal-palika-type-vs",
  "version" : "0.1.0",
  "name" : "NepalPalikaTypeVS",
  "title" : "Nepal Local Level Tier Value Set",
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
  "description" : "Value set for selecting allowed structural types for local governance (Palika) in Nepal.",
  "compose" : {
    "include" : [{
      "system" : "http://fhir.mohp.gov.np/CodeSystem/nepal-palika-type-cs"
    }]
  }
}

```
