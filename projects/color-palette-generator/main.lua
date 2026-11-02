-- Function to generate a color palette
function generateColorPalette(inputColor)
    -- Default colors
    local primaryColor = inputColor
    local secondaryColor = {1, 0, 0, 1} -- Red
    local backgroundColor = {0.2, 0.2, 0.2, 1} -- Dark Gray

    -- Function to calculate the gradient between two colors
    function calculateGradient(color1, color2)
        local r = (color1[1] + color2[1]) / 2
        local g = (color1[2] + color2[2]) / 2
        local b = (color1[3] + color2[3]) / 2
        return {r, g, b, 1}
    end

    -- Calculate the secondary color
    local secondaryColor = calculateGradient(inputColor, secondaryColor)

    -- Return the color palette
    return {
        primary = primaryColor,
        secondary = secondaryColor,
        background = backgroundColor
    }
end

-- Function to print the color palette
function printColorPalette(colorPalette)
    print("Primary Color: ")
    for i = 1, #colorPalette.primary do
        print(string.format("#%02x%02x%02x", colorPalette.primary[i]))
    end

    print("\nSecondary Color: ")
    for i = 1, #colorPalette.secondary do
        print(string.format("#%02x%02x%02x", colorPalette.secondary[i]))
    end

    print("\nBackground Color: ")
    for i = 1, #colorPalette.background do
        print(string.format("#%02x%02x%02x", colorPalette.background[i]))
    end
end

-- Main function
function main()
    -- Get the input color from the user
    local inputColor = {}
    for i = 1, 3 do
        inputColor[i] = tonumber(fread(1, 2)) - 48
    end

    -- Generate the color palette
    local colorPalette = generateColorPalette(inputColor)

    -- Print the color palette
    printColorPalette(colorPalette)
end

-- Entry guard
if __name__ == "__main__" then
    main()
end