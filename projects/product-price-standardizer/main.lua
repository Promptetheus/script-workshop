-- Function to standardize a product price within a target range
function standardize_price(price, min_price, max_price)
    -- Validate input prices
    if price < min_price or price > max_price then
        error("Price must be within the target range")
    end

    -- If the price is already within the range, return it as is
    if min_price <= price <= max_price then
        return price
    -- If the price is below the minimum, scale it up to the minimum
    elseif price < min_price then
        return min_price
    -- If the price is above the maximum, scale it down to the maximum
    elseif price > max_price then
        return max_price
    end
end

-- Example usage:
local price = 10.99
local min_price = 5.99
local max_price = 15.99

local standardized_price = standardize_price(price, min_price, max_price)
print("Standardized price:", standardized_price)