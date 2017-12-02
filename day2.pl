use strict;
use warnings;
use List::Util qw( min max );

my $file = 'day2.txt';
open (my $fh, '<:encoding(UTF-8)', $file) or die "Unable to open $file\n";
my $check_sum = 0;

while (my $row = <$fh>) {
	chomp $row;
	my @row_split = split /\t/, $row;
	my $min = min @row_split;
	my $max = max @row_split;
	$check_sum = $check_sum + ($max - $min);
	print "Minimum: $min, Maximum: $max\n";
}
print "Check Sum: $check_sum";
print "The End\n";
