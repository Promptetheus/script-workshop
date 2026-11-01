# Import required modules
Import-Module Az.Storage

# Define the function to monitor the bucket size
function bucket-size-monitor {
    param (
        [string]$BucketName,
        [string]$StorageAccountName,
        [string]$Threshold
    )

    # Get the storage account credentials
    $storageAccountKey = Get-AzStorageAccountKey -ResourceGroupName "Default-Storage" -StorageAccountName $StorageAccountName

    # Get the bucket size
    $bucketSize = Get-AzStorageBlob -Container $BucketName -AccountName $StorageAccountName -Key $storageAccountKey.Value[0]

    # Check if the bucket size is above the threshold
    if ($bucketSize.Length -gt $Threshold) {
        # Send an alert
        Write-Host "Bucket size is above the threshold: $($bucketSize.Length) bytes"
        # Add your alert sending logic here
    } else {
        Write-Host "Bucket size is below the threshold: $($bucketSize.Length) bytes"
    }
}

# Main function
if ($PSVersionTable.PSVersion.Major -ge 5) {
    # PowerShell 5 and later
    $BucketName = "mybucket"
    $StorageAccountName = "myaccount"
    $Threshold = 100
    bucket-size-monitor -BucketName $BucketName -StorageAccountName $StorageAccountName -Threshold $Threshold
} else {
    # PowerShell 4 and earlier
    & {
        $BucketName = "mybucket"
        $StorageAccountName = "myaccount"
        $Threshold = 100
        bucket-size-monitor -BucketName $BucketName -StorageAccountName $StorageAccountName -Threshold $Threshold
    } | Out-String | ConvertFrom-Json
}