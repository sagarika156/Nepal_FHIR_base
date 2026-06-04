# Nepal Administrative Local Level (Palika) Type - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Nepal Administrative Local Level (Palika) Type**

## Extension: Nepal Administrative Local Level (Palika) Type 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/StructureDefinition/nepal-palika-type | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalPalikaType |

An extension to categorize the specific local government tier in Nepal (Metropolitan, Sub-Metropolitan, Municipality, or Rural Municipality).

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [Nepal Baseline Patient Profile](StructureDefinition-nepal-patient.md)
* Examples for this Extension: [Patient/ExampleNepalPatient1](Patient-ExampleNepalPatient1.md) and [Patient/ExampleNepalPatient2](Patient-ExampleNepalPatient2.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/fhir.np.base|current/StructureDefinition/StructureDefinition-nepal-palika-type.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-nepal-palika-type.csv), [Excel](StructureDefinition-nepal-palika-type.xlsx), [Schematron](StructureDefinition-nepal-palika-type.sch) 

#### Terminology Bindings

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "nepal-palika-type",
  "url" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-palika-type",
  "version" : "0.1.0",
  "name" : "NepalPalikaType",
  "title" : "Nepal Administrative Local Level (Palika) Type",
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
  "description" : "An extension to categorize the specific local government tier in Nepal (Metropolitan, Sub-Metropolitan, Municipality, or Rural Municipality).",
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
      "short" : "Nepal Administrative Local Level (Palika) Type",
      "definition" : "An extension to categorize the specific local government tier in Nepal (Metropolitan, Sub-Metropolitan, Municipality, or Rural Municipality)."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-palika-type"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "code"
      }],
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://fhir.mohp.gov.np/ValueSet/nepal-palika-type-vs"
      }
    }]
  }
}

```
