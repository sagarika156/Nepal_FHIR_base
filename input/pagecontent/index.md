### Nepal Baseline FHIR Implementation Guide

This Implementation Guide defines the baseline FHIR profiles 
for Nepal, developed by the Ministry of Health and Population (MoHP).

#### Scope
This IG includes:
- Nepal Patient Profile with Nepali-specific extensions
- Slicing for local identifiers
- Extensions for citizenship number, ethnicity, and other Nepal-specific fields

#### Publisher
Sagarika Thapa 
GitHub: https://github.com/sagarika156

---

# Nepal Baseline FHIR Implementation Guide

## 1. Introduction

Nepal stands at a defining inflection point in its digital health journey. While the country has achieved remarkable success with near-universal adoption of **DHIS2** for aggregate public health reporting across all **753 local levels**, true clinical data interoperability remains a critical systemic gap. The vast majority of the country's secondary and tertiary hospitals run on isolated, standalone Electronic Medical Record (EMR) systems that fail to communicate with national health frameworks — creating what can best be described as a **"Fragmentation Blind Spot"**: disconnected digital silos that prevent longitudinal patient tracking and distort national public health planning.

Previous integration attempts have largely relied on point-to-point custom interfaces that are costly, fragile, and impossible to scale nationally. The result is an ecosystem where critical healthcare data is locked away, unable to talk to each other, leading to severe under-reporting of disease burdens and compromised evidence-based policy making.

The **Nepal Baseline FHIR Implementation Guide (fhir.np.base)** directly addresses this systemic challenge by establishing a standardized, uniform structural layer needed to bridge hospital EMR data seamlessly with national public health frameworks — built on the globally adopted **HL7 FHIR R4** standard.

---

## 2. Problem Statement

### 2.1 The Fragmentation Blind Spot

Nepal's health information landscape is characterized by a fundamental paradox: impressive digital adoption at the aggregate level, yet profound fragmentation at the clinical level. DHIS2 collects population-level statistics effectively, but the patient-level clinical journey — across facilities, across time — remains invisible to the national system.

This fragmentation manifests in three critical ways:

- **Identity Ambiguity:** No standardized mechanism exists to uniquely identify a patient across facilities. A patient seen at a district hospital in Kaski and later referred to a tertiary hospital in Kathmandu is effectively treated as two different patients in the national data ecosystem.

- **Geographic Data Loss:** Nepal's unique federal administrative structure — organized into 7 Provinces, 77 Districts, and 753 local government units (Palikas) — is rarely captured consistently in clinical records, making sub-national health planning imprecise.

- **Demographic Blind Spots:** Caste, ethnicity, and social group data — critical for tracking health equity in a diverse society like Nepal — are either absent or inconsistently recorded across EMR systems, undermining targeted public health interventions.

### 2.2 Why FHIR?

**HL7 FHIR (Fast Healthcare Interoperability Resources)** is the globally recognized gold standard for health data interoperability, adopted by the United States, European Union, Australia, and increasingly across South and Southeast Asia. FHIR provides:

- A universal, internet-native data format (JSON/XML) that any modern system can consume
- A rich base resource library covering every clinical domain
- A **profiling mechanism** that allows nations to localize global standards to their specific administrative, cultural, and clinical realities

For Nepal, FHIR profiling is not merely a technical exercise — it is the foundational infrastructure investment that transforms international, generic data standards into a **localized digital health ecosystem**.

---

## 3. Scope and Purpose

This Implementation Guide defines the **Nepal Baseline Patient Profile** — the foundational demographic layer upon which all future Nepal FHIR clinical profiles will be built. It is intentionally scoped to the Patient resource as the first and most critical building block of any national health data architecture.

### 3.1 What This IG Defines

| Artifact | Description |
|----------|-------------|
| **Nepal Baseline Patient Profile** | A constrained FHIR Patient resource incorporating Nepal-specific identifiers, address structure, family context, and demographic extensions |
| **NepalPalikaType Extension** | Captures the local government tier (Metropolitan, Sub-Metropolitan, Municipality, Rural Municipality) aligned with Nepal's federal structure |
| **NepalCasteEthnicity Extension** | Records caste and ethnic group classifications per MoHP Nepal HMIS guidelines |
| **Nepal Provinces Value Set** | All 7 federal provinces of Nepal |
| **Nepal Districts Value Set** | Sample of Nepal's 77 administrative districts |
| **Nepal Palika Type Value Set** | Four tiers of local government (Palika) classification |
| **Nepal Caste & Ethnicity Value Set** | Six major caste/ethnic group classifications per MoHP HMIS |

### 3.2 What This IG Does NOT Cover

This baseline guide intentionally excludes clinical resources (Observation, Condition, Encounter, Medication) which are planned for future iterations. This scoping decision reflects a deliberate architectural choice: establish the patient identity layer first, then build clinical data layers upon it.

---

## 4. Design Decisions and Rationale

### 4.1 Identifier Slicing — Solving Nepal's Identity Problem

A standard global FHIR Patient resource has no explicit field for Nepal-specific identifiers. This IG solves this through **identifier slicing** — a FHIR profiling technique that constrains the generic identifier array into named, purpose-specific slots:

| Slice | Identifier Type | Cardinality | Rationale |
|-------|----------------|-------------|-----------|
| `healthId` | National Health ID | 1..1 (Mandatory) | Primary clinical identifier for health system linkage |
| `citizenshipId` | Citizenship Certificate Number | 0..1 | Legal identity document for adult Nepali citizens |
| `nationalId` | Rastriya Parichayapatra (राष्ट्रीय परिचयपत्र) | 0..1 | National ID card — increasingly the primary identity document |
| `insuranceId` | Health Insurance / SSF Number | 0..1 | Social Security Fund and government health insurance linkage |

This design directly reflects Nepal's real-world identity landscape where patients may present with any combination of these documents, while ensuring the Health ID — as the primary clinical identifier — is always mandatory.

### 4.2 Federal Address Structure

Nepal's 2015 Constitution established a three-tier federal structure that is rarely captured accurately in existing EMR systems. This IG enforces this structure through address constraints:

- `address.state` — bound to **NepalProvincesVS** (required) — captures the federal province
- `address.district` — bound to **NepalDistrictsVS** (required) — captures the administrative district  
- `address.city` — used for the Palika name (e.g., "Mahalaxmi Municipality")
- `address.line` — captures Ward Number and Tole/Village
- `address.extension[palikaType]` — the **NepalPalikaType** extension classifies the local government tier

This granular geographic capture enables sub-national health analytics aligned with Nepal's actual federal administrative boundaries — a critical requirement for evidence-based local health planning.

### 4.3 The Caste and Ethnicity Extension — Health Equity by Design

Nepal is one of the world's most ethnically diverse nations, with over 125 recognized ethnic groups and significant health outcome disparities across caste and ethnic lines. The **NepalCasteEthnicity** extension — bound to MoHP HMIS classifications — ensures that this demographic reality is captured consistently, enabling:

- Targeted public health interventions for marginalized communities
- Monitoring of health equity indicators across Dalit, Janajati, Madhesi, and other groups
- Alignment with Nepal's constitutional mandate for inclusive healthcare delivery

By designing these extensions into the baseline profile, this IG ensures that Nepal's digital health transition does not merely collect data — it captures the exact geographical and social realities of the Nepali people to drive **equitable healthcare delivery**.

---

## 5. Alignment with National Health Policies

This Implementation Guide is designed in alignment with:

- **Nepal Health Sector Strategy (NHSS)** — supporting the goal of universal health coverage through improved health information systems
- **MoHP Nepal Digital Health Strategy** — contributing to the standardization pillar of Nepal's digital health transformation
- **MoHP HMIS Guidelines** — using official caste/ethnicity classifications from the national Health Management Information System
- **HL7 FHIR R4 Specification** — ensuring global interoperability while localizing for Nepal's administrative and clinical context

> **Note:** This Implementation Guide is an independent academic work developed as part of graduate studies in Health Informatics at Kathmandu University. While it is aligned with publicly available MoHP Nepal guidelines and national administrative standards, it does not represent an official MoHP Nepal publication or endorsed national standard. It is intended as a foundational contribution and reference implementation for Nepal's FHIR community.

---

## 6. Technical Architecture

### 6.1 Toolchain

This IG was developed using the standard HL7 FHIR IG authoring toolchain:

| Tool | Version | Purpose |
|------|---------|---------|
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

---

## 7. Future Work

This baseline guide establishes the patient demographic layer. The following extensions are planned for future development:

- **Nepal Observation Profile** — vital signs and laboratory results with Nepal-specific reference ranges
- **Nepal Encounter Profile** — outpatient and inpatient encounter patterns aligned with Nepal's referral system (Primary → Secondary → Tertiary)
- **Nepal Condition Profile** — diagnosis profiling incorporating Nepal's disease burden priorities (communicable diseases, maternal health, non-communicable diseases)
- **Nepal Medication Profile** — aligned with the Nepal National List of Essential Medicines (NLEM)
- **Complete District Coverage** — expanding the NepalDistrictsCS to all 77 administrative districts
- **Integration Guidance** — technical guidance for connecting existing DHIS2 and hospital EMR systems to FHIR-compliant APIs

The ultimate vision is a **Nepal National FHIR Package** — a comprehensive, officially endorsed suite of FHIR profiles that enables true longitudinal patient tracking across Nepal's entire health system, eliminating the Fragmentation Blind Spot and enabling data-driven, equitable healthcare delivery for all 30 million Nepali citizens.

---

## 8. About This Project

This Implementation Guide was developed as part of an independent academic exploration in **FHIR Implementation Guide authoring** during the **4th Semester of the Masters in Health Informatics program at Kathmandu University, Nepal**.

The project was motivated by the recognition that proficiency in FHIR Shorthand (FSH) and Implementation Guide development is a critical competency for health informaticians working on national digital health transformation initiatives. Rather than working on abstract exercises, this project chose to tackle a real, nationally significant problem: the absence of a standardized, localized FHIR Patient profile for Nepal.

This work represents a preparatory foundation for future graduate research at the intersection of **health data standards, national health information systems, and digital health equity in low- and middle-income country (LMIC) contexts**.

---

## 9. Contact

**Author:** Sagarika Thapa
**Institution:** Kathmandu University, Nepal  
**Program:** Masters in Health Informatics  
**GitHub:** [https://github.com/sagarika156](https://github.com/sagarika156)  
**IG Package:** fhir.np.base#0.1.0  
**FHIR Version:** R4 (4.0.1)  
**Status:** Draft — CI Build  
**Date:** June 2026
