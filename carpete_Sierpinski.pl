#!/usr/bin/perl
######################################################################
# Sierpinky y sus carpetes...
######################################################################
use Getopt::Std;

my %opts = ();
getopts('n:',\%opts);

my $nivel = $opts{n} || 3;

carpete($nivel);

######################################################################
# S U B S
######################################################################
sub en_carpete {
    my $x = shift;
    my $y = shift;
    while (1) {
        if ( $x == 0 or $y == 0 ) {
            return 0;
        } elsif ( $x % 3 == 1 and $y % 3 == 1 ) {
            return 1;
        }
        $x /= 3;
        $y /= 3;
    }
}

sub carpete {
    my $n = shift;
    for my $i (1 .. 3 ** $n -1) {
        for my $j (1 .. 3 ** $n -1) {
            if ( en_carpete( $i, $j ) ) {
                print "*";
            } else {
                print " ";
            }
        }
        print "\n";
    }
}

