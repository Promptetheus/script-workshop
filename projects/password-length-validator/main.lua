-- Function to check if a password meets the minimum length requirement
local function validatePassword(password, requiredLength)
    -- Check if the password is not empty and its length is greater than or equal to the required length
    return #password >= requiredLength and #password ~= 0
end

-- Function to check if a password contains at least one uppercase letter, one lowercase letter, and one digit
local function checkPasswordStrength(password)
    -- Check if the password contains at least one uppercase letter, one lowercase letter, and one digit
    local hasUppercase = false
    local hasLowercase = false
    local hasDigit = false

    for i = 1, #password do
        local char = password:sub(i, i)
        if char:match("%u") then
            hasUppercase = true
        elseif char:match("%l") then
            hasLowercase = true
        elseif char:match("%d") then
            hasDigit = true
        end
    end

    return hasUppercase and hasLowercase and hasDigit
end

-- Main function to validate the password
local function main()
    print("Password Length Validator")
    print("-------------------------")

    -- Get the password and required length from the user
    local password = io.read("Enter the password: ")
    local requiredLength = tonumber(io.read("Enter the required password length: "))

    -- Validate the password
    if validatePassword(password, requiredLength) then
        if checkPasswordStrength(password) then
            print("Password is strong enough.")
        else
            print("Password is not strong enough. It should contain at least one uppercase letter, one lowercase letter, and one digit.")
        end
    else
        print("Password is not strong enough. It should be at least", requiredLength, "characters long.")
    end
end

-- Entry guard
if __name__ == "__main__" then
    main()
end