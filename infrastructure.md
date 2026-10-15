# Infrastructure & Home Lab Setup Proof

This document contains proof of the underlying Windows Server infrastructure configured for the `homedemo.com` domain prior to automation.

## 1. Server Roles & Initial AD Structure

**Server Manager Dashboard:**
*Proof of the core roles installed on the Domain Controller (AD DS, DNS, DHCP, and File and Storage Services) required to build a functional enterprise network.*

![Server Manager](screenshots/01%20Infrastructure/01-server-manager-roles.png)

**Initial Empty AD Structure:**
*The baseline Organizational Unit (OU) structure. This hierarchical design separates objects by region (Australia, Britain, USA) to allow for granular Group Policy application and administrative delegation.*

![AD Structure](screenshots/01%20Infrastructure/02-ou-structure.png)

**Users in OU:**
*Verification that user accounts have been properly placed within their respective departmental sub-OUs (e.g., Finance, IT) for logical organization.*

![Users in OU](screenshots/01%20Infrastructure/03-users-in-ou.png)

**Security Groups:**
*Creation of Security Groups to manage permissions centrally. Users are assigned to these groups rather than being granted permissions individually, adhering to the principle of least privilege.*

![Security Groups](screenshots/01%20Infrastructure/04-security-groups.png)

## 2. DNS Configuration

**Forward Lookup Zones:**
*Configuration of the primary DNS zone (`homedemo.com`). Active Directory relies entirely on DNS for domain controller location and service discovery; without this, domain joins would fail.*

![DNS Forward](screenshots/01%20Infrastructure/05-dns-forward-zone.png)

**Reverse Lookup Zones:**
*Configuration of the Reverse Lookup Zone (`192.168.2.x`). This allows the server to resolve IP addresses back to hostnames, which is critical for auditing and troubleshooting network traffic.*

![DNS Reverse](screenshots/01%20Infrastructure/06-dns-reverse-zone.png)

## 3. DHCP Configuration

**DHCP Scope:**
*Definition of the IP address pool (192.168.2.150 - 192.168.2.180) that will be automatically leased to client machines joining the network, reducing manual configuration errors.*

![DHCP Scope](screenshots/01%20Infrastructure/07-dhcp-scope.png)

**DHCP Address Leases:**
*Proof of the DHCP server actively assigning IP addresses to client machines. The leases table shows the hostname, IP, and lease duration for connected devices.*

![DHCP Leases](screenshots/01%20Infrastructure/08-dhcp-leases.png)

## 4. Client Configuration & Verification

**Client IP Configuration:**
*Verification that the client machine successfully received an IP address from the DHCP server. Note that the DNS server is pointing directly to the Domain Controller, allowing domain services to function.*

![Client IPConfig](screenshots/01%20Infrastructure/09-client-ipconfig.png)

**Domain Join (Access work or school):**
*Proof that the client machine `AD-IT-EMP001` has been successfully joined to the `homedemo.com` domain, allowing it to utilize centralized authentication and Group Policy.*

![Domain Join](screenshots/01%20Infrastructure/10-client-domain-join.png)

**DNS Resolution Verification (nslookup):**
*A successful `nslookup` query confirming the client can resolve the domain name to the Domain Controller's IP address (192.168.2.145). This validates both DNS and network connectivity.*
![DNS Verify](screenshots/01%20Infrastructure/11-client-dns-verify.png)

**Client Login Screen:**
*Proof of a successful domain user login on the client machine, confirming that authentication against Active Directory is working correctly.*
![Client Login](screenshots/01%20Infrastructure/12-client-login.png)

**Whoami Verification:**
*Running the `whoami` command confirms the current user context is `homedemo\test`, verifying that the domain account (not a local account) is active on the client.*

![Whoami](screenshots/01%20Infrastructure/13-client-whoami.png)

## 5. Group Policy Objects (GPO)

**Password Policy:**
*Configuration of a domain-wide Password Policy enforcing a minimum length of 12 characters and complexity requirements to strengthen security against brute-force attacks.*
![GPO Password](screenshots/01%20Infrastructure/14-gpo-password-policy.png)

**Account Lockout Policy:**
*Configuration of an Account Lockout Policy (5 invalid attempts) to automatically lock accounts during a suspected brute-force attack, preventing unauthorized access.*
![GPO Lockout](screenshots/01%20Infrastructure/15-gpo-lockout-policy.png)

**Block Control Panel GPO (Editor):**
*Configuration of a User Configuration GPO that restricts access to the Control Panel. This is a common administrative control used to prevent users from altering system settings on managed workstations.*

![GPO Block Control](screenshots/01%20Infrastructure/16-gpo-disable-controlpanel.png)

**GPO Link (SG-Finance-Australia):**
*Proof that the Block Control Panel GPO is linked specifically to the `SG-Finance-Australia` Security Group, demonstrating the ability to apply policies to specific departments rather than the entire domain.*
![GPO Link](screenshots/01%20Infrastructure/17-gpo-linked-to-sales.png)

**GPO Restriction Proof (Client):**
*Client-side verification. Attempting to open the Control Panel returns a "Restrictions" error, proving the GPO was successfully applied and is actively enforcing policy.*

![GPO Proof](screenshots/01%20Infrastructure/18-client-controlpanel-blocked.png)

## 6. File Share & NTFS Permissions

**Share Permissions (IT Admin):**
*Configuration of Share Permissions on the `C:\Data` folder. The `IT Admin` group is granted Full Control at the share level, which is the first layer of access control.*

![Share Permissions](screenshots/01%20Infrastructure/19-file-share-overview.png)

**NTFS Permissions (Test Account):**
*Configuration of NTFS (Security) Permissions on the same folder. The `Test Account` is granted specific Read/Write access. This demonstrates the two-layer permission model (Share + NTFS) used in Windows to secure file resources.*

![NTFS Permissions](screenshots/01%20Infrastructure/20-ntfs-permissions.png)
