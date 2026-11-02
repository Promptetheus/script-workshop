# Retrieves system hardware information and returns it in a JSON format.

function Get-HardwareInfo {
    # Retrieves system hardware information
    $hardwareInfo = @{
        "CPU" = (Get-WmiObject -Class Win32_Processor).Name
        "RAM" = (Get-WmiObject -Class Win32_PhysicalMemory).Capacity / 1GB
        "DiskSpace" = (Get-WmiObject -Class Win32_LogicalDisk).Size / 1GB
        "OS" = $env:OSVersion
    }

    # Returns the hardware information in a JSON format
    $hardwareInfo | ConvertTo-Json -Compress
}

# Example usage
if ($PSVersionTable.PSVersion.Major -ge 5) {
    $hardwareInfo = Get-HardwareInfo
    Write-Host "Hardware Information:"
    Write-Host $hardwareInfo
} else {
    Write-Host "This script requires PowerShell 5 or later."
}