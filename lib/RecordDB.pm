package lib::RecordDB;

use strict;
use warnings;
use utf8;
use feature ':5.24';
use Data::Dumper;

use Team;

sub record
{
    my $team =
        lib::Team::BUILD;

    my $dbh;
    my $log = { result => [] };
    my $database = 'TEAMS';

    my $sth =
        $dbh->prepare(
            "INSERT INTO "
            . $database
            . "(name,
                team_mates,
                region,
                game)
            VALUES (?,?,?,?)"
        );
        $sth->execute(
            $team->{name},
            $team->{team_mates},
            $team->{region},
            $team->{game}
        );

    return push @{$log->{result}}, 'Successful data upload';
}

1;
