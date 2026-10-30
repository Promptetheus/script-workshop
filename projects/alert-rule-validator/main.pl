use strict;
use warnings;

# Define a subroutine to validate the input
sub validate_input {
    my ($rule_name, $trigger_days, $trigger_hours) = @_;

    # Validate the rule name
    if (!$rule_name || length($rule_name) == 0) {
        print "Error: Rule name is required.\n";
        return 0;
    }

    # Validate the trigger days
    if (!$trigger_days || $trigger_days < 1) {
        print "Error: Trigger days must be a positive integer.\n";
        return 0;
    }

    # Validate the trigger hours
    if (!$trigger_hours || $trigger_hours < 0 || $trigger_hours > 23) {
        print "Error: Trigger hours must be between 0 and 23.\n";
        return 0;
    }

    return 1;
}

# Define a subroutine to verify the alert rule
sub verify_alert_rule {
    my ($rule_name, $trigger_days, $trigger_hours) = @_;

    # Simulate the verification process (replace with actual logic)
    print "Verifying alert rule '$rule_name'...\n";
    print "Trigger days: $trigger_days\n";
    print "Trigger hours: $trigger_hours\n";

    # Return a success message
    print "Alert rule '$rule_name' verified successfully.\n";
    return 1;
}

# Define a subroutine to generate the output
sub generate_output {
    my ($rule_name, $trigger_days, $trigger_hours) = @_;

    # Simulate the output generation process (replace with actual logic)
    print "Generating output for alert rule '$rule_name'...\n";
    print "Trigger days: $trigger_days\n";
    print "Trigger hours: $trigger_hours\n";

    # Return the output
    print "Output generated successfully.\n";
    return 1;
}

# Main program
if (scalar @ARGV != 3) {
    print "Error: Invalid number of command-line arguments.\n";
    print "Usage: perl main.pl <rule_name> <trigger_days> <trigger_hours>\n";
    exit 1;
}

my ($rule_name, $trigger_days, $trigger_hours) = @ARGV;

# Validate the input
if (!validate_input($rule_name, $trigger_days, $trigger_hours)) {
    exit 1;
}

# Verify the alert rule
if (!verify_alert_rule($rule_name, $trigger_days, $trigger_hours)) {
    exit 1;
}

# Generate the output
if (!generate_output($rule_name, $trigger_days, $trigger_hours)) {
    exit 1;
}