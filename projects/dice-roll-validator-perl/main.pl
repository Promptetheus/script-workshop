use strict;
use warnings;

sub validate_roll {
    my ($input) = @_;
    chomp($input);

    # Check if input is a single number
    if ($input =~ /^\d+$/ && (length($input) == 1 || length($input) == 2)) {
        my $num = $input;
        if ($num >= 1 && $num <= 6) {
            return $num;
        } else {
            print "Error: Input must be a number between 1 and 6.\n";
            return;
        }
    }

    # Check if input is a range
    if ($input =~ /^\d+-\d+$/ && $input =~ '-' && length($input) == 5) {
        my ($min, $max) = split('-', $input);
        if ($min >= 1 && $min <= 6 && $max >= $min && $max <= 6) {
            return $min;
        } else {
            print "Error: Input must be a range between 1 and 6.\n";
            return;
        }
    }

    # If none of the above conditions are met, print an error message
    print "Error: Invalid input format.\n";
    return;
}

sub main {
    print "Enter a dice roll (e.g., 4 or 2-5): ";
    my $input = <STDIN>;
    validate_roll($input);
}

main unless caller;