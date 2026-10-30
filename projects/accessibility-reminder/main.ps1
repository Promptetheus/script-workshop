# Display one reminder after a configurable delay.
[CmdletBinding()]
param(
    [ValidateRange(0, 1440)]
    [double]$IntervalMinutes = 1,
    [ValidateNotNullOrEmpty()]
    [string]$Message = "Please close all tabs and switch to a new app."
)

$milliseconds = [int][Math]::Round($IntervalMinutes * 60000)
if ($milliseconds -gt 0) {
    Start-Sleep -Milliseconds $milliseconds
}
Write-Output $Message
