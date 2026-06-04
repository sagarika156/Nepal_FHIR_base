# 🇳🇵 Nepal Baseline FHIR Implementation Guide

## 🌐 Live Implementation Guide
👉 **[View the Nepal Baseline FHIR IG](https://sagarika156.github.io/Nepal_FHIR_base)**

![FHIR Version](https://img.shields.io/badge/FHIR-R4%20(4.0.1)-blue)
![SUSHI Version]...

![FHIR Version](https://img.shields.io/badge/FHIR-R4%20(4.0.1)-blue)
![SUSHI Version](https://img.shields.io/badge/SUSHI-v3.19.0-green)
![IG Publisher](https://img.shields.io/badge/IG%20Publisher-v5.0.0-orange)
![Status](https://img.shields.io/badge/Status-Draft%20CI%20Build-yellow)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

> **"Nepal's digital health transition must not just collect data — it must capture the exact geographical and social realities of the Nepali people to drive equitable healthcare delivery."**

---

## 📋 Overview

The **Nepal Baseline FHIR Implementation Guide (fhir.np.base)** is a foundational HL7 FHIR R4 Implementation Guide that defines standardized patient demographic profiles for Nepal's national health information ecosystem.

While Nepal has achieved near-universal adoption of **DHIS2** for aggregate public health reporting across all **753 local levels**, true clinical data interoperability remains a critical systemic gap — a **"Fragmentation Blind Spot"** where disconnected digital silos prevent longitudinal patient tracking and distort national public health planning.

This IG directly addresses this challenge by establishing the standardized structural layer needed to bridge hospital EMR data seamlessly with national public health frameworks — built on the globally adopted **HL7 FHIR R4** standard.

---

## 🎯 Problem Statement

Nepal's health information landscape is characterized by a fundamental paradox:

- ✅ Impressive digital adoption at the **aggregate level** (DHIS2 across all 753 local levels)
- ❌ Profound fragmentation at the **clinical level** (isolated, standalone EMRs)

This fragmentation results in:
- **Identity Ambiguity** — No standardized mechanism to uniquely identify a patient across facilities
- **Geographic Data Loss** — Nepal's federal structure (7 Provinces, 77 Districts, 753 Palikas) rarely captured consistently
- **Demographic Blind Spots** — Caste and ethnicity data absent or inconsistently recorded, undermining health equity tracking

---

## 📦 What This IG Defines

| Artifact | ID | Description |
|----------|----|-------------|
| **Nepal Baseline Patient Profile** | `nepal-patient` | Constrained FHIR Patient with Nepal-specific identifiers, address structure, and demographic extensions |
| **NepalPalikaType Extension** | `nepal-palika-type` | Local government tier (Metropolitan, Sub-Metropolitan, Municipality, Rural Municipality) |
| **NepalCasteEthnicity Extension** | `nepal-caste-ethnicity` | Caste/ethnic group per MoHP Nepal HMIS guidelines |
| **Nepal Provinces ValueSet** | `nepal-provinces-vs` | All 7 federal provinces of Nepal |
| **Nepal Districts ValueSet** | `nepal-districts-vs` | Nepal's 77 administrative districts |
| **Nepal Palika Type ValueSet** | `nepal-palika-type-vs` | Four tiers of local government classification |
| **Nepal Caste & Ethnicity ValueSet** | `nepal-caste-ethnicity-vs` | Six major caste/ethnic group classifications per MoHP HMIS |

---

## 🔑 Key Design Decisions

### 1. Identifier Slicing — Solving Nepal's Identity Problem
A standard global FHIR Patient resource has no explicit field for Nepal-specific identifiers. This IG uses **identifier slicing** to define named, purpose-specific identifier slots:

| Slice | Type | Cardinality | Purpose |
|-------|------|-------------|---------|
| `healthId` | National Health ID | **1..1 Mandatory** | Primary clinical identifier |
| `citizenshipId` | Citizenship Certificate | 0..1 | Legal identity for adult citizens |
| `nationalId` | Rastriya Parichayapatra (राष्ट्रीय परिचयपत्र) | 0..1 | National ID card |
| `insuranceId` | Health Insurance / SSF | 0..1 | Social Security Fund linkage |

### 2. Federal Address Structure
Enforces Nepal's three-tier federal structure:
- `address.state` → bound to **NepalProvincesVS** (7 Provinces)
- `address.district` → bound to **NepalDistrictsVS** (77 Districts)
- `address.city` → Palika name
- `address.extension[palikaType]` → Local government tier

### 3. Health Equity by Design
The **NepalCasteEthnicity** extension ensures consistent capture of caste and ethnic group data per MoHP HMIS classifications — enabling targeted interventions for marginalized communities and monitoring of health equity indicators.

---

## 🛠️ Technical Stack

| Tool | Version | Purpose |
|------|---------|---------|
| [FHIR Shorthand (FSH)](https://fshschool.org) | v3.0.0 | Profile authoring language |
| [SUSHI](https://fshschool.org/docs/sushi/) | v3.19.0 | FSH → FHIR JSON compiler |
| [IG Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation) | v5.0.0 | HTML IG builder |
| FHIR Version | R4 (4.0.1) | Target specification |
| Node.js | v24.16.0 | SUSHI runtime |
| Java | 21.0.11 LTS | IG Publisher runtime |

---

## 🚀 Getting Started

### Prerequisites
Make sure you have the following installed:
- [Node.js](https://nodejs.org) (v22+ LTS)
- [Java](https://www.oracle.com/java/technologies/downloads/) (v21 LTS)
- [Ruby + Jekyll](https://rubyinstaller.org/downloads/) (Ruby+Devkit 4.0+)
- [SUSHI](https://fshschool.org/docs/sushi/installation/) (`npm install -g fsh-sushi`)

### Installation

**1. Clone the repository:**
```bash
git clone https://github.com/sagarika156/Nepal_FHIR_base.git
cd Nepal_FHIR_base
```

**2. Download the IG Publisher:**
```bash
# Windows
.\_updatePublisher.bat

# Mac/Linux
bash _updatePublisher.sh
```

**3. Compile FSH to FHIR JSON:**
```bash
sushi .
```

**4. Build the full IG website:**
```bash
# Windows
java -jar publisher.jar -ig .

# Mac/Linux
bash _genonce.sh
```

**5. Open the IG in your browser:**
```bash
# Windows
start output\index.html

# Mac/Linux
open output/index.html
```

---

## 🌐 Live Demo — HAPI FHIR Public Server

This IG has been validated against the **HAPI FHIR R4 Public Server**. The following example patient resources are live and retrievable:

### Patient 1 — Hari Prasad Shrestha
```
GET https://hapi.fhir.org/baseR4/Patient/135207008
```
- **Province:** Bagmati (p3)
- **District:** Lalitpur
- **Palika:** Mahalaxmi Municipality
- **Ethnicity:** Janajati
- **Identifiers:** National Health ID + Citizenship Certificate

### Patient 2 — Sita Kumari Tamang
```
GET https://hapi.fhir.org/baseR4/Patient/135207167
```
- **Province:** Koshi (p1)
- **District:** Jhapa
- **Palika:** Birtamode Municipality
- **Ethnicity:** Janajati
- **Identifiers:** National Health ID + Citizenship Certificate

> Try these URLs directly in your browser to retrieve live FHIR-compliant Nepal patient records!

---

## 📁 Repository Structure

```
Nepal_FHIR_base/
├── input/
│   ├── fsh/
│   │   ├── nepal_patient.fsh      ← Main FSH profile definitions
│   │   └── examples.fsh           ← Example patient instances
│   └── pagecontent/
│       └── index.md               ← IG home page documentation
├── fsh-generated/
│   └── resources/                 ← SUSHI-generated FHIR JSON (auto-generated)
├── input-cache/                   ← FHIR packages cache
├── template/                      ← IG Publisher templates
├── sushi-config.yaml              ← SUSHI project configuration
├── ig.ini                         ← IG Publisher settings
└── .gitignore                     ← Excludes publisher.jar and output/
```

---

## 📊 Build Status

| Metric | Status |
|--------|--------|
| SUSHI Compilation | ✅ 0 Errors, 0 Warnings |
| IG Publisher Build | ✅ 0 Errors, 6 Warnings (cosmetic) |
| Broken Links | ✅ 0 |
| HAPI FHIR Validation | ✅ Validated against R4 |

---

## 🔭 Future Work

- [ ] Complete all 77 districts in `NepalDistrictsCS`
- [ ] Nepal Observation Profile (vital signs, lab results)
- [ ] Nepal Encounter Profile (aligned with Nepal's referral system)
- [ ] Nepal Condition Profile (Nepal disease burden priorities)
- [ ] Nepal Medication Profile (aligned with NLEM)
- [ ] GitHub Actions CI/CD for automated IG builds
- [ ] Integration guidance for DHIS2 ↔ FHIR API connectivity

---

## 📚 References

- [HL7 FHIR R4 Specification](https://hl7.org/fhir/R4/)
- [FSH School — Official Tutorials](https://fshschool.org)
- [MoHP Nepal Digital Health Strategy](https://mohp.gov.np)
- [Nepal Health Sector Strategy (NHSS)](https://mohp.gov.np)
- [FHIR Shorthand Specification](https://build.fhir.org/ig/HL7/fhir-shorthand/)
- [HAPI FHIR Public Server](https://hapi.fhir.org)

---

## 👩‍💻 About the Author

**Sagarika Thapa**  
Masters in Health Informatics (4th Semester)  
Kathmandu University, Nepal  
GitHub: [@sagarika156](https://github.com/sagarika156)

This project was developed as an independent academic exploration in FHIR Implementation Guide authoring, motivated by the recognition that proficiency in FSH and IG development is a critical competency for health informaticians working on national digital health transformation initiatives in Nepal and similar LMIC contexts.

---

## 📄 Canonical Information

| Field | Value |
|-------|-------|
| **Package ID** | fhir.np.base |
| **Canonical URL** | http://fhir.mohp.gov.np |
| **Version** | 0.1.0 |
| **FHIR Version** | R4 (4.0.1) |
| **Status** | Draft — CI Build |
| **Publisher** | Sagarika Thapa |

---

> **Disclaimer:** This Implementation Guide is an independent academic work developed as part of graduate studies in Health Informatics at Kathmandu University. While aligned with publicly available MoHP Nepal guidelines and national administrative standards, it does not represent an official MoHP Nepal publication or endorsed national standard.

---

*Generated with ❤️ for Nepal's digital health future 🇳🇵*
