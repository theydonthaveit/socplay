use strict;
use warnings;
use utf8;
use feature ':5.24';
use Data::Dumper;

use Mojolicious::Lite;
use Mojo::JSON qw( from_json );

use lib::Team;
use lib::CreateGame;

get '/' => sub {
        my $app = shift;

        $app->render(
            text => 'I ♥ Mojolicious!' );
    };

app->start;
