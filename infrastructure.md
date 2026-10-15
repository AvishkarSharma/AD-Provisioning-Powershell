# Infrastructure & Home Lab Setup Proof

This document contains proof of the underlying Windows Server infrastructure configured for the `homedemo.com` domain prior to automation.

## 1. Server Roles & Initial AD Structure
**Server Manager Dashboard:**
![Server Manager](screenshots/01-infrastructure/01-server-manager.png)

**Initial Empty AD Structure:**
![AD Before](screenshots/01-infrastructure/02-ad-structure-before.png)

## 2. DNS Configuration
**Forward Lookup Zones:**
![DNS Forward](screenshots/01-infrastructure/05-dns-forward.png)

**Reverse Lookup Zones:**
![DNS Reverse](screenshots/01-infrastructure/06-dns-reverse.png)

## 3. DHCP Configuration
**DHCP Scope:**
![DHCP Scope](screenshots/01-infrastructure/07-dhcp-scope.png)

**DHCP Address Leases:**
![DHCP Leases](screenshots/01-infrastructure/08-dhcp-leases.png)

## 4. Client Domain Join & Verification
**Domain Join (Access work or school):**
![Domain Join](screenshots/01-infrastructure/10-domain-join.png)

**Client IP Configuration:**
![Client IPConfig](screenshots/01-infrastructure/13-ipconfig-client.png)

**DNS Resolution (nslookup):**
![NSLookup](screenshots/01-infrastructure/11-nslookup.png)

## 5. Group Policy Objects (GPO)
**Password Policy:**
![GPO Password](screenshots/01-infrastructure/14-gpo-password-policy.png)

**Account Lockout Policy:**
![GPO Lockout](screenshots/01-infrastructure/15-gpo-lockout-policy.png)

**Block Control Panel GPO Link:**
![GPO Link](screenshots/01-infrastructure/17-gpo-link.png)

**GPO Restriction Proof (Client):**
![GPO Proof](screenshots/01-infrastructure/18-gpo-restriction-proof.png)

## 6. File Share & NTFS Permissions
**Share Permissions (IT Admin):**
![Share Permissions](screenshots/01-infrastructure/19-share-permissions-itadmin.png)

**NTFS Permissions (Test Account):**
![NTFS Permissions](screenshots/01-infrastructure/20-ntfs-permissions-testaccount.png)
