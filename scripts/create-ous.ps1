# ============================================================
# Create Sub-OUs under Australia
# Author: Avishkar Sharma
# Purpose: Build department and object sub-OUs under Australia
# ============================================================

$domainDN = "DC=homedemo,DC=com"
$baseOU = "OU=Australia,$domainDN"

# Define what to create inside each existing Australia OU
$structure = [ordered]@{

    "OU=Users,$baseOU" = @("IT","Finance","Sales","Marketing")

    "OU=Computers,$baseOU" = @("Workstations","Laptops")

    "OU=Groups,$baseOU" = @("Security","Distribution")

    # Servers OU has no sub-OUs needed
}

$created = 0
$skipped = 0

Write-Host "`n=== Creating Sub-OUs under Australia ===" -ForegroundColor Cyan
Write-Host "Base OU: $baseOU`n"

foreach ($parent in $structure.Keys) {
    foreach ($child in $structure[$parent]) {
        $childPath = "OU=$child,$parent"

        if (Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$childPath'" -ErrorAction SilentlyContinue) {
            Write-Host "EXISTS:  $childPath" -ForegroundColor Yellow
            $skipped++
        } else {
            try {
                New-ADOrganizationalUnit -Name $child -Path $parent -ProtectedFromAccidentalDeletion $true
                Write-Host "CREATED: $childPath" -ForegroundColor Green
                $created++
            }
            catch {
                Write-Host "ERROR creating $childPath : $_" -ForegroundColor Red
            }
        }
    }
}

Write-Host "`n=== Summary ===" -ForegroundColor Cyan
Write-Host "Created: $created" -ForegroundColor Green
Write-Host "Skipped: $skipped" -ForegroundColor Yellow