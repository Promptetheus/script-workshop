-- Function to generate notes to help tune an instrument
function generate_tuning_notes(reference_pitch)
    -- Define the notes in the chromatic scale
    local notes = {
        "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"
    }

    -- Calculate the interval between the reference pitch and each note
    local tuning_notes = {}
    for i, note in ipairs(notes) do
        local interval = math.floor((i - 12) % 12)
        table.insert(tuning_notes, interval)
    end

    -- Generate a series of notes to help tune the instrument
    local tuning_intervals = {}
    for i = 0, 10 do
        table.insert(tuning_intervals, (i * 2) % 12)
    end

    -- Combine the reference pitch and tuning intervals
    local tuning_notes_table = {}
    for i, interval in ipairs(tuning_intervals) do
        table.insert(tuning_notes_table, reference_pitch + interval)
    end

    return tuning_notes_table
end

-- Function to get user input for notes they hear
function get_user_input()
    print("Please enter the notes you hear (e.g. C, C#, D, etc.):")
    local user_input = io.read("*l")
    local notes = {}
    for word in user_input:gmatch("%w+") do
        table.insert(notes, word)
    end

    return notes
end

-- Function to calculate the distance between two pitches
function calculate_distance(reference_pitch, user_pitch)
    local reference_index = #notes:find(reference_pitch)
    local user_index = #notes:find(user_pitch)
    local distance = math.abs(reference_index - user_index)
    return distance
end

-- Main function
function main()
    -- Get user input for the reference pitch
    print("Please enter the reference pitch (e.g. C, C#, D, etc.):")
    local reference_pitch = io.read("*l")

    -- Generate a series of notes to help tune the instrument
    local tuning_notes = generate_tuning_notes(reference_pitch)

    -- Get user input for the notes they hear
    local user_notes = get_user_input()

    -- Calculate the distance between each user input and the reference pitch
    local feedback = {}
    for i, note in ipairs(user_notes) do
        local distance = calculate_distance(reference_pitch, note)
        table.insert(feedback, "Note " .. i .. ": " .. note .. " is " .. distance .. " semitones away from the reference pitch.")
    end

    -- Print the feedback to the user
    for i, feedback_message in ipairs(feedback) do
        print(feedback_message)
    end
end

-- Run the main function
main()