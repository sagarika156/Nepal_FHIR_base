# Example of a Nepal Baseline Patient 2 - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Example of a Nepal Baseline Patient 2**

## Example Patient: Example of a Nepal Baseline Patient 2

Profile: [Nepal Baseline Patient Profile](StructureDefinition-nepal-patient.md)

Sita Kumari Tamang(official) Female, DoB: 1965-03-22 ( National Health Plan Identifier)

-------

| | |
| :--- | :--- |
| Other Id: | Citizenship Card/32-02-80-09876 |
| Contact Detail | Ward 7 Shantinagar Birtamode p1 (home) |
| [Nepal Patient Caste and Ethnicity Extension](StructureDefinition-nepal-caste-ethnicity.md) | Janajati |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "ExampleNepalPatient2",
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
    "value" : "NHID-1234-5678"
  },
  {
    "type" : {
      "coding" : [{
        "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
        "code" : "CZ"
      }]
    },
    "value" : "32-02-80-09876"
  }],
  "name" : [{
    "use" : "official",
    "text" : "Sita Kumari Tamang",
    "family" : "Tamang",
    "given" : ["Sita", "Kumari"]
  }],
  "gender" : "female",
  "birthDate" : "1965-03-22",
  "address" : [{
    "extension" : [{
      "url" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-palika-type",
      "valueCode" : "municipality"
    }],
    "use" : "home",
    "type" : "both",
    "line" : ["Ward 7", "Shantinagar"],
    "city" : "Birtamode",
    "district" : "dist-103",
    "state" : "p1"
  }]
}

```
