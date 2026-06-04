Instance: ExampleNepalPatient1
InstanceOf: NepalPatient
Usage: #example
Title: "Example of a Nepal Baseline Patient 1"
Description: "A mockup patient record representing Hari Prasad Shrestha to demonstrate validation against the NepalPatient profile."

* name[0].use = #official
* name[0].text = "Hari Prasad Shrestha"
* name[0].family = "Shrestha"
* name[0].given[0] = "Hari"
* name[0].given[1] = "Prasad"

* gender = #male
* birthDate = "1988-08-15"

// 1. Populating our Sliced Identifiers
* identifier[healthId].type = http://terminology.hl7.org/CodeSystem/v2-0203#NH
* identifier[healthId].value = "NHID-9982-3145"

* identifier[citizenshipId].type = http://terminology.hl7.org/CodeSystem/v2-0203#CZ
* identifier[citizenshipId].value = "27-01-75-04321"

// 2. Populating Local Federal Address Structures
* address[0].use = #home
* address[0].type = #both
* address[0].state = NepalProvincesCS#p3 "Bagmati Province"
* address[0].district = NepalDistrictsCS#dist-302 "Lalitpur"
* address[0].city = "Mahalaxmi"
* address[0].extension[palikaType].valueCode = #municipality 

// Capturing Ward and Tole as structured lines
* address[0].line[0] = "Ward 4"
* address[0].line[1] = "Imadol"

// 3. Using our Custom Demographic Extension (Code 2 = Janajati)
* extension[casteEthnicity].valueCodeableConcept = NepalCasteEthnicityCS#2 "Janajati"


Instance: ExampleNepalPatient2
InstanceOf: NepalPatient
Usage: #example
Title: "Example of a Nepal Baseline Patient 2"
Description: "A mockup patient record representing Sita Kumari Tamang to demonstrate validation against the NepalPatient profile."
* name[0].use = #official
* name[0].text = "Sita Kumari Tamang"
* name[0].family = "Tamang"
* name[0].given[0] = "Sita"
* name[0].given[1] = "Kumari"
* gender = #female
* birthDate = "1965-03-22"
* identifier[healthId].type = http://terminology.hl7.org/CodeSystem/v2-0203#NH
* identifier[healthId].value = "NHID-1234-5678"
* identifier[citizenshipId].type = http://terminology.hl7.org/CodeSystem/v2-0203#CZ
* identifier[citizenshipId].value = "32-02-80-09876"
* address[0].use = #home
* address[0].type = #both
* address[0].state = NepalProvincesCS#p1 "Koshi Province"
* address[0].district = NepalDistrictsCS#dist-103 "Jhapa"
* address[0].city = "Birtamode"
* address[0].extension[palikaType].valueCode = #municipality
* address[0].line[0] = "Ward 7"
* address[0].line[1] = "Shantinagar"
* extension[casteEthnicity].valueCodeableConcept = NepalCasteEthnicityCS#2 "Janajati"