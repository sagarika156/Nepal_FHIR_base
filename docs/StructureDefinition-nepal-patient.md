# Nepal Baseline Patient Profile - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Nepal Baseline Patient Profile**

## Resource Profile: Nepal Baseline Patient Profile 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/StructureDefinition/nepal-patient | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalPatient |

 
The ultimate national baseline profile for Patients in Nepal, aligning core identifiers (Health ID, Citizenship, National ID), family contexts, and localized federal geography. 

**Usages:**

* Examples for this Profile: [Patient/ExampleNepalPatient1](Patient-ExampleNepalPatient1.md) and [Patient/ExampleNepalPatient2](Patient-ExampleNepalPatient2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/fhir.np.base|current/StructureDefinition/StructureDefinition-nepal-patient.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nepal-patient.csv), [Excel](StructureDefinition-nepal-patient.xlsx), [Schematron](StructureDefinition-nepal-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nepal-patient",
  "url" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-patient",
  "version" : "0.1.0",
  "name" : "NepalPatient",
  "title" : "Nepal Baseline Patient Profile",
  "status" : "draft",
  "date" : "2026-06-04T10:24:25+05:45",
  "publisher" : "Sagarika",
  "contact" : [{
    "name" : "Sagarika",
    "telecom" : [{
      "system" : "url",
      "value" : "https://github.com/sagarika156"
    }]
  }],
  "description" : "The ultimate national baseline profile for Patients in Nepal, aligning core identifiers (Health ID, Citizenship, National ID), family contexts, and localized federal geography.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "cda",
    "uri" : "http://hl7.org/v3/cda",
    "name" : "CDA (R2)"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "loinc",
    "uri" : "http://loinc.org",
    "name" : "LOINC code for the element"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient"
    },
    {
      "id" : "Patient.extension",
      "path" : "Patient.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.extension:casteEthnicity",
      "path" : "Patient.extension",
      "sliceName" : "casteEthnicity",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.mohp.gov.np/StructureDefinition/nepal-caste-ethnicity"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "type"
        }],
        "rules" : "open"
      },
      "min" : 1
    },
    {
      "id" : "Patient.identifier:healthId",
      "path" : "Patient.identifier",
      "sliceName" : "healthId",
      "min" : 1,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:healthId.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "NH"
        }]
      }
    },
    {
      "id" : "Patient.identifier:healthId.type.text",
      "path" : "Patient.identifier.type.text",
      "patternString" : "National Health ID"
    },
    {
      "id" : "Patient.identifier:healthId.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:citizenshipId",
      "path" : "Patient.identifier",
      "sliceName" : "citizenshipId",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:citizenshipId.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "CZ"
        }]
      }
    },
    {
      "id" : "Patient.identifier:citizenshipId.type.text",
      "path" : "Patient.identifier.type.text",
      "patternString" : "Citizenship Certificate Number"
    },
    {
      "id" : "Patient.identifier:citizenshipId.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:nationalId",
      "path" : "Patient.identifier",
      "sliceName" : "nationalId",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:nationalId.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "NI"
        }]
      }
    },
    {
      "id" : "Patient.identifier:nationalId.type.text",
      "path" : "Patient.identifier.type.text",
      "patternString" : "National ID (Rastriya Parichayapatra)"
    },
    {
      "id" : "Patient.identifier:nationalId.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:insuranceId",
      "path" : "Patient.identifier",
      "sliceName" : "insuranceId",
      "min" : 0,
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:insuranceId.type",
      "path" : "Patient.identifier.type",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
          "code" : "MB"
        }]
      }
    },
    {
      "id" : "Patient.identifier:insuranceId.type.text",
      "path" : "Patient.identifier.type.text",
      "patternString" : "Health Insurance / SSF Number"
    },
    {
      "id" : "Patient.identifier:insuranceId.value",
      "path" : "Patient.identifier.value",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.name",
      "path" : "Patient.name",
      "min" : 1
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "min" : 1
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "min" : 1
    },
    {
      "id" : "Patient.address",
      "path" : "Patient.address",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address.extension",
      "path" : "Patient.address.extension",
      "min" : 1
    },
    {
      "id" : "Patient.address.extension:palikaType",
      "path" : "Patient.address.extension",
      "sliceName" : "palikaType",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://fhir.mohp.gov.np/StructureDefinition/nepal-palika-type"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Patient.address.line",
      "path" : "Patient.address.line",
      "short" : "Captured lines (Line 1: Ward Number e.g. 'Ward 4', Line 2: Tole/Village e.g. 'Imadol')",
      "min" : 1,
      "max" : "2",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address.city",
      "path" : "Patient.address.city",
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Patient.address.district",
      "path" : "Patient.address.district",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.mohp.gov.np/ValueSet/nepal-districts-vs"
      }
    },
    {
      "id" : "Patient.address.state",
      "path" : "Patient.address.state",
      "min" : 1,
      "mustSupport" : true,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.mohp.gov.np/ValueSet/nepal-provinces-vs"
      }
    },
    {
      "id" : "Patient.contact",
      "path" : "Patient.contact",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "relationship"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Patient.contact:fatherOrSpouse",
      "path" : "Patient.contact",
      "sliceName" : "fatherOrSpouse",
      "min" : 0,
      "max" : "2",
      "mustSupport" : true
    },
    {
      "id" : "Patient.contact:fatherOrSpouse.relationship",
      "path" : "Patient.contact.relationship",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://terminology.hl7.org/ValueSet/v2-0131"
      }
    },
    {
      "id" : "Patient.contact:fatherOrSpouse.name",
      "path" : "Patient.contact.name",
      "min" : 1,
      "mustSupport" : true
    }]
  }
}

```
