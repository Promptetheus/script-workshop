-- Validate user input
function validateInput(input)
    if type(input) ~= "string" then
        error("Input must be a string")
    end
    return input
end

-- Get user input
print("Please enter a string:")
local input = io.read("*l")

-- Validate and display input
local validatedInput = validateInput(input)
print("You entered:", validatedInput)