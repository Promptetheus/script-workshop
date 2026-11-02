# Define the predefined configuration parameters
$configParams = @{
    DatabaseServer = 'localhost'
    DatabaseName   = 'mydatabase'
    Username       = 'myuser'
    Password       = 'mypassword'
}

# Function to validate configuration settings
function Validate-Config {
    param (
        [string]$ConfigFile,
        [string]$ExpectedParams
    )

    # Read the configuration file
    $config = Get-Content -Path $ConfigFile -Raw

    # Parse the configuration file
    $configDict = ConvertFrom-Json -InputObject $config

    # Compare the configuration settings to the predefined parameters
    foreach ($param in $configDict) {
        if ($param.Key -notin $ExpectedParams.Keys) {
            Write-Host "Warning: Configuration parameter '$param.Key' is missing."
        } elseif ($param.Value -ne $ExpectedParams[$param.Key]) {
            Write-Host "Error: Configuration parameter '$param.Key' has an unexpected value '$param.Value'. Expected '$ExpectedParams[$param.Key}'."
        }
    }

    # Check for any additional configuration parameters
    foreach ($param in $configDict) {
        if ($param.Key -notin $ExpectedParams.Keys) {
            Write-Host "Warning: Configuration parameter '$param.Key' is present but not expected."
        }
    }
}

# Main function
function Main {
    param (
        [string]$ConfigFile,
        [string]$ExpectedParams
    )

    Validate-Config -ConfigFile $ConfigFile -ExpectedParams $ExpectedParams
}

# Entry point
if ($PSVersionTable.PSVersion.Major -ge 5) {
    # PowerShell 5 and later
    Main -ConfigFile 'config.json' -ExpectedParams @{'DatabaseServer'='localhost'; 'DatabaseName'='mydatabase'}
} else {
    # PowerShell 4 and earlier
    & '.\main.ps1' -ConfigFile 'config.json' -ExpectedParams @{'DatabaseServer'='localhost'; 'DatabaseName'='mydatabase'}
}