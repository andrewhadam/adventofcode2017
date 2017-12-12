use strict;
use warnings;
use List::Util qw( min max );

sub combine {

	my @list = @_;
#	my @comb; 
	my $index = 0;
	print scalar(@list)."\n";
	foreach my $i (@list){
#		print "i: $i\n";
		
		my $j = $index;
		
		while ($j <= (scalar(@list) - 2)){
#			print "List element: $list[$j + 1]\n";
#			print "J: $j\n";
			if ($i % $list[$j + 1] == 0){
				print "I: $i and List: $list[$j+1]";
				my $val = $i / $list[$j + 1];
				print "My Value: $val\n";
				return ($i / $list[$j + 1]);
			}
			elsif ($list[$index + 1] % $i == 0){
				my $val = $list[$j + 1] / $i;
				print "My Value: $val\n";
				return ($list[$j + 1] / $i);
			}
			else {
				$j += 1;
			}
		}
	$index += 1;
	}
#	if ($list[scalar(@list) - 1] % $list[scalar(@list) - 2] == 0){
#		return ($list[scalar(@list) - 1] % $list[scalar(@list) - 2]);
#	}
#	elsif ($list[scalar(@list) - 2] % $list[scalar(@list) - 1] == 0){
#		return ($list[scalar(@list) - 2] % $list[scalar(@list) - 1]);
#	}

	return 0;
}

my $file = 'day2.txt';
open (my $fh, '<:encoding(UTF-8)', $file) or die "Unable to open $file\n";
my $check_sum = 0;
my $div_sum = 0;

while (my $row = <$fh>) {
	chomp $row;
	my @row_split = split /\t/, $row;
	my $new_div = combine(@row_split);
	$div_sum += $new_div;
#	$div_sum += combine(@row_split);
#	print "div sum: $div_sum\n";
	my $min = min @row_split;
	my $max = max @row_split;
	$check_sum = $check_sum + ($max - $min);
#	print "Minimum: $min, Maximum: $max\n";
}
print combine((5, 9, 2, 8))."\nThis is a test\n";
print combine((29, 4, 7, 5, 11, 13, 17, 19, 9, 3))."\nThis is second test\n";

print "Div Sum: $div_sum\n";
print "Check Sum: $check_sum\n";
print "The End\n";
