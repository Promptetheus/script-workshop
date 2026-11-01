function remove_duplicates_and_empty_bcc(email_message)
    -- Split the email message into lines
    local lines = {}
    for line in email_message:gmatch("%a+") do
        table.insert(lines, line)
    end

    -- Initialize variables to store the result and the set of Bcc addresses
    local result = {}
    local bcc_addresses = {}

    -- Iterate over the lines
    for _, line in ipairs(lines) do
        -- Check if the line is a Bcc address
        if line:match("^bcc:.*") then
            -- Extract the Bcc address
            local bcc_address = line:sub(4)
            -- Check if the Bcc address is not empty and not already in the set
            if bcc_address ~= "" and not bcc_addresses[bcc_address] then
                -- Add the Bcc address to the set
                bcc_addresses[bcc_address] = true
                -- Add the line to the result
                table.insert(result, line)
            end
        else
            -- Add the line to the result
            table.insert(result, line)
        end
    end

    -- Join the result lines back into a string
    local cleaned_email_message = table.concat(result, "\n")

    return cleaned_email_message
end

function main()
    -- Get the email message from the user
    local email_message = io.read("Enter the email message: ")

    -- Remove duplicates and empty Bcc addresses
    local cleaned_email_message = remove_duplicates_and_empty_bcc(email_message)

    -- Print the cleaned email message
    io.write("Cleaned email message:\n")
    io.write(cleaned_email_message .. "\n")
end

if __name__ == "__main__" then
    main()
end