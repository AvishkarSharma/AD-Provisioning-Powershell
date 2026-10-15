# Infrastructure & Home Lab Setup Proof

This document contains proof of the underlying Windows Server infrastructure configured for the `homedemo.com` domain prior to automation.

## 1. Server Roles & Initial AD Structure
**Server Manager Dashboard:**
![Server Manager](screenshots/01%20Infrastructure/01-server-manager-roles.png)

**Initial Empty AD Structure:**
![AD Structure](screenshots/01%20Infrastructure/02-ou-structure.png)

**Users in OU:**
![Users in OU](screenshots/01%20Infrastructure/03-users-in-ou.png)

**Security Groups:**
![Security Groups](screenshots/01%20Infrastructure/04-security:-groups.png)

## 2. DNS Configuration
**Forward Lookup Zones:**
![DNS Forward](screenshots/01%20Infrastructure/05-dns-forward-zone.png)

**Reverse Lookup Zones:**
![DNS Reverse](screenshots/01%20Infrastructure/06-dns-reverse-zone.png)

## 3. DHCP Configuration
**DHCP Scope:**
![DHCP Scope](screenshots/01%20Infrastructure/07-dhcp-scope.png)

**DHCP Address Leases:**
![DHCP Leases](screenshots/01%20Infrastructure/08-dhcp-leases.png)

## 4. Client Configuration & Verification
**Client IP Configuration:**
![Client IPConfig](screenshots/01%20Infrastructure/09-client-ipconfig.png)

**Domain Join (Access work or school):**
![Domain Join](screenshots/01%20Infrastructure/10-client-domain-join.png)

**DNS Resolution Verification (nslookup):**
![DNS Verify](screenshots/01%20Infrastructure/11-client-dns-verify.png)

**Client Login Screen:**
![Client Login](screenshots/01%20Infrastructure/12-client-login.png)

**Whoami Verification:**
![Whoami](screenshots/01%20Infrastructure/13-client-whoami.png)

## 5. Group Policy Objects (GPO)
**Password Policy:**
![GPO Password](screenshots/01%20Infrastructure/14-gpo-password-policy.png)

**Account Lockout Policy:**
![GPO Lockout](screenshots/01%20Infrastructure/15-gpo-lockout-policy.png)

**Block Control Panel GPO (Editor):**
![GPO Block Control](screenshots/01%20Infrastructure/16-gpo-block-control-panel.png)

**GPO Link (SG-Finance-Australia):**
![GPO Link](screenshots/01%20Infrastructure/17-gpo-link.png)

**GPO Restriction Proof (Client):**
![GPO Proof](screenshots/01%20Infrastructure/18-gpo-restriction-proof.png)

## 6. File Share & NTFS Permissions
**Share Permissions (IT Admin):**
![Share Permissions](screenshots/01%20Infrastructure/19-share-permissions.png)

**NTFS Permissions (Test Account):**
![NTFS Permissions](screenshots/01%20Infrastructure/20-ntfs-permissions.png)
