# Troubleshooting Log

This document records issues encountered during the build of the Active Directory 
home lab, along with the investigation, root cause, resolution, and lessons learned.

---

## Issue 1: Client Could Not Join Domain — DNS Misconfiguration

**Symptom:**
Windows 11 client failed to join `homedemo.com` with the error 
"An AD DC for the domain could not be contacted."

**Investigation:**
Ran `ipconfig /all` on the client and found the DNS server was set to 
`192.168.2.1` (home router) instead of `192.168.2.145` (Domain Controller).

**Root Cause:**
The client received DNS settings from the home router via DHCP instead of 
from the DC. Active Directory relies on SRV records that only exist on the 
DC, so domain join fails when the client cannot query the DC for DNS.

**Resolution:**
Verified the DHCP scope on the DC was configured to hand out `192.168.2.145` 
as the DNS server. Ran `ipconfig /release` and `ipconfig /renew` on the client. 
Confirmed with `nslookup homedemo.com` that queries were now resolving through 
the DC.

**Lesson Learned:**
In any domain environment, the DC must be the DNS server for all 
domain-joined machines. The router should never provide DNS for domain clients.

---

## Issue 2: GPO Not Applying — Linked to Security Group Instead of OU

**Symptom:**
The Control Panel restriction GPO was created and linked, but the test user 
could still open Control Panel.

**Investigation:**
Ran `gpresult /r` on the client. The GPO was not listed under "Applied Group 
Policy Objects." Checked the GPO's link and found it was attached to a 
security group object instead of the user's OU.

**Root Cause:**
GPOs apply to containers (domains, sites, and OUs). They do not apply to 
individual security group objects. Linking a GPO to a security group does 
not apply it to that group's members.

**Resolution:**
Removed the link from the security group. Re-linked the GPO to the correct OU 
(`Australia → Users → Sales`). Ran `gpupdate /force` on the client and verified 
with `gpresult /r` that the GPO now appeared under Applied GPOs.

**Lesson Learned:**
Always verify GPO scope via the Scope tab in Group Policy Management before 
assuming it's linked correctly. GPOs must target OUs, not group objects.

---

## Issue 3: Duplicate GPO in gpresult Output

**Symptom:**
After linking the Control Panel GPO, `gpresult /r` listed "Block Control Panel" 
twice under Applied Group Policy Objects.

**Investigation:**
Opened Group Policy Management and checked the Scope tab of the GPO. Found the 
GPO was linked to two different containers simultaneously.

**Root Cause:**
The GPO was linked to both the domain root and the target OU. Both links were 
processed independently, resulting in duplicate application.

**Resolution:**
Removed the link from the domain root, keeping only the link on the target OU. 
Ran `gpupdate /force` on the client and confirmed the duplicate no longer 
appeared in `gpresult /r`.

**Lesson Learned:**
A GPO can be linked to multiple containers, but each link is processed 
separately. Duplicate links cause duplicate processing and confusing output.

---

## Issue 4: DHCP Conflict — Client Receiving IP from Home Router

**Symptom:**
Client received an IP address from the home router (`192.168.2.x`) instead of 
from the DC's DHCP scope.

**Investigation:**
Ran `ipconfig /all` on the client. The DHCP server field showed `192.168.2.1` 
(home router) instead of `192.168.2.145` (DC).

**Root Cause:**
Both the home router and the DC were offering DHCP on the same subnet. The 
client accepted the router's offer first because the router responded faster.

**Resolution:**
Verified the DC's DHCP scope was authorized in AD and the scope was active. 
Ran `ipconfig /release` and `ipconfig /renew` on the client. The DC's response 
won the next DHCP negotiation. Confirmed with `ipconfig /all` that the DHCP 
server field now showed the DC.

**Lesson Learned:**
Running a DHCP server alongside a home router can cause conflicts. In a lab 
environment, this can be managed by disabling DHCP on the router or using an 
isolated lab network. In production, only one DHCP server should be 
authoritative per subnet.

---

## Issue 5: Reverse Lookup Zone Warning (Event ID 4013)

**Symptom:**
DNS Event Viewer showed repeated Warning events with ID 4013 on the DC.

**Investigation:**
Reviewed the event details. Event ID 4013 indicates the DNS server is waiting 
for Active Directory Domain Services to finish initial synchronization.

**Root Cause:**
This is a normal warning on a newly promoted Domain Controller. It occurs 
while AD DS completes its initial replication and the DNS service integrates 
with the AD database.

**Resolution:**
No action required. The warnings cleared after AD replication completed and 
the DNS service fully integrated. Verified by checking that forward and 
reverse lookup zones were both populated and resolving correctly.

**Lesson Learned:**
Not all warnings require action. Understanding what a warning means prevents 
unnecessary changes to a working system.
