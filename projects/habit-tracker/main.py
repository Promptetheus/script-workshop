class HabitTracker:
    """
    A class to track habits related to your goals.

    Attributes:
        habit_name (str): The name of the habit.
        target_days (int): The target number of days to complete the habit.
        completed_days (int): The number of days you've completed the habit.
        total_days (int): The total number of days in the target period.
    """

    def __init__(self, habit_name, target_days):
        """
        Initializes the HabitTracker class.

        Args:
            habit_name (str): The name of the habit.
            target_days (int): The target number of days to complete the habit.
        """
        self.habit_name = habit_name
        self.target_days = target_days
        self.completed_days = 0
        self.total_days = 0

    def track_habit(self):
        """
        Tracks the habit and updates the completed days and total days.

        Returns:
            tuple: A tuple containing the number of days completed and the total number of days.
        """
        self.completed_days += 1
        self.total_days += 1
        return self.completed_days, self.total_days

    def reset(self):
        """
        Resets the completed days and total days.
        """
        self.completed_days = 0
        self.total_days = 0


def main():
    """
    The main function to test the HabitTracker class.
    """
    habit_name = input("Enter the habit name: ")
    target_days = int(input("Enter the target number of days: "))

    tracker = HabitTracker(habit_name, target_days)

    while True:
        print("\n1. Track Habit")
        print("2. Reset Habit")
        print("3. Quit")
        choice = input("Enter your choice: ")

        if choice == "1":
            completed_days, total_days = tracker.track_habit()
            print(f"You have completed {completed_days} out of {total_days} days of {habit_name}.")
        elif choice == "2":
            tracker.reset()
            print(f"{habit_name} has been reset.")
        elif choice == "3":
            break
        else:
            print("Invalid choice. Please try again.")


if __name__ == "__main__":
    main()