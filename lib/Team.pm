package lib::Team;

use strict;
use warnings;
use utf8;
use feature ':5.24';

# use Moo;
#
# has name => (
#     is => 'rw'
# );
# has team_mates => (
#     is => 'rw'
# );
# has region => (
#     is => 'rw'
# );
# has game => (
#     is => 'rw'
# );
#
# no Moo;
# 1;

sub BUILD
{
    my %args = @_;

    return my $team = {
        name => $args{name},
        team_mates => $args{team_mates},
        region => $args{region},
        game => $args{game}
    };
}

1;
