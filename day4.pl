use strict;
use warnings;

sub checkValid {
        my @list = @_;
	
	for my $i (@list){
		if (grep(/$i/, @list) > 1){
			return 0;
		}
	}
	return 1;
}

my $file = 'day4.txt';
open (my $fh, '<:encoding(UTF-8)', $file) or die "Unable to open $file\n";
my $check_sum = 0;

while (my $row = <$fh>) {
        chomp $row;
	my @row_split = split / /, $row;
	$check_sum += checkValid(@row_split);
} 
print "Valid Passwords: $check_sum";
