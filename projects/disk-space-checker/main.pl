use strict;
use warnings;

sub disk_space_checker {
    my $size = shift;
    my $threshold = shift;

    # Validate user input
    if ($size <= 0 || $threshold <= 0) {
        print "Error: Both size and threshold must be positive numbers.\n";
        return;
    }

    # Get available disk space
    my $available_space = `df -k --output=avail / | tail -n 1`;

    # Check if available disk space is sufficient
    if ($available_space >= $size) {
        print "Available disk space is sufficient for the new backup.\n";
    } else {
        print "Available disk space is not sufficient for the new backup.\n";
    }
}

# Example usage
disk_space_checker(100, 500);