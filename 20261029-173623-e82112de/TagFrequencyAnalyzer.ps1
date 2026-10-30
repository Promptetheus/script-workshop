function Get-TagFrequency {
    param (
        [string[]]$Tags,
        [string]$Text
    )

    if (!$Tags) {
        throw "Tags cannot be empty"
    }

    if (!$Text) {
        throw "Text cannot be empty"
    }

    $tagFrequency = @{}
    foreach ($tag in $Tags) {
        $tagFrequency[$tag] = 0
    }

    $words = $Text.Split(' ')
    foreach ($word in $words) {
        $word = $word.ToLower()
        foreach ($tag in $Tags) {
            if ($word -match $tag) {
                $tagFrequency[$tag]++
            }
        }
    }

    return $tagFrequency
}

function Main {
    param (
        [string[]]$Tags,
        [string]$Text
    )

    $tagFrequency = Get-TagFrequency -Tags $Tags -Text $Text

    $maxFrequency = 0
    $mostFrequentTag = ""

    foreach ($tag in $tagFrequency) {
        if ($tag.Value -gt $maxFrequency) {
            $maxFrequency = $tag.Value
            $mostFrequentTag = $tag.Key
        }
    }

    Write-Host "The most frequent tag is: $mostFrequentTag"
    Write-Host "The frequency of the most frequent tag is: $maxFrequency"
}

if ($PSVersionTable.PSVersion.Major -ge 5) {
    Main -Tags @() -Text "This is a test"
} else {
    &. (Get-Command Main).Definition
}