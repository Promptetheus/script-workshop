use strict;
use warnings;

sub validate_barcode {
    my ($barcode) = @_;

    # Check if barcode is a string
    if (!ref $barcode) {
        return "Error: Barcode must be a string or a file path.";
    }

    # Check if barcode is empty
    if (length($barcode) == 0) {
        return "Warning: Barcode is empty.";
    }

    # Check if barcode contains only digits
    if ($barcode =~ /^\d+$/) {
        return "Warning: Barcode contains only digits.";
    }

    # If all checks pass, return success message
    return "Barcode is valid.";
}

sub read_barcode {
    my ($filename) = @_;

    # Check if file exists
    if (! -f $filename) {
        return "Error: File does not exist.";
    }

    # Read barcode from file
    open my $fh, '<', $filename or die "Cannot open file '$filename': $!";
    my $barcode = do { local $/; <STDIN> };
    close $fh or die "Cannot close file '$filename': $!";

    # Validate barcode
    my $result = validate_barcode($barcode);
    return $result;
}

sub main {
    my $filename = shift;

    # Read barcode from file or user input
    if (length($filename) > 0) {
        my $result = read_barcode($filename);
        print "$result\n";
    } else {
        print "Enter barcode string or file path: ";
        my $input = <STDIN>;
        chomp $input;
        my $result = validate_barcode($input);
        print "$result\n";
    }
}

if (caller) {
    main(@ARGV);
} else {
    main();
}