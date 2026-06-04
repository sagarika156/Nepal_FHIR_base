# Artifacts Summary - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Nepal Baseline Patient Profile](StructureDefinition-nepal-patient.md) | The ultimate national baseline profile for Patients in Nepal, aligning core identifiers (Health ID, Citizenship, National ID), family contexts, and localized federal geography. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Nepal Administrative Local Level (Palika) Type](StructureDefinition-nepal-palika-type.md) | An extension to categorize the specific local government tier in Nepal (Metropolitan, Sub-Metropolitan, Municipality, or Rural Municipality). |
| [Nepal Patient Caste and Ethnicity Extension](StructureDefinition-nepal-caste-ethnicity.md) | An extension to capture caste or ethnic classifications according to MoHP Nepal digital health guidelines. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Nepal Caste and Ethnicity Value Set](ValueSet-nepal-caste-ethnicity-vs.md) | The set of allowed codes for capturing a patient's ethnic background in Nepal baseline registries. |
| [Nepal Districts Value Set](ValueSet-nepal-districts-vs.md) | Value set for enforcing validated district entry across medical records in Nepal. |
| [Nepal Local Level Tier Value Set](ValueSet-nepal-palika-type-vs.md) | Value set for selecting allowed structural types for local governance (Palika) in Nepal. |
| [Nepal Provinces Value Set](ValueSet-nepal-provinces-vs.md) | Value set for selecting a valid federal province in Nepal. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Nepal Districts Code System](CodeSystem-nepal-districts-cs.md) | The official 77 administrative districts of Nepal sorted by regional alignment. |
| [Nepal HMIS Caste and Ethnicity Group Code System](CodeSystem-nepal-caste-ethnicity-cs.md) | Official classification of caste and ethnic groups utilized by the Ministry of Health and Population (MoHP) Nepal for health management information systems (HMIS). |
| [Nepal Local Level Tier Code System](CodeSystem-nepal-palika-type-cs.md) | Official code system for types of local governance bodies (Palikas) in Nepal. |
| [Nepal Provinces Code System](CodeSystem-nepal-provinces-cs.md) | The 7 federal provinces of Nepal as established by the Constitution. |

### Example: Example Instances 

These are example instances that show what data produced and consumed by systems conforming with this implementation guide might look like.

| | |
| :--- | :--- |
| [Example of a Nepal Baseline Patient 1](Patient-ExampleNepalPatient1.md) | A mockup patient record representing Hari Prasad Shrestha to demonstrate validation against the NepalPatient profile. |
| [Example of a Nepal Baseline Patient 2](Patient-ExampleNepalPatient2.md) | A mockup patient record representing Sita Kumari Tamang to demonstrate validation against the NepalPatient profile. |

