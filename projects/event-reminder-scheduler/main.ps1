function Schedule-Reminder {
    param (
        [string]$EventDate,
        [string]$ReminderTime,
        [int]$WeekRange
    )

    # Validate input parameters
    if (!$EventDate) {
        Write-Error "Event date is required"
        return
    }

    if (!$ReminderTime) {
        Write-Error "Reminder time is required"
        return
    }

    if ($WeekRange -lt 1) {
        Write-Error "Week range must be a positive integer"
        return
    }

    # Parse input date and time
    $eventDate = Get-Date -Date $EventDate
    $reminderTime = Get-Date -Date $ReminderTime

    # Calculate the week range
    $startOfWeek = $eventDate.AddDays(-($eventDate.DayOfWeek - 1) * 7)
    $endOfWeek = $startOfWeek.AddDays(7)

    # Check if the event date is within the specified week range
    if ($startOfWeek -le $eventDate -and $eventDate -le $endOfWeek) {
        # Schedule the reminder notification
        Write-Host "Reminder scheduled for $eventDate at $ReminderTime"
    } else {
        Write-Host "Reminder not scheduled for $eventDate at $ReminderTime"
    }
}

# Example usage
Schedule-Reminder -EventDate "2024-03-15" -ReminderTime "08:00:00" -WeekRange 1