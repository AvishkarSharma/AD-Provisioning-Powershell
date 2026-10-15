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


```markdown
## Project Proof: Automation Results

### 1. The Scripts
**Defining the OU Structure:**
![OU Structure Script](screenshots/02-automation/01-script-ou-structure.png)

**Creating Users from CSV:**
![User Script](screenshots/02-automation/02-script-users.png)

**Creating Groups from CSV:**
![Group Script](screenshots/02-automation/03-script-groups.png)

### 2. Script Execution (Terminal)
**Users Created:**
![Terminal Users](screenshots/02-automation/04-terminal-users.png)

**Computers Created:**
![Terminal Computers](screenshots/02-automation/05-terminal-computers.png)

**Groups Created:**
![Terminal Groups](screenshots/02-automation/06-terminal-groups.png)

### 3. Verification in Active Directory
**Users in AD:**
![AD Users](screenshots/02-automation/07-ad-users-after.png)

**Computers in AD:**
![AD Computers](screenshots/02-automation/08-ad-computers-after.png)

**Groups in AD:**
![AD Groups](screenshots/02-automation/09-ad-groups-after.png)

---
*Note: For the underlying Infrastructure setup (DNS, DHCP, GPOs, and NTFS Permissions), please view the [Infrastructure Documentation](INFRASTRUCTURE.md).*
