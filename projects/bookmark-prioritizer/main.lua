-- Function to calculate priority score for a bookmark
local function calculatePriorityScore(bookmark)
    local priorityScore = 0
    priorityScore = priorityScore + bookmark.frequency
    priorityScore = priorityScore + -bookmark.lastVisitedDate
    for _, tag in ipairs(bookmark.tags) do
        priorityScore = priorityScore + tag.priority
    end
    return priorityScore
end

-- Function to read bookmark data from a file
local function readBookmarkData(filePath)
    local bookmarks = {}
    local file = io.open(filePath, "r")
    if file then
        local lines = file:read("*l")
        while lines do
            local line = lines:match("^([^#]+)%s*=%s*(.-)%s*$")
            if line then
                local name = line:match("^([^#]+)%s*=")
                local frequency = tonumber(line:match("^([^#]+)%s*=(.-)%s*$"))
                local lastVisitedDate = tonumber(line:match("^([^#]+)%s*=(.-)%s*$"))
                local tags = {}
                local tagLine = ""
                while tagLine:match("^#%s*([^#]+)%s*$") do
                    table.insert(tags, tonumber(tagLine:match("^#%s*(.-)%s*$")))
                    tagLine = ""
                end
                table.insert(bookmarks, {name = name, frequency = frequency, lastVisitedDate = lastVisitedDate, tags = tags})
            end
            lines = file:read("*l")
        end
        file:close()
    end
    return bookmarks
end

-- Function to get top 5 most visited bookmarks
local function getTop5MostVisitedBookmarks(bookmarks)
    table.sort(bookmarks, function(a, b) return calculatePriorityScore(a) > calculatePriorityScore(b) end)
    local top5Bookmarks = {}
    for i = 1, math.min(5, #bookmarks) do
        table.insert(top5Bookmarks, bookmarks[i])
    end
    return top5Bookmarks
end

-- Main function
local function main()
    local filePath = "bookmarks.txt"
    local bookmarks = readBookmarkData(filePath)
    local top5Bookmarks = getTop5MostVisitedBookmarks(bookmarks)
    for i, bookmark in ipairs(top5Bookmarks) do
        print("Rank " .. i .. ": " .. bookmark.name)
    end
end

-- Entry guard
if __name__ == "__main__" then
    main()
end