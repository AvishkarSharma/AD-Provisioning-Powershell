# Infrastructure & Home Lab Setup Proof

This document contains proof of the underlying Windows Server infrastructure configured for the `homedemo.com` domain prior to automation.

## 1. Server Roles & Initial AD Structure

**Server Manager Dashboard:**
*Proof of the four core roles installed on `AVI-DC-01`: AD DS, DHCP, DNS, and File and Storage Services. These are the foundational services required for the `homedemo.com` domain.*
![Server Manager](screenshots/01%20Infrastructure/01-server-manager-roles.png)

**Initial Empty AD Structure:**
*The baseline OU structure I designed. It separates objects by region (`Australia`, `Britain`, `USA`) with nested sub-OUs for `Computers`, `Groups`, `Servers`, and `Users` under each. This allows for granular Group Policy and delegation per region.*
![AD Structure](screenshots/01%20Infrastructure/02-ou-structure.png)

**Users in OU:**
*Verification of users placed in the `Australia > Users` OU, including `Bob Builder`, `Finance User`, and `James Bond`. This confirms logical placement before automation was applied.*
![Users in OU](screenshots/01%20Infrastructure/03-users-in-ou.png)

**Security Groups:**
*Creation of Security Groups inside `Australia > Groups`, specifically `SG-Finance-Australia`, `SG-IT-Australia`, and `SG-Operations-Australia`. These are used to assign permissions centrally rather than per-user.*
![Security Groups](screenshots/01%20Infrastructure/04-security-groups.png)

## 2. DNS Configuration

**Forward Lookup Zones:**
*Configuration of the Forward Lookup Zone for `homedemo.com` on `AVI-DC-01`. The zone contains the A records for `AD-IT-EMP001` (192.168.2.152) and `avi-dc-01` (192.168.2.145), which are required for domain controller location.*
![DNS Forward](screenshots/01%20Infrastructure/05-dns-forward-zone.png)

**Reverse Lookup Zones:**
*Configuration of the Reverse Lookup Zone `2.168.192.in-addr.arpa`. This contains the PTR records mapping `192.168.2.145` back to `avi-dc-01.homedemo.com` and `192.168.2.152` back to `AD-IT-EMP001.homedemo.com`, enabling IP-to-hostname resolution.*
![DNS Reverse](screenshots/01%20Infrastructure/06-dns-reverse-zone.png)

## 3. DHCP Configuration

**DHCP Scope:**
*Definition of the DHCP scope `[192.168.2.0] DHCP Lab` on `AVI-DC-01.homedemo.com`. I configured the address pool to distribute IPs from `192.168.2.150` to `192.168.2.180`.*
![DHCP Scope](screenshots/01%20Infrastructure/07-dhcp-scope.png)

**DHCP Address Leases:**
*Active leases confirming the DHCP server successfully assigned addresses from my configured pool (`192.168.2.150` to `192.168.2.180`). The VM `Avishkar.homedemo.com` received `192.168.2.150` and `W993VKCWGP.homedemo.com` received `192.168.2.151`.*
![DHCP Leases](screenshots/01%20Infrastructure/08-dhcp-leases.png)

## 4. Client Configuration & Verification

**Client IP Configuration:**
*Verification on client `AD-IT-EMP001` that it received `192.168.2.152` via DHCP. The Default Gateway is `192.168.2.1` and the DHCP Server and DNS Server both point to `192.168.2.145` (AVI-DC-01), confirming correct domain integration.*
![Client IPConfig](screenshots/01%20Infrastructure/09-client-ipconfig.png)

**Domain Join (Access work or school):**
*Proof that `AD-IT-EMP001` is connected to the `HOMEDEMO AD domain` via the Windows "Access work or school" settings.*
![Domain Join](screenshots/01%20Infrastructure/10-client-domain-join.png)

**DNS Resolution Verification (nslookup):**
*A successful `nslookup homedemo.com` query from `AD-IT-EMP001` returning `192.168.2.145` as the address, proving DNS resolution against `AVI-DC-01` is working.*
![DNS Verify](screenshots/01%20Infrastructure/11-client-dns-verify.png)

**Client Login Screen:**
*Proof of a successful domain user login on `AD-IT-EMP001` using the `Test Account` (`test@homedemo.com`), confirming Active Directory authentication is functional.*
![Client Login](screenshots/01%20Infrastructure/12-client-login.png)

**Whoami Verification:**
*Running `whoami` from `C:\Users\test` returns `homedemo\test`, proving the active session is using the domain account and not a local account. The `ipconfig /all` output confirms DNS suffix `homedemo.com` and DNS server `192.168.2.145`.*
![Whoami](screenshots/01%20Infrastructure/13-client-whoami.png)

## 5. Group Policy Objects (GPO)

**Password Policy:**
*Configuration of the `GPO-Password-Policy` linked to `homedemo.com`. Enforces 24 password history, 60-day max age, 1-day min age, 12-character minimum length, and complexity requirements.*
![GPO Password](screenshots/01%20Infrastructure/14-gpo-password-policy.png)

**Account Lockout Policy:**
*Configuration of the Account Lockout Policy within the same GPO. Locks accounts for 15 minutes after 5 invalid logon attempts, with a 15-minute reset counter.*
![GPO Lockout](screenshots/01%20Infrastructure/15-gpo-lockout-policy.png)

**Block Control Panel GPO (Editor):**
*Configuration of the `Block Control Panel` GPO under User Configuration > Policies > Administrative Templates > Control Panel. The "Prohibit access to Control Panel and PC settings" setting is Enabled.*
![GPO Block Control](screenshots/01%20Infrastructure/16-gpo-disable-controlpanel.png)

**GPO Link (SG-Finance-Australia):**
*Proof that the `Block Control Panel` GPO is linked specifically to the `SG-Finance-Australia` OU. This ensures only Finance users in Australia are affected, not the entire domain.*
![GPO Link](screenshots/01%20Infrastructure/17-gpo-linked-to-sales.png)

**GPO Restriction Proof (Client):**
*Client-side proof on `AD-IT-EMP001`. Attempting to open the Control Panel returns "This operation has been cancelled due to restrictions in effect on this computer", confirming the GPO is enforcing policy successfully.*
![GPO Proof](screenshots/01%20Infrastructure/18-client-controlpanel-blocked.png)

## 6. File Share & NTFS Permissions

**Share Permissions (IT Admin):**
*Configuration of Share Permissions on `C:\Data`. The `IT Admin` group (`IT_Admin@homedemo.com`) is granted Full Control, Change, and Read at the share level.*
![Share Permissions](screenshots/01%20Infrastructure/19-file-share-overview.png)

**NTFS Permissions (Test Account):**
*Configuration of NTFS Security Permissions on `C:\Data`. The `Test Account` (`test@homedemo.com`) is granted Full Control, Modify, Read & Execute, List folder contents, Read, and Write. This demonstrates the two-layer permission model (Share + NTFS).*
![NTFS Permissions](screenshots/01%20Infrastructure/20-ntfs-permissions.png)
