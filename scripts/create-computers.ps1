# ============================================================
# Create Computer Objects for Australia
# Author: Avishkar Sharma
# Purpose: Create workstation and laptop objects from CSV
# ============================================================

param(
    [string]$CsvPath = "C:\Users\Administrator\Desktop\AD\australia-desktops.csv"
)

$domainDN = "DC=homedemo,DC=com"
$location = "Australia"

if (-not (Test-Path $CsvPath)) {
    Write-Host "ERROR: CSV not found at $CsvPath" -ForegroundColor Red
    exit
}

$computers = Import-Csv -Path $CsvPath
$created = 0
$skipped = 0
$errors = 0

Write-Host "`n=== Creating Australia Computer Objects ===" -ForegroundColor Cyan

foreach ($comp in $computers) {
    $ouPath = "OU=$($comp.Type),OU=Computers,OU=$location,$domainDN"

    if (Get-ADComputer -Filter "Name -eq '$($comp.ComputerName)'" -ErrorAction SilentlyContinue) {
        Write-Host "SKIPPED: $($comp.ComputerName) exists" -ForegroundColor Yellow
        $skipped++
        continue
    }

    try {
        New-ADComputer -Name $comp.ComputerName -Path $ouPath -Enabled $true
        Write-Host "CREATED COMPUTER: $($comp.ComputerName) in $ouPath" -ForegroundColor Green
        $created++
    }
    catch {
        Write-Host "ERROR creating $($comp.ComputerName): $_" -ForegroundColor Red
        $errors++
    }
}

Write-Host "`n=== Summary ===" -ForegroundColor Cyan
Write-Host "Created: $created" -ForegroundColor Green
Write-Host "Skipped: $skipped" -ForegroundColor Yellow
Write-Host "Errors:  $errors" -ForegroundColor Red