-- Function to convert kilometers to miles
function km_to_miles(km)
    return km * 0.621371
end

-- Function to convert miles to kilometers
function miles_to_km(miles)
    return miles * 1.60934
end

-- Function to convert degrees to radians
function deg_to_rad(deg)
    return deg * math.pi / 180
end

-- Function to convert radians to degrees
function rad_to_deg(rad)
    return rad * 180 / math.pi
end

-- Function to convert between units
function convert_units(value, from_unit, to_unit)
    if from_unit == "km" and to_unit == "miles" then
        return km_to_miles(value)
    elseif from_unit == "miles" and to_unit == "km" then
        return miles_to_km(value)
    elseif from_unit == "deg" and to_unit == "rad" then
        return deg_to_rad(value)
    elseif from_unit == "rad" and to_unit == "deg" then
        return rad_to_deg(value)
    else
        error("Invalid unit conversion")
    end
end

-- Function to get user input
function get_user_input()
    print("Enter a value:")
    local input = io.read("*l")
    return tonumber(input)
end

-- Function to display result
function display_result(value, from_unit, to_unit)
    print(to_unit .. " is equal to " .. value .. " " .. from_unit)
end

-- Main function
function main()
    print("Unit Converter")
    print("-------------")
    print("1. Kilometers to Miles")
    print("2. Miles to Kilometers")
    print("3. Degrees to Radians")
    print("4. Radians to Degrees")
    print("5. Quit")
    
    while true do
        print("\nChoose an option:")
        local option = io.read("*l")
        
        if option == "1" then
            local value = get_user_input()
            local from_unit = "km"
            local to_unit = "miles"
            display_result(value, from_unit, to_unit)
        elseif option == "2" then
            local value = get_user_input()
            local from_unit = "miles"
            local to_unit = "km"
            display_result(value, from_unit, to_unit)
        elseif option == "3" then
            local value = get_user_input()
            local from_unit = "deg"
            local to_unit = "rad"
            display_result(value, from_unit, to_unit)
        elseif option == "4" then
            local value = get_user_input()
            local from_unit = "rad"
            local to_unit = "deg"
            display_result(value, from_unit, to_unit)
        elseif option == "5" then
            break
        else
            print("Invalid option. Please choose a valid option.")
        end
    end
end

-- Entry guard
if __name__ == "__main__" then
    main()
end