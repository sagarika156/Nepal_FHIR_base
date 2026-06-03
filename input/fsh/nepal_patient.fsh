Profile: NepalPatient
Parent: Patient
Id: nepal-patient
Title: "Nepal Baseline Patient Profile"
Description: "The ultimate national baseline profile for Patients in Nepal, aligning core identifiers (Health ID, Citizenship, National ID), family contexts, and localized federal geography."

// 1. Core Mandatory Constraints
* name 1..*
* gender 1..1
* birthDate 1..1

// 2. Localized Slicing for Identifiers (Including official Health ID)
* identifier ^slicing.rules = #open
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier contains 
    healthId 1..1 MS and      // Making a unique Health ID mandatory for clinical registries
    citizenshipId 0..1 MS and
    nationalId 0..1 MS and
    insuranceId 0..1 MS

* identifier[healthId].type = http://terminology.hl7.org/CodeSystem/v2-0203#NH // National Health Identifier
* identifier[healthId].type.text = "National Health ID"
* identifier[healthId].value 1..1 MS

* identifier[citizenshipId].type = http://terminology.hl7.org/CodeSystem/v2-0203#CZ
* identifier[citizenshipId].type.text = "Citizenship Certificate Number"
* identifier[citizenshipId].value 1..1 MS

* identifier[nationalId].type = http://terminology.hl7.org/CodeSystem/v2-0203#NI
* identifier[nationalId].type.text = "National ID (Rastriya Parichayapatra)"
* identifier[nationalId].value 1..1 MS

* identifier[insuranceId].type = http://terminology.hl7.org/CodeSystem/v2-0203#MB 
* identifier[insuranceId].type.text = "Health Insurance / SSF Number"
* identifier[insuranceId].value 1..1 MS


// 3. Localized Address Constraints mapped to Federal Structures
* address 0..* MS
* address.state 1..1 MS      
* address.state from NepalProvincesVS (required) 

* address.district 1..1 MS   
* address.district from NepalDistrictsVS (required) 

* address.city 1..1 MS       // Used for the Palika name (e.g., "Mahalaxmi")

// Fix: Inline definition rule for address extensions
* address.extension contains NepalPalikaType named palikaType 1..1 MS

// Fix: Broad description for address lines instead of index caret rules
* address.line 1..2 MS
* address.line ^short = "Captured lines (Line 1: Ward Number e.g. 'Ward 4', Line 2: Tole/Village e.g. 'Imadol')"

// 4. Cultural Constraints: Family Relations (Father / Spouse)
* contact ^slicing.rules = #open
* contact ^slicing.discriminator.type = #value
* contact ^slicing.discriminator.path = "relationship"
* contact contains fatherOrSpouse 0..2 MS

* contact[fatherOrSpouse].relationship from http://terminology.hl7.org/ValueSet/v2-0131 (required)
* contact[fatherOrSpouse].name 1..1 MS // Explicitly requires the relative's name

// 5. Custom Nepal Demographic Extensions
* extension contains NepalCasteEthnicity named casteEthnicity 0..1 MS


// ==========================================
// DEFINITIONS OF EXTENSIONS & VALUE SETS
// ==========================================

Extension: NepalCasteEthnicity
Id: nepal-caste-ethnicity
Title: "Nepal Patient Caste and Ethnicity Extension"
Description: "An extension to capture caste or ethnic classifications according to MoHP Nepal digital health guidelines."
* value[x] only CodeableConcept
* valueCodeableConcept from NepalCasteEthnicityVS (required)

// =================================================================
// 1. NEPAL CASTE / ETHNICITY DICTIONARY (CodeSystem)
// =================================================================
CodeSystem: NepalCasteEthnicityCS
Id: nepal-caste-ethnicity-cs
Title: "Nepal HMIS Caste and Ethnicity Group Code System"
Description: "Official classification of caste and ethnic groups utilized by the Ministry of Health and Population (MoHP) Nepal for health management information systems (HMIS)."
* ^caseSensitive = true
* ^experimental = false

