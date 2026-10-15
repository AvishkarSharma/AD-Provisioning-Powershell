# Automation Proof

This document contains proof of the PowerShell scripts automating Active Directory provisioning for the `homedemo.com` domain. 

**Scope Note:** The automation scripts demonstrated below were scoped to the **Australia** Organizational Unit (OU) as a proof-of-concept. The script logic can be easily duplicated for other regions (e.g., Britain, USA) by updating the CSV paths and target OUs.

## 1. The Scripts

**Defining the OU Structure:**
*The script uses a nested hashtable to define the exact sub-OUs (Workstations, Laptops, IT, Finance) required specifically for the Australia region, ensuring a standardized directory structure.*

![OU Structure Script](screenshots/02%20Automation/1-scriptfor-ou-creation.png)

👉 **[View the OU Creation Script](scripts/create-ous.ps1)**

**Creating Users from CSV:**
*This script reads the Australia users CSV file to bulk-create users, dynamically constructing the Distinguished Name (DN) to place each user in their correct departmental OU based on their CSV data.*

![User Script](screenshots/02%20Automation/2-scriptfor-users-creation.png)

👉 **[View the User Creation Script](scripts/create-users.ps1)**

**Creating Groups from CSV:**
*Similar to user creation, this script parses the Australia groups CSV to generate Security and Distribution groups, automatically sorting them into the correct sub-OUs.*

![Group Script](screenshots/02%20Automation/3-scriptfor-groups-creation.png)

👉 **[View the Group Creation Script](scripts/create-group.ps1)**

**Creating Computers from CSV:**
*This script provisions the computer objects (Workstations and Laptops) into their respective nested OUs.*
👉 **[View the Computer Creation Script](scripts/create-computers.ps1)**

## 2. Script Execution (Terminal Output)

**Users Created (Australia):**
*Execution proof: The script successfully provisioned 12 users across 4 different departments in the Australia OU, with built-in error handling skipping any existing accounts.*

![Terminal Users](screenshots/02%20Automation/4-user-script-executed.png)

**Computers Created (Australia):**
*Execution proof: The script created 8 computer objects (Workstations and Laptops) and placed them into their respective Australia OUs automatically.*

![Terminal Computers](screenshots/02%20Automation/5-user-script-executed.png)

**Groups Created (Australia):**
*Execution proof: The script generated 5 new groups for the Australia region. The summary confirms 0 errors, demonstrating the reliability of the idempotent logic.*

![Terminal Groups](screenshots/02%20Automation/6-user-script-executed.png)

## 3. Verification in Active Directory

**Users Verified (Australia):**
*Graphical verification in Active Directory Users and Computers (ADUC) confirming the users were created and placed in the correct Australia OU.*

![AD Users](screenshots/02%20Automation/7-desktop-proof.png)

**Computers Verified (Australia):**
*Graphical verification confirming the computer objects exist within the nested Workstations/Laptops OUs under Australia.*

![AD Computers](screenshots/02%20Automation/8-user-proof.png)

**Groups Verified (Australia):**
*Graphical verification of the newly created Security and Distribution groups within the Australia Groups OU.*

![AD Groups](screenshots/02%20Automation/9-groups-proof.png)
