# Example of a Nepal Baseline Patient 1 - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example of a Nepal Baseline Patient 1**

## Example Patient: Example of a Nepal Baseline Patient 1

Profile: [Nepal Baseline Patient Profile](StructureDefinition-nepal-patient.md)

Hari Prasad Shrestha(official) Male, DoB: 1988-08-15 ( National Health Plan Identifier)

-------

| | |
| :--- | :--- |
| Other Id: | Citizenship Card/27-01-75-04321 |
| Contact Detail | Ward 4 Imadol Mahalaxmi p3 (home) |
| [Nepal Patient Caste and Ethnicity Extension](StructureDefinition-nepal-caste-ethnicity.md) | Janajati |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleNepalPatient1",
  "meta" : {
    "profile" : ["http://fhir.mohp.gov.np/StructureDefinition/nepal-patient"]
  },
  "extension" : [{
    "url" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-caste-ethnicity",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://fhir.mohp.gov.np/CodeSystem/nepal-caste-ethnicity-cs",
        "code" : "2",
        "display" : "Janajati"
      }]
    }
  }],
  "identifier" : [{
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "NH"
      }]
    },
    "value" : "NHID-9982-3145"
  },
  {
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "CZ"
      }]
    },
    "value" : "27-01-75-04321"
  }],
  "name" : [{
    "use" : "official",
    "text" : "Hari Prasad Shrestha",
    "family" : "Shrestha",
    "given" : ["Hari", "Prasad"]
  }],
  "gender" : "male",
  "birthDate" : "1988-08-15",
  "address" : [{
    "extension" : [{
      "url" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-palika-type",
      "valueCode" : "municipality"
    }],
    "use" : "home",
    "type" : "both",
    "line" : ["Ward 4", "Imadol"],
    "city" : "Mahalaxmi",
    "district" : "dist-302",
    "state" : "p3"
  }]
}

```
