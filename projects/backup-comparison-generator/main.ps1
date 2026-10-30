function Compare-BackupSets {
    param (
        [string]$BackupSet1Path,
        [string]$BackupSet2Path
    )

    # Validate user input
    if (!(Test-Path -Path $BackupSet1Path)) {
        Write-Error "Backup set 1 path is invalid"
        return
    }
    if (!(Test-Path -Path $BackupSet2Path)) {
        Write-Error "Backup set 2 path is invalid"
        return
    }

    # Read backup sets
    $backupSet1 = Get-Content -Path $BackupSet1Path -ErrorAction SilentlyContinue
    $backupSet2 = Get-Content -Path $BackupSet2Path -ErrorAction SilentlyContinue

    # Compare backup sets
    $differences = @()
    $backupSet1Lines = $backupSet1.Count
    $backupSet2Lines = $backupSet2.Count
    $numDifferences = [math]::Max($backupSet1Lines, $backupSet2Lines) - $backupSet1Lines - $backupSet2Lines

    for ($i = 0; $i -lt $numDifferences; $i++) {
        if ($backupSet1[$i] -ne $backupSet2[$i]) {
            $differences += "Line $((($i + 1) % 100)): Backup set 1 = $($backupSet1[$i]), Backup set 2 = $($backupSet2[$i])"
        }
    }

    # Generate report
    Write-Host "Backup Set 1: $($BackupSet1Path)"
    Write-Host "Backup Set 2: $($BackupSet2Path)"
    Write-Host "Number of differences: $numDifferences"
    Write-Host "Differences:"
    foreach ($difference in $differences) {
        Write-Host $difference
    }
}

# Entry guard
if ($PSVersionTable.PSVersion.Major -ge 5) {
    Compare-BackupSets -BackupSet1Path "C:\BackupSet1.txt" -BackupSet2Path "C:\BackupSet2.txt"
} else {
    Compare-BackupSets -BackupSet1Path "C:\BackupSet1.txt" -BackupSet2Path "C:\BackupSet2.txt"
}