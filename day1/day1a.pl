#!/usr/bin/perl
use strict;
use warnings;

open(my $fh, "<", "./input.txt") or die("Could not open file.");
my $thisCalories = 0;
my $topCalories = 0;
while (<$fh>) {
    s/\r?\n\z//;
    if ($_ eq "") {
        # Is this elf's calories more than the highest so far?
        print "this elf has ".$thisCalories."\n";
        if ($thisCalories > $topCalories) {
            $topCalories = $thisCalories;
            print "New top calories! ".$topCalories."\n";
        }
        $thisCalories = 0;
    } else {
        $thisCalories += $_;
    }
}
if ($thisCalories gt $topCalories) {
    $topCalories = $thisCalories;
}

print "Max is ".$topCalories;