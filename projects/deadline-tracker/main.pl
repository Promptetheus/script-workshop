use strict;
use warnings;

sub date_calculation {
    my ($start_date, $due_date) = @_;

    # Validate input
    unless ($start_date =~ /^\d{4}-\d{2}-\d{2}$/ && $due_date =~ /^\d{4}-\d{2}-\d{2}$/) {
        print "Invalid date format. Please use YYYY-MM-DD.\n";
        return;
    }

    my ($start_year, $start_month, $start_day) = split('-', $start_date);
    my ($due_year, $due_month, $due_day) = split('-', $due_date);

    my $days = ($due_year - $start_year) * 365 + ($due_month - $start_month) * 30 + ($due_day - $start_day);
    my $years = $days / 365;
    my $months = int($days / 30);
    my $weeks = int($days / 7);
    my $days_left = $days % 7;

    print "Years: $years\n";
    print "Months: $months\n";
    print "Weeks: $weeks\n";
    print "Days: $days_left\n";
}

sub main {
    print "Enter start date (YYYY-MM-DD): ";
    my $start_date = <STDIN>;
    chomp($start_date);

    print "Enter due date (YYYY-MM-DD): ";
    my $due_date = <STDIN>;
    chomp($due_date);

    date_calculation($start_date, $due_date);
}

if (caller() eq __FILE__) {
    main();
}