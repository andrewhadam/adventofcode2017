use strict;
use warnings;

my $number = "$ARGV[0]";
my $total = 0;

for my $i (0..length($number)-1){
	if ($i == length($number)-1){
		if (substr($number, length($number) -1, 1) == substr($number, 0, 1)){
			$total += substr($number, 0, 1);
		}
	}
	else {
		if (substr($number, $i, 1) == substr($number, $i+1, 1)){
			$total += substr($number ,$i, 1);
		}
	}
}
print "Total: $total\n";
print "Number: $number\n";
