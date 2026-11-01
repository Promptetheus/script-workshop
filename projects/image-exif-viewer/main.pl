#!/usr/bin/perl

use strict;
use warnings;

use Image::ExifTool;

sub extract_exif_metadata {
    my ($file_path) = @_;

    # Check if the file exists
    if (! -f $file_path) {
        print "Error: The file '$file_path' does not exist.\n";
        return;
    }

    # Check if the file is a valid image
    my $exif_tool = Image::ExifTool->new;
    my $exif_data = $exif_tool->Read($file_path);
    if (!$exif_data) {
        print "Error: The file '$file_path' is not a valid image.\n";
        return;
    }

    # Extract and display EXIF metadata
    print "EXIF Metadata for $file_path:\n";
    print "  - Camera Make: " . $exif_data->{Make} . "\n";
    print "  - Camera Model: " . $exif_data->{Model} . "\n";
    print "  - Date Taken: " . $exif_data->{DateTimeOriginal} . "\n";
    print "  - ISO Speed: " . $exif_data->{ISOSpeedRatings} . "\n";
    print "  - Aperture: " . $exif_data->{FNumber} . "\n";
    print "  - Shutter Speed: " . $exif_data->{ShutterSpeedValue} . "\n";
    print "  - Focal Length: " . $exif_data->{FocalLength} . "\n";
}

sub main {
    print "Enter the path to the image file: ";
    my $file_path = <STDIN>;
    chomp $file_path;

    extract_exif_metadata($file_path);
}

main unless caller;