use strict;
use warnings;
use utf8;
use feature ':5.24';
use Data::Dumper;

use Mojo::Base 'Mojo';
use Mojo::JSON qw( from_json );

my $json;
{
    local $/; #Enable 'slurp' mode
    open my $fh, "<", "../conf.json";
        $json = <$fh>;
    close $fh;
}

my $configuration = from_json($json);

my $euw_endpoint = 'https://euw1.api.riotgames.com/lol/platform/v3/champions?';
my $api_key = 'api_key=' . $configuration->{riot_api};

my $google_endpoint = 'https://maps.googleapis.com/maps/api/geocode/json?';
my $address = 'address=&';
my $post_code = 'components=country:GB&';
my $google_key = 'key=';

my $ua = Mojo::UserAgent->new;
my $tx = $ua->get( $euw_endpoint . $api_key );

my $content = $tx->res->body;
print $content;
