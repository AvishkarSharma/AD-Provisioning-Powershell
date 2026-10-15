# ============================================================
# Create Groups for Australia
# Author: Avishkar Sharma
# Purpose: Create security and distribution groups from CSV
# ============================================================

param(
    [string]$CsvPath = "C:\Users\Administrator\Desktop\AD\australia-groups.csv"
)

$domainDN = "DC=homedemo,DC=com"
$location = "Australia"

if (-not (Test-Path $CsvPath)) {
    Write-Host "ERROR: CSV not found at $CsvPath" -ForegroundColor Red
    exit
}

$groups = Import-Csv -Path $CsvPath
$created = 0
$skipped = 0
$errors = 0

Write-Host "`n=== Creating Australia Groups ===" -ForegroundColor Cyan

foreach ($grp in $groups) {
    $ouPath = "OU=$($grp.GroupType),OU=Groups,OU=$location,$domainDN"

    if (Get-ADGroup -Filter "Name -eq '$($grp.GroupName)'" -ErrorAction SilentlyContinue) {
        Write-Host "SKIPPED: $($grp.GroupName) exists" -ForegroundColor Yellow
        $skipped++
        continue
    }

    try {
        New-ADGroup `
            -Name $grp.GroupName `
            -GroupScope $grp.Category `
            -GroupCategory $grp.GroupType `
            -Path $ouPath

        Write-Host "CREATED GROUP: $($grp.GroupName) in $ouPath" -ForegroundColor Green
        $created++
    }
    catch {
        Write-Host "ERROR creating $($grp.GroupName): $_" -ForegroundColor Red
        $errors++
    }
}

Write-Host "`n=== Summary ===" -ForegroundColor Cyan
Write-Host "Created: $created" -ForegroundColor Green
Write-Host "Skipped: $skipped" -ForegroundColor Yellow
Write-Host "Errors:  $errors" -ForegroundColor Red