use strict;
use warnings;
use JSON;

sub filter_evidence_matrix {
    my ($keyword, $evidence_matrix) = @_;

    # Validate input
    if (!$keyword || !$evidence_matrix) {
        return "Error: Both keyword and evidence matrix are required.";
    }

    # Convert evidence matrix to JSON array
    my $json_array = JSON->new->pretty->encode([@$evidence_matrix]);

    # Search for keyword in evidence matrix
    my @matching_rows;
    foreach my $row (@$evidence_matrix) {
        if ($row =~ /$keyword/) {
            push @matching_rows, $row;
        }
    }

    # Return matching rows as JSON array
    return $json_array;
}

sub main {
    my $keyword = <STDIN>;
    chomp $keyword;

    my $evidence_matrix = <STDIN>;
    chomp $evidence_matrix;

    my $result = filter_evidence_matrix($keyword, split /,/, $evidence_matrix);
    print $result;
}

if (caller) {
    main();
}