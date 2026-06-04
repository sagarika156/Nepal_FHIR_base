# Home - Nepal Baseline v0.1.0

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:http://fhir.mohp.gov.np/ImplementationGuide/fhir.np.base | *Version*:0.1.0 |
| Draft as of 2026-06-04 | *Computable Name*:NepalBaseline |

### Nepal Baseline FHIR Implementation Guide

This Implementation Guide defines the baseline FHIR profiles for Nepal, developed by the Ministry of Health and Population (MoHP).

#### Scope

This IG includes:

* Nepal Patient Profile with Nepali-specific extensions
* Slicing for local identifiers
* Extensions for citizenship number, ethnicity, and other Nepal-specific fields

#### Publisher

Sagarika Thapa GitHub: https://github.com/sagarika156

-------

# Nepal Baseline FHIR Implementation Guide

## 1. Introduction

Nepal stands at a defining inflection point in its digital health journey. While the country has achieved remarkable success with near-universal adoption of **DHIS2** for aggregate public health reporting across all **753 local levels**, true clinical data interoperability remains a critical systemic gap. The vast majority of the country's secondary and tertiary hospitals run on isolated, standalone Electronic Medical Record (EMR) systems that fail to communicate with national health frameworks — creating what can best be described as a **"Fragmentation Blind Spot"**: disconnected digital silos that prevent longitudinal patient tracking and distort national public health planning.

Previous integration attempts have largely relied on point-to-point custom interfaces that are costly, fragile, and impossible to scale nationally. The result is an ecosystem where critical healthcare data is locked away, unable to talk to each other, leading to severe under-reporting of disease burdens and compromised evidence-based policy making.

The **Nepal Baseline FHIR Implementation Guide (fhir.np.base)** directly addresses this systemic challenge by establishing a standardized, uniform structural layer needed to bridge hospital EMR data seamlessly with national public health frameworks — built on the globally adopted **HL7 FHIR R4** standard.

-------

## 2. Problem Statement

### 2.1 The Fragmentation Blind Spot

Nepal's health information landscape is characterized by a fundamental paradox: impressive digital adoption at the aggregate level, yet profound fragmentation at the clinical level. DHIS2 collects population-level statistics effectively, but the patient-level clinical journey — across facilities, across time — remains invisible to the national system.

This fragmentation manifests in three critical ways:

* **Identity Ambiguity:** No standardized mechanism exists to uniquely identify a patient across facilities. A patient seen at a district hospital in Kaski and later referred to a tertiary hospital in Kathmandu is effectively treated as two different patients in the national data ecosystem.
* **Geographic Data Loss:** Nepal's unique federal administrative structure — organized into 7 Provinces, 77 Districts, and 753 local government units (Palikas) — is rarely captured consistently in clinical records, making sub-national health planning imprecise.
* **Demographic Blind Spots:** Caste, ethnicity, and social group data — critical for tracking health equity in a diverse society like Nepal — are either absent or inconsistently recorded across EMR systems, undermining targeted public health interventions.

### 2.2 Why FHIR?

**HL7 FHIR (Fast Healthcare Interoperability Resources)** is the globally recognized gold standard for health data interoperability, adopted by the United States, European Union, Australia, and increasingly across South and Southeast Asia. FHIR provides:

* A universal, internet-native data format (JSON/XML) that any modern system can consume
* A rich base resource library covering every clinical domain
* A **profiling mechanism** that allows nations to localize global standards to their specific administrative, cultural, and clinical realities

For Nepal, FHIR profiling is not merely a technical exercise — it is the foundational infrastructure investment that transforms international, generic data standards into a **localized digital health ecosystem**.

-------

## 3. Scope and Purpose

This Implementation Guide defines the **Nepal Baseline Patient Profile** — the foundational demographic layer upon which all future Nepal FHIR clinical profiles will be built. It is intentionally scoped to the Patient resource as the first and most critical building block of any national health data architecture.

### 3.1 What This IG Defines

| | |
| :--- | :--- |
| **Nepal Baseline Patient Profile** | A constrained FHIR Patient resource incorporating Nepal-specific identifiers, address structure, family context, and demographic extensions |
| **NepalPalikaType Extension** | Captures the local government tier (Metropolitan, Sub-Metropolitan, Municipality, Rural Municipality) aligned with Nepal's federal structure |
| **NepalCasteEthnicity Extension** | Records caste and ethnic group classifications per MoHP Nepal HMIS guidelines |
| **Nepal Provinces Value Set** | All 7 federal provinces of Nepal |
| **Nepal Districts Value Set** | Sample of Nepal's 77 administrative districts |
| **Nepal Palika Type Value Set** | Four tiers of local government (Palika) classification |
| **Nepal Caste & Ethnicity Value Set** | Six major caste/ethnic group classifications per MoHP HMIS |

### 3.2 What This IG Does NOT Cover

This baseline guide intentionally excludes clinical resources (Observation, Condition, Encounter, Medication) which are planned for future iterations. This scoping decision reflects a deliberate architectural choice: establish the patient identity layer first, then build clinical data layers upon it.

