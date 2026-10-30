use strict;
use warnings;

# Get the list of tags from the user
print "Enter the list of tags separated by comma: ";
my $tags = <STDIN>;
chomp($tags);

# Split the input into individual tags
my @tags = split /,/, $tags;

# Validate the input
if (@tags == 0) {
    print "Error: No tags provided.\n";
    exit;
}

# Print the list of tags
print "You have entered the following tags:\n";
foreach my $tag (@tags) {
    print "$tag\n";
}

# Ask the user to select a tag
print "Select a tag to track it: ";
my $selected_tag = <STDIN>;
chomp($selected_tag);

# Validate the input
if (!@tags) {
    print "Error: No tags to select from.\n";
    exit;
}

# Check if the selected tag is valid
if (not exists $tags[$selected_tag]) {
    print "Error: Invalid tag selected.\n";
    exit;
}

# Print a success message
print "Tag selected successfully.\n";