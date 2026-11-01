-- Function to calculate the distance between two points
local function calculate_distance(point1, point2)
    return math.sqrt((point2.x - point1.x)^2 + (point2.y - point1.y)^2)
end

-- Function to calculate the most efficient order of deliveries
local function calculate_delivery_order(deliveries)
    local current_location = {x = 0, y = 0}
    local total_distance = 0
    local delivery_order = {}

    for _, delivery in ipairs(deliveries) do
        local distance = calculate_distance(current_location, delivery)
        total_distance = total_distance + distance
        table.insert(delivery_order, delivery)
        current_location = delivery
    end

    return total_distance, delivery_order
end

-- Function to calculate the traffic pattern
local function calculate_traffic_pattern(deliveries)
    local traffic_pattern = {}
    for _, delivery in ipairs(deliveries) do
        local traffic = math.random() * 100
        table.insert(traffic_pattern, traffic)
    end

    return traffic_pattern
end

-- Function to optimize the delivery route based on distance and traffic patterns
local function optimize_delivery_route(deliveries)
    local traffic_pattern = calculate_traffic_pattern(deliveries)
    local total_distance, delivery_order = calculate_delivery_order(deliveries)

    print("Optimized Delivery Route:")
    for _, delivery in ipairs(delivery_order) do
        print("Delivery at (" .. delivery.x .. ", " .. delivery.y .. ") with traffic pattern " .. traffic_pattern[table.find(deliveries, delivery)])
    end

    print("Total Distance: " .. total_distance)
end

-- Example usage
local deliveries = {
    {x = 1, y = 2},
    {x = 3, y = 4},
    {x = 5, y = 6},
    {x = 7, y = 8}
}

optimize_delivery_route(deliveries)