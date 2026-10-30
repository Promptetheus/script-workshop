function normalize_string(input_str)
    -- Normalize case to lowercase
    local normalized_str = input_str:lower()
    
    -- Remove accents
    local normalized_str_no_accents = normalized_str:gsub("[\u0300-\u036f]", "")
    
    return normalized_str_no_accents
end

function main()
    print("Enter a string: ")
    local input_str = io.read("*l")
    
    -- Validate user input
    if not input_str then
        print("Error: Input is empty.")
        return
    end
    
    local normalized_str = normalize_string(input_str)
    print("Normalized string: ", normalized_str)
end

if __name__ == "__main__" then
    main()
end