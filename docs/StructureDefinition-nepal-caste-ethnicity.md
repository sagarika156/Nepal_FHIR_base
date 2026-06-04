# Nepal Patient Caste and Ethnicity Extension - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Nepal Patient Caste and Ethnicity Extension**

## Extension: Nepal Patient Caste and Ethnicity Extension 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/StructureDefinition/nepal-caste-ethnicity | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalCasteEthnicity |

An extension to capture caste or ethnic classifications according to MoHP Nepal digital health guidelines.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Nepal Baseline Patient Profile](StructureDefinition-nepal-patient.md)
* Examples for this Extension: [Patient/ExampleNepalPatient1](Patient-ExampleNepalPatient1.md) and [Patient/ExampleNepalPatient2](Patient-ExampleNepalPatient2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/fhir.np.base|current/StructureDefinition/StructureDefinition-nepal-caste-ethnicity.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nepal-caste-ethnicity.csv), [Excel](StructureDefinition-nepal-caste-ethnicity.xlsx), [Schematron](StructureDefinition-nepal-caste-ethnicity.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nepal-caste-ethnicity",
  "url" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-caste-ethnicity",
  "version" : "0.1.0",
  "name" : "NepalCasteEthnicity",
  "title" : "Nepal Patient Caste and Ethnicity Extension",
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
  "description" : "An extension to capture caste or ethnic classifications according to MoHP Nepal digital health guidelines.",
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Element"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Nepal Patient Caste and Ethnicity Extension",
      "definition" : "An extension to capture caste or ethnic classifications according to MoHP Nepal digital health guidelines."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-caste-ethnicity"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.mohp.gov.np/ValueSet/nepal-caste-ethnicity-vs"
      }
    }]
  }
}

```
