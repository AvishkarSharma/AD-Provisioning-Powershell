# AD-Provisioning-Powershell
Description: PowerShell scripts to automate Active Directory OU, User, Group, and Computer provisioning from CSV data.
## Overview
This project demonstrates a complete Windows Server Home Lab environment (homedemo.com) and a suite of PowerShell scripts designed to automate the provisioning of Active Directory Users,Groups and Objects.
Manually creating Users, Groups, and Computers for new regional offices is time-consuming and prone to human error. This project solves that by reading CSV data to dynamically build OU structures and provision objects in seconds.
## Technologies Used
* **PowerShell** (Scripting & Automation)
* **Active Directory Domain Services (AD DS)**
* **Windows Server** (DNS, DHCP, Group Policy)
* **CSV Data Parsing*

  
# Repository Structure
```text
/Active-Directory-Automation
├── /scripts
│   ├── create-users.ps1
│   ├── create-computers.ps1
│   └── create-groups.ps1
├── /data
│   ├── australia-users.csv
│   ├── australia-computers.csv
│   └── australia-groups.csv
├── /screenshots
│   ├── /01-infrastructure (DNS, DHCP, GPO, Permissions)
│   └── /02-automation (Scripts and Execution)
└── README.md


---

## 🔗 Infrastructure Documentation

To view the proof of the underlying infrastructure setup (DNS, DHCP, GPOs, and NTFS Permissions), please click the link below:

👉 ** [Click here to view the Infrastructure Setup Proof](infrastructure.md) **
