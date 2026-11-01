#!/usr/bin/perl

package AnniversaryReminderGenerator;

use strict;
use warnings;

sub calculate_anniversary_date {
    my ($year, $month, $day) = @_;
    my $current_date = (localtime)[5];
    my $anniversary_date = $current_date + ($year - $current_date) * 365 + ($month - $current_date) * 30 + ($day - $current_date);
    # Handle leap years
    if (($year % 4 == 0 && $year % 100 != 0) || $year % 400 == 0) {
        $anniversary_date += 1;
    }
    return $anniversary_date;
}

sub send_reminder {
    my ($anniversary_date) = @_;
    my $reminder_message = "Your work anniversary is on $anniversary_date";
    print $reminder_message . "\n";
}

sub generate_reminder {
    my ($work_anniversary_date) = @_;
    my $year = substr($work_anniversary_date, 0, 4);
    my $month = substr($work_anniversary_date, 4, 2);
    my $day = substr($work_anniversary_date, 6, 2);
    my $anniversary_date = calculate_anniversary_date($year, $month, $day);
    send_reminder($anniversary_date);
}

sub main {
    my $work_anniversary_date = shift;
    if ($work_anniversary_date =~ /^\d{8}$/) {
        generate_reminder($work_anniversary_date);
    } else {
        print "Invalid date format. Please use YYYYMMDD.\n";
    }
}

main(@ARGV);