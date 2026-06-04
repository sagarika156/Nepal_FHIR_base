# Nepal Caste and Ethnicity Value Set - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Nepal Caste and Ethnicity Value Set**

## ValueSet: Nepal Caste and Ethnicity Value Set 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/ValueSet/nepal-caste-ethnicity-vs | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalCasteEthnicityVS |

 
The set of allowed codes for capturing a patient's ethnic background in Nepal baseline registries. 

 **References** 

* [Nepal Patient Caste and Ethnicity Extension](StructureDefinition-nepal-caste-ethnicity.md)

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
  "id" : "nepal-caste-ethnicity-vs",
  "url" : "http://fhir.mohp.gov.np/ValueSet/nepal-caste-ethnicity-vs",
  "version" : "0.1.0",
  "name" : "NepalCasteEthnicityVS",
  "title" : "Nepal Caste and Ethnicity Value Set",
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
  "description" : "The set of allowed codes for capturing a patient's ethnic background in Nepal baseline registries.",
  "compose" : {
    "include" : [{
      "system" : "http://fhir.mohp.gov.np/CodeSystem/nepal-caste-ethnicity-cs"
    }]
  }
}

```
