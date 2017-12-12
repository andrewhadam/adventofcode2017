use strict;
use warnings;
use List::Util qw( min max );

sub combine {

	my @list = @_;
	my $index = 0;
	foreach my $i (@list){
		my $j = $index;
		
		while ($j <= (scalar(@list) - 2)){
			if ($i % $list[$j + 1] == 0){
				return ($i / $list[$j + 1]);
			}
			elsif ($list[$j + 1] % $i == 0){
				return ($list[$j + 1] / $i);
			}
			else {
				$j += 1;
			}
		}
	$index += 1;
	}
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
	my $min = min @row_split;
	my $max = max @row_split;
	$check_sum = $check_sum + ($max - $min);
}

print "Div Sum: $div_sum\n";
print "Check Sum: $check_sum\n";
print "The End\n";
