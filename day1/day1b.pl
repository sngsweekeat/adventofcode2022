#!/usr/bin/perl
use strict;
use warnings;

open(my $fh, "<", "./input.txt") or die("Could not open file.");
my $thisCalories = 0;
my @allCalories = ();
while (<$fh>) {
    s/\r?\n\z//;
    if ($_ eq "") {
        # Is this elf's calories more than the highest so far?
        print "this elf has ".$thisCalories."\n";
        push(@allCalories, $thisCalories);
        $thisCalories = 0;
    } else {
        $thisCalories += $_;
    }
}
my @sortedCalories = sort { $a <=> $b } @allCalories;
print pop(@sortedCalories) + pop(@sortedCalories) + pop(@sortedCalories);

