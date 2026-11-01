# Import required modules
Import-Module -Name System.Windows.Forms
Import-Module -Name System.Diagnostics

# Function to analyze speed test history
function Analyze-Speed-Test-History {
    param (
        [string]$SpeedTestHistoryFile,
        [string]$OutputFile
    )

    # Read speed test history from file
    $speedTestHistory = Get-Content -Path $SpeedTestHistoryFile -ErrorAction SilentlyContinue

    # Calculate average download and upload speeds
    $downloadSpeeds = @()
    $uploadSpeeds = @()
    foreach ($speedTest in $speedTestHistory) {
        $speedTestParts = $speedTest.Split(',')
        $downloadSpeed = [int]$speedTestParts[0]
        $uploadSpeed = [int]$speedTestParts[1]
        $downloadSpeeds += $downloadSpeed
        $uploadSpeeds += $uploadSpeed
    }
    $averageDownloadSpeed = ($downloadSpeeds -sum) / $downloadSpeeds.Count
    $averageUploadSpeed = ($uploadSpeeds -sum) / $uploadSpeeds.Count

    # Save average speeds to output file
    $averageSpeeds = [PSCustomObject]@{
        DownloadSpeed = $averageDownloadSpeed
        UploadSpeed = $averageUploadSpeed
    }
    $averageSpeeds | Export-CSV -Path $OutputFile -NoTypeInformation
}

# Main function
function Main {
    [string]$SpeedTestHistoryFile = "speed_test_history.txt"
    [string]$OutputFile = "average_speeds.csv"

    # Display speed test history file selection dialog
    $speedTestHistoryFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $speedTestHistoryFileDialog.Filter = "Text files (*.txt)|*.txt"
    $speedTestHistoryFileDialog.Title = "Select Speed Test History File"
    $speedTestHistoryFileDialog.ShowDialog() | Out-Null
    if ($speedTestHistoryFileDialog.FileName -ne $null) {
        $speedTestHistoryFile = $speedTestHistoryFileDialog.FileName
    }

    # Display output file selection dialog
    $outputFileDialog = New-Object System.Windows.Forms.SaveFileDialog
    $outputFileDialog.Filter = "CSV files (*.csv)|*.csv"
    $outputFileDialog.Title = "Select Output File"
    $outputFileDialog.ShowDialog() | Out-Null
    if ($outputFileDialog.FileName -ne $null) {
        $outputFile = $outputFileDialog.FileName
    }

    # Analyze speed test history and display results
    if ($speedTestHistoryFile -ne $null -and $outputFile -ne $null) {
        Analyze-Speed-Test-History -SpeedTestHistoryFile $speedTestHistoryFile -OutputFile $outputFile
        Show-MessageBox -Title "Speed Test History Analysis" -Content "Average download and upload speeds have been calculated and saved to the output file." -Icon [System.Windows.Forms.MessageBoxIcon]::Information
    }
    else {
        Show-MessageBox -Title "Error" -Content "Please select both speed test history file and output file." -Icon [System.Windows.Forms.MessageBoxIcon]::Error
    }
}

# Entry guard
if ($PSVersionTable.PSVersion.Major -ge 5) {
    Main
}
else {
    # PowerShell 4 or earlier
    # Use the following code instead
    # Analyze-Speed-Test-History -SpeedTestHistoryFile "speed_test_history.txt" -OutputFile "average_speeds.csv"
    # Main
}