-------

## 4. Design Decisions and Rationale

### 4.1 Identifier Slicing — Solving Nepal's Identity Problem

A standard global FHIR Patient resource has no explicit field for Nepal-specific identifiers. This IG solves this through **identifier slicing** — a FHIR profiling technique that constrains the generic identifier array into named, purpose-specific slots:

| | | | |
| :--- | :--- | :--- | :--- |
| `healthId` | National Health ID | 1..1 (Mandatory) | Primary clinical identifier for health system linkage |
| `citizenshipId` | Citizenship Certificate Number | 0..1 | Legal identity document for adult Nepali citizens |
| `nationalId` | Rastriya Parichayapatra (राष्ट्रीय परिचयपत्र) | 0..1 | National ID card — increasingly the primary identity document |
| `insuranceId` | Health Insurance / SSF Number | 0..1 | Social Security Fund and government health insurance linkage |

This design directly reflects Nepal's real-world identity landscape where patients may present with any combination of these documents, while ensuring the Health ID — as the primary clinical identifier — is always mandatory.

### 4.2 Federal Address Structure

Nepal's 2015 Constitution established a three-tier federal structure that is rarely captured accurately in existing EMR systems. This IG enforces this structure through address constraints:

* `address.state` — bound to **NepalProvincesVS** (required) — captures the federal province
* `address.district` — bound to **NepalDistrictsVS** (required) — captures the administrative district
* `address.city` — used for the Palika name (e.g., "Mahalaxmi Municipality")
* `address.line` — captures Ward Number and Tole/Village
* `address.extension[palikaType]` — the **NepalPalikaType** extension classifies the local government tier

This granular geographic capture enables sub-national health analytics aligned with Nepal's actual federal administrative boundaries — a critical requirement for evidence-based local health planning.

### 4.3 The Caste and Ethnicity Extension — Health Equity by Design

Nepal is one of the world's most ethnically diverse nations, with over 125 recognized ethnic groups and significant health outcome disparities across caste and ethnic lines. The **NepalCasteEthnicity** extension — bound to MoHP HMIS classifications — ensures that this demographic reality is captured consistently, enabling:

* Targeted public health interventions for marginalized communities
* Monitoring of health equity indicators across Dalit, Janajati, Madhesi, and other groups
* Alignment with Nepal's constitutional mandate for inclusive healthcare delivery

By designing these extensions into the baseline profile, this IG ensures that Nepal's digital health transition does not merely collect data — it captures the exact geographical and social realities of the Nepali people to drive **equitable healthcare delivery**.

-------

## 5. Alignment with National Health Policies

This Implementation Guide is designed in alignment with:

* **Nepal Health Sector Strategy (NHSS)** — supporting the goal of universal health coverage through improved health information systems
* **MoHP Nepal Digital Health Strategy** — contributing to the standardization pillar of Nepal's digital health transformation
* **MoHP HMIS Guidelines** — using official caste/ethnicity classifications from the national Health Management Information System
* **HL7 FHIR R4 Specification** — ensuring global interoperability while localizing for Nepal's administrative and clinical context

> **Note:** This Implementation Guide is an independent academic work developed as part of graduate studies in Health Informatics at Kathmandu University. While it is aligned with publicly available MoHP Nepal guidelines and national administrative standards, it does not represent an official MoHP Nepal publication or endorsed national standard. It is intended as a foundational contribution and reference implementation for Nepal's FHIR community.

-------

## 6. Technical Architecture

### 6.1 Toolchain

This IG was developed using the standard HL7 FHIR IG authoring toolchain:

| | | |
| :--- | :--- | :--- |
| FHIR Shorthand (FSH) | v3.0.0 | Human-readable profile authoring language |
| SUSHI | v3.19.0 | FSH compiler — converts FSH to FHIR JSON |
| IG Publisher | v5.0.0 | Builds the complete HTML Implementation Guide |
| FHIR Version | R4 (4.0.1) | Target FHIR specification |

### 6.2 Canonical URL

The canonical base URL for this IG is:

```
http://fhir.mohp.gov.np

```

### 6.3 Repository

The complete source code for this Implementation Guide, including all FSH definitions, is openly available at:

```
https://github.com/sagarika156/Nepal_FHIR_base

```

-------

## 7. Future Work

This baseline guide establishes the patient demographic layer. The following extensions are planned for future development:

* **Nepal Observation Profile** — vital signs and laboratory results with Nepal-specific reference ranges
* **Nepal Encounter Profile** — outpatient and inpatient encounter patterns aligned with Nepal's referral system (Primary → Secondary → Tertiary)
* **Nepal Condition Profile** — diagnosis profiling incorporating Nepal's disease burden priorities (communicable diseases, maternal health, non-communicable diseases)
* **Nepal Medication Profile** — aligned with the Nepal National List of Essential Medicines (NLEM)
* **Complete District Coverage** — expanding the NepalDistrictsCS to all 77 administrative districts
* **Integration Guidance** — technical guidance for connecting existing DHIS2 and hospital EMR systems to FHIR-compliant APIs

The ultimate vision is a **Nepal National FHIR Package** — a comprehensive, officially endorsed suite of FHIR profiles that enables true longitudinal patient tracking across Nepal's entire health system, eliminating the Fragmentation Blind Spot and enabling data-driven, equitable healthcare delivery for all 30 million Nepali citizens.

-------

## 8. About This Project

This Implementation Guide was developed as part of an independent academic exploration in **FHIR Implementation Guide authoring** during the **4th Semester of the Masters in Health Informatics program at Kathmandu University, Nepal**.

The project was motivated by the recognition that proficiency in FHIR Shorthand (FSH) and Implementation Guide development is a critical competency for health informaticians working on national digital health transformation initiatives. Rather than working on abstract exercises, this project chose to tackle a real, nationally significant problem: the absence of a standardized, localized FHIR Patient profile for Nepal.

This work represents a preparatory foundation for future graduate research at the intersection of **health data standards, national health information systems, and digital health equity in low- and middle-income country (LMIC) contexts**.

-------

## 9. Contact

**Author:** Sagarika Thapa **Institution:** Kathmandu University, Nepal
 **Program:** Masters in Health Informatics
 **GitHub:** [https://github.com/sagarika156](https://github.com/sagarika156)
 **IG Package:** fhir.np.base#0.1.0
 **FHIR Version:** R4 (4.0.1)
 **Status:** Draft — CI Build
 **Date:** June 2026



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "fhir.np.base",
  "url" : "http://fhir.mohp.gov.np/ImplementationGuide/fhir.np.base",
  "version" : "0.1.0",
  "name" : "NepalBaseline",
  "title" : "Nepal Baseline",
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
  "packageId" : "fhir.np.base",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.1.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.3.0"
  }],
  "definition" : {
    "extension" : [{
      "extension" : [{
        "url" : "code",
        "valueString" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "CI Build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://fhir.mohp.gov.np/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueString" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.1.2"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "CI Build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://fhir.mohp.gov.np/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/ExampleNepalPatient1"
      },
      "name" : "Example of a Nepal Baseline Patient 1",
      "description" : "A mockup patient record representing Hari Prasad Shrestha to demonstrate validation against the NepalPatient profile.",
      "exampleCanonical" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "Patient"
      }],
      "reference" : {
        "reference" : "Patient/ExampleNepalPatient2"
      },
      "name" : "Example of a Nepal Baseline Patient 2",
      "description" : "A mockup patient record representing Sita Kumari Tamang to demonstrate validation against the NepalPatient profile.",
      "exampleCanonical" : "http://fhir.mohp.gov.np/StructureDefinition/nepal-patient"
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nepal-palika-type"
      },
      "name" : "Nepal Administrative Local Level (Palika) Type",
      "description" : "An extension to categorize the specific local government tier in Nepal (Metropolitan, Sub-Metropolitan, Municipality, or Rural Municipality).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nepal-patient"
      },
      "name" : "Nepal Baseline Patient Profile",
      "description" : "The ultimate national baseline profile for Patients in Nepal, aligning core identifiers (Health ID, Citizenship, National ID), family contexts, and localized federal geography.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/nepal-caste-ethnicity-vs"
      },
      "name" : "Nepal Caste and Ethnicity Value Set",
      "description" : "The set of allowed codes for capturing a patient's ethnic background in Nepal baseline registries.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/nepal-districts-cs"
      },
      "name" : "Nepal Districts Code System",
      "description" : "The official 77 administrative districts of Nepal sorted by regional alignment.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/nepal-districts-vs"
      },
      "name" : "Nepal Districts Value Set",
      "description" : "Value set for enforcing validated district entry across medical records in Nepal.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/nepal-caste-ethnicity-cs"
      },
      "name" : "Nepal HMIS Caste and Ethnicity Group Code System",
      "description" : "Official classification of caste and ethnic groups utilized by the Ministry of Health and Population (MoHP) Nepal for health management information systems (HMIS).",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/nepal-palika-type-cs"
      },
      "name" : "Nepal Local Level Tier Code System",
      "description" : "Official code system for types of local governance bodies (Palikas) in Nepal.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/nepal-palika-type-vs"
      },
      "name" : "Nepal Local Level Tier Value Set",
      "description" : "Value set for selecting allowed structural types for local governance (Palika) in Nepal.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      }],
      "reference" : {
        "reference" : "StructureDefinition/nepal-caste-ethnicity"
      },
      "name" : "Nepal Patient Caste and Ethnicity Extension",
      "description" : "An extension to capture caste or ethnic classifications according to MoHP Nepal digital health guidelines.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      }],
      "reference" : {
        "reference" : "CodeSystem/nepal-provinces-cs"
      },
      "name" : "Nepal Provinces Code System",
      "description" : "The 7 federal provinces of Nepal as established by the Constitution.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      }],
      "reference" : {
        "reference" : "ValueSet/nepal-provinces-vs"
      },
      "name" : "Nepal Provinces Value Set",
      "description" : "Value set for selecting a valid federal province in Nepal.",
      "exampleBoolean" : false
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Home",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
