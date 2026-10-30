function Generate-Citation {
    param (
        [string]$Author,
        [string]$SourceUrl
    )

    if (!$Author) {
        throw "Author is required"
    }

    if (!$SourceUrl) {
        throw "Source URL is required"
    }

    $citation = "Author. $SourceUrl"
    return $citation
}

function Generate-MLACitation {
    param (
        [string]$Author,
        [string]$SourceUrl
    )

    if (!$Author) {
        throw "Author is required"
    }

    if (!$SourceUrl) {
        throw "Source URL is required"
    }

    $citation = "$Author. $SourceUrl. Accessed $SourceUrl"
    return $citation
}

function Generate-MLACitationWithDate {
    param (
        [string]$Author,
        [string]$SourceUrl,
        [string]$PublicationDate
    )

    if (!$Author) {
        throw "Author is required"
    }

    if (!$SourceUrl) {
        throw "Source URL is required"
    }

    if (!$PublicationDate) {
        throw "Publication date is required"
    }

    $citation = "$Author. $SourceUrl. Accessed $SourceUrl. Published $PublicationDate."
    return $citation
}

function Main {
    param (
        [string]$Author,
        [string]$SourceUrl
    )

    Write-Host "Enter publication date (yyyy-mm-dd) if available"
    $publicationDate = Read-Host

    $citation = Generate-MLACitationWithDate -Author $Author -SourceUrl $SourceUrl -PublicationDate $publicationDate
    Write-Host "Generated Citation:"
    Write-Host $citation
}

if ($PSVersionTable.PSVersion.Major -ge 5) {
    Main -Author Read-Host -SourceUrl Read-Host
} else {
    Main -Author Read-Host -SourceUrl Read-Host
}