# Define a function to display the main menu
function Show-Menu {
    Write-Host "Model Launcher"
    Write-Host "------------"
    Write-Host "1. Select Model Version"
    Write-Host "2. View Version History"
    Write-Host "3. Save Model Configuration"
    Write-Host "4. Load Model Configuration"
    Write-Host "5. Exit"

    $choice = Read-Host "Enter your choice: "

    switch ($choice) {
        "1" { Select-ModelVersion }
        "2" { View-VersionHistory }
        "3" { Save-ModelConfiguration }
        "4" { Load-ModelConfiguration }
        "5" { Exit }
        default { Write-Host "Invalid choice. Please try again." }
    }
}

# Define a function to select the model version
function Select-ModelVersion {
    Write-Host "Select a model version:"
    $versions = Get-ChildItem -Path "C:\ModelVersions"
    $version = $versions | Select-Object -First 1

    if ($version) {
        Write-Host "Selected version: $version"
    } else {
        Write-Host "No model versions found."
    }
}

# Define a function to view the version history
function View-VersionHistory {
    Write-Host "Version History:"
    $versions = Get-ChildItem -Path "C:\ModelVersions"
    $versionHistory = @()

    foreach ($v in $versions) {
        $versionHistory += [PSCustomObject]@{
            Version = $v.Name
            Changes = (Get-Content -Path "$v\changes.txt")
        }
    }

    $versionHistory | Format-Table -Property Version, Changes
}

# Define a function to save the model configuration
function Save-ModelConfiguration {
    Write-Host "Save Model Configuration:"
    $version = Read-Host "Enter the version number: "
    $config = Read-Host "Enter the model configuration: "

    $file = Join-Path -Path "C:\ModelVersions" -ChildPath "$version.config"
    Set-Content -Path $file -Value $config
}

# Define a function to load the model configuration
function Load-ModelConfiguration {
    Write-Host "Load Model Configuration:"
    $version = Read-Host "Enter the version number: "

    if (Test-Path -Path "C:\ModelVersions\$version.config") {
        $config = Get-Content -Path "C:\ModelVersions\$version.config"
        Write-Host "Loaded configuration: $config"
    } else {
        Write-Host "No configuration found for version $version."
    }
}

# Main loop
while (1) {
    Show-Menu
}