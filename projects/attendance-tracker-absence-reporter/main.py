import sys

def update_attendance_tracker(attendance_records, common_absences):
    """
    Updates the attendance tracker based on predefined common absences.

    Args:
        attendance_records (dict): A dictionary containing attendance records.
        common_absences (list): A list of predefined common absences.

    Returns:
        dict: The updated attendance tracker.
    """
    # Initialize the attendance tracker with all days marked as present
    attendance_tracker = {day: 'present' for day in attendance_records.keys()}

    # Iterate over each day in the attendance records
    for day, attendance in attendance_records.items():
        # Check if the attendance is absent
        if attendance.lower() in ['absent', 'no', 'not present']:
            # Update the attendance tracker to mark the day as absent
            attendance_tracker[day] = 'absent'

    # Iterate over each common absence
    for absence in common_absences:
        # Check if the absence is present in the attendance tracker
        if absence in attendance_tracker.values():
            # Update the attendance tracker to mark the day as absent
            for day, attendance in attendance_records.items():
                if attendance.lower() in ['absent', 'no', 'not present']:
                    attendance_tracker[day] = 'absent'

    return attendance_tracker


def main():
    # Check if the user has provided attendance records and common absences
    if len(sys.argv) != 3:
        print("Usage: python main.py <attendance_records> <common_absences>")
        sys.exit(1)

    # Load the attendance records and common absences from the command line arguments
    attendance_records = {}
    common_absences = []
    for arg in sys.argv[1:]:
        if arg.startswith('day='):
            day, attendance = arg.split('=')
            attendance_records[day] = attendance
        elif arg.startswith('absence='):
            absence = arg.split('=')[1]
            common_absences.append(absence)

    # Update the attendance tracker
    updated_tracker = update_attendance_tracker(attendance_records, common_absences)

    # Print the updated attendance tracker
    for day, attendance in updated_tracker.items():
        print(f"{day}: {attendance}")


if __name__ == "__main__":
    main()