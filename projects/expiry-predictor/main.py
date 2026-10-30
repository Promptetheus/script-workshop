import datetime

def calculate_expiry_date(issue_date, validity_period):
    """
    Calculate the expiry date based on the issue date and a fixed validity period.

    Args:
        issue_date (datetime.date): The date when the certificate was issued.
        validity_period (int): The number of years the certificate is valid for.

    Returns:
        datetime.date: The date when the certificate will expire.
    """
    # Add the validity period to the issue date
    expiry_date = issue_date + datetime.timedelta(days=validity_period * 365)
    return expiry_date

def main():
    # Get the issue date from the user
    while True:
        try:
            issue_date_str = input("Enter the issue date (YYYY-MM-DD): ")
            issue_date = datetime.datetime.strptime(issue_date_str, "%Y-%m-%d").date()
            break
        except ValueError:
            print("Invalid date format. Please use YYYY-MM-DD.")

    # Get the validity period from the user
    while True:
        try:
            validity_period = int(input("Enter the validity period (in years): "))
            if validity_period <= 0:
                print("Validity period must be a positive integer.")
            else:
                break
        except ValueError:
            print("Invalid input. Please enter a positive integer.")

    # Calculate and print the expiry date
    expiry_date = calculate_expiry_date(issue_date, validity_period)
    print(f"The certificate will expire on {expiry_date.strftime('%Y-%m-%d')}")

if __name__ == "__main__":
    main()