* #1 "Dalit" "Disadvantaged or marginalized groups under national dalit schedules"
* #2 "Janajati" "Indigenous nationalities / Adibasi Janajati groups"
* #3 "Madhesi" "Terai / Madhesh regional communities"
* #4 "Muslim" "Islamic religious/cultural minority demographic"
* #5 "Brahmin/Chhetri" "Relatively advantaged hill and plain socio-cultural groups"
* #6 "Others" "Other unclassified ethnic or linguistic identities"


// =================================================================
// 2. BINDING THE DICTIONARY TO THE FHIR VALUE SET
// =================================================================
ValueSet: NepalCasteEthnicityVS
Id: nepal-caste-ethnicity-vs
Title: "Nepal Caste and Ethnicity Value Set"
Description: "The set of allowed codes for capturing a patient's ethnic background in Nepal baseline registries."
* ^experimental = false
* include codes from system NepalCasteEthnicityCS

// =================================================================
// 4. NEPAL PROVINCES DICTIONARY
// =================================================================
CodeSystem: NepalProvincesCS
Id: nepal-provinces-cs
Title: "Nepal Provinces Code System"
Description: "The 7 federal provinces of Nepal as established by the Constitution."
* ^caseSensitive = true
* ^experimental = false

* #p1 "Koshi Province"
* #p2 "Madhesh Province"
* #p3 "Bagmati Province"
* #p4 "Gandaki Province"
* #p5 "Lumbini Province"
* #p6 "Karnali Province"
* #p7 "Sudurpashchim Province"

ValueSet: NepalProvincesVS
Id: nepal-provinces-vs
Title: "Nepal Provinces Value Set"
Description: "Value set for selecting a valid federal province in Nepal."
* ^experimental = false
* include codes from system NepalProvincesCS

// =================================================================
// 5. NEPAL DISTRICTS DICTIONARY (Sample of the 77 Districts)
// =================================================================
CodeSystem: NepalDistrictsCS
Id: nepal-districts-cs
Title: "Nepal Districts Code System"
Description: "The official 77 administrative districts of Nepal sorted by regional alignment."
* ^caseSensitive = true
* ^experimental = false

// Bagmati District Samples
* #dist-301 "Kathmandu"
* #dist-302 "Lalitpur"
* #dist-303 "Bhaktapur"
* #dist-304 "Kavrepalanchok"
* #dist-305 "Chitwan"
// Gandaki District Samples
* #dist-401 "Kaski"
* #dist-402 "Tanahu"
* #dist-403 "Gorkha"
// Koshi District Samples
* #dist-101 "Morang"
* #dist-102 "Sunsari"
* #dist-103 "Jhapa"
// Add remaining districts sequentially as needed for your specific deployment footprint

ValueSet: NepalDistrictsVS
Id: nepal-districts-vs
Title: "Nepal Districts Value Set"
Description: "Value set for enforcing validated district entry across medical records in Nepal."
* ^experimental = false
* include codes from system NepalDistrictsCS

// =================================================================
// 6. NEPAL ADMINISTRATIVE PALIKA TYPE DEFINITIONS
// =================================================================
Extension: NepalPalikaType
Id: nepal-palika-type
Title: "Nepal Administrative Local Level (Palika) Type"
Description: "An extension to categorize the specific local government tier in Nepal (Metropolitan, Sub-Metropolitan, Municipality, or Rural Municipality)."
* value[x] only code
* valueCode from NepalPalikaTypeVS (required)

CodeSystem: NepalPalikaTypeCS
Id: nepal-palika-type-cs
Title: "Nepal Local Level Tier Code System"
Description: "Official code system for types of local governance bodies (Palikas) in Nepal."
* ^caseSensitive = true
* ^experimental = false

* #metropolitan "Metropolitan City (Mahanagarpalika)"
* #sub-metropolitan "Sub-Metropolitan City (Upamahanagarpalika)"
* #municipality "Municipality (Nagarpalika)"
* #rural-municipality "Rural Municipality (Gaupalika)"

ValueSet: NepalPalikaTypeVS
Id: nepal-palika-type-vs
Title: "Nepal Local Level Tier Value Set"
Description: "Value set for selecting allowed structural types for local governance (Palika) in Nepal."
* ^experimental = false
* include codes from system NepalPalikaTypeCS