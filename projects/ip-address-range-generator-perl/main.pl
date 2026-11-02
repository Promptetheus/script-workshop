#!/usr/bin/perl

use strict;
use warnings;

sub ip_address_range_generator {
    my ($network_range, $subnet_mask) = @_;

    # Validate input
    if ($subnet_mask > 32 || $subnet_mask < 0) {
        die "Invalid subnet mask. It should be between 0 and 32.";
    }

    # Convert subnet mask to binary
    my $subnet_mask_binary = sprintf("%032b", $subnet_mask);

    # Calculate the number of bits to shift
    my $shift = 32 - length($subnet_mask_binary);

    # Generate the IP address range
    my @ip_addresses = ();
    for (my $i = 0; $i < 256; $i++) {
        # Convert the current number to binary and pad with zeros
        my $binary = sprintf("%032b", $i);

        # Check if the binary representation of the current number
        # has the required number of leading ones
        if ($binary =~ /^1{$shift}0*/) {
            # Convert the binary representation to an IP address
            my $ip_address = sprintf("%d.%d.%d.%d",
                substr($binary, 0, 8, ''),
                substr($binary, 8, 8, ''),
                substr($binary, 16, 8, ''),
                substr($binary, 24, 8, '')
            );

            # Check if the IP address is within the network range
            if ($ip_address =~ /^$network_range/) {
                push(@ip_addresses, $ip_address);
            }
        }
    }

    return @ip_addresses;
}

if (scalar @ARGV != 2) {
    print "Usage: perl main.pl <network_range> <subnet_mask>\n";
    exit 1;
}

my ($network_range, $subnet_mask) = @ARGV;

my @ip_addresses = ip_address_range_generator($network_range, $subnet_mask);

print "IP address range: @ip_addresses\n";