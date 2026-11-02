#!/bin/bash


validate_language_code() {
    local code=$1
    local length=${#code}

    # Check if the code length is 2
    if [ $length -ne 2 ]; then
        echo "false"
        return
    fi

    # Check if the code is in uppercase
    if [ "${code^^}" != "$code" ]; then
        echo "false"
        return
    fi

    # Check if the code is a valid ISO 639-1 code
    local valid_codes=$(curl -s https://www.loc.gov/standards/iso639-2/php/iso639-2.php)
    if ! grep -q "$code" <<< "$valid_codes"; then
        echo "false"
        return
    fi

    # Check if the code is within the valid range
    local min_code="a"
    local max_code="z"
    if [ "${code:0:1}" < "$min_code" ] || [ "${code:0:1}" > "$max_code" ]; then
        echo "false"
        return
    fi

    # If all checks pass, the code is valid
    echo "true"
}

# Example usage:
code=$1
validate_language_code "$code"