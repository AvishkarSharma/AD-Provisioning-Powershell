# Automation Proof

This document contains proof of the PowerShell scripts automating Active Directory provisioning for the `homedemo.com` domain.

## 1. The Scripts

**Defining the OU Structure:**
*The script uses a nested hashtable to define the exact sub-OUs (Workstations, Laptops, IT, Finance) required for each region, ensuring a standardized directory structure every time.*
![OU Structure Script](screenshots/02%20Automation/1-scriptfor-ou-creation.png)

**Creating Users from CSV:**
*This script reads a CSV file to bulk-create users, dynamically constructing the Distinguished Name (DN) to place each user in their correct departmental OU based on their CSV data.*
![User Script](screenshots/02%20Automation/2-scriptfor-users-creation.png)

**Creating Groups from CSV:**
*Similar to user creation, this script parses a CSV to generate Security and Distribution groups, automatically sorting them into the correct sub-OUs.*
![Group Script](screenshots/02%20Automation/3-scriptfor-groups-creation.png)

## 2. Script Execution (Terminal Output)

**Users Created:**
*Execution proof: The script successfully provisioned 12 users across 4 different departments, with built-in error handling skipping any existing accounts.*
![Terminal Users](screenshots/02%20Automation/4-user-script-executed.png)

**Computers Created:**
*Execution proof: The script created 8 computer objects (Workstations and Laptops) and placed them into their respective OUs automatically.*
![Terminal Computers](screenshots/02%20Automation/5-user-script-executed.png)

**Groups Created:**
*Execution proof: The script generated 5 new groups. The summary confirms 0 errors, demonstrating the reliability of the idempotent logic.*
![Terminal Groups](screenshots/02%20Automation/6-user-script-executed.png)

## 3. Verification in Active Directory

**Users Verified:**
*Graphical verification in Active Directory Users and Computers (ADUC) confirming the users were created and placed in the correct Australia OU.*
![AD Users](screenshots/02%20Automation/7-desktop-proof.png)

**Computers Verified:**
*Graphical verification confirming the computer objects exist within the nested Workstations/Laptops OUs.*
![AD Computers](screenshots/02%20Automation/8-user-proof.png)

**Groups Verified:**
*Graphical verification of the newly created Security and Distribution groups within the Australia Groups OU.*
![AD Groups](screenshots/02%20Automation/9-groups-proof.png)
