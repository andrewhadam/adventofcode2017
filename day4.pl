use strict;
use warnings;
use Word::Anagram;
use Data::Dumper;

sub checkAnagram{
	my @list = @_;
	my $obj = Word::Anagram->new;
	
	for my $i (@list){
		my $anag = $obj->find_word_in($i, \@list);
		if (@$anag > 1){
			print "I should be breaking here.\n";
			return 0;

		}
	}
	return 1;
}

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
my $valid_checks = 0;

while (my $row = <$fh>) {
        chomp $row;
	my @row_split = split / /, $row;
	$check_sum += checkValid(@row_split);
	if (checkAnagram(@row_split) == 1){
		$valid_checks += 1;
	}
} 
print "Valid Passwords: $check_sum\n";
print "Valid Checks: $valid_checks";
