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

my $ua = Mojo::UserAgent->new;

my $geo_endpoint = 'https://www.googleapis.com/geolocation/v1/geolocate?';
my $key = 'key=' . $configuration->{google_api};

my $tx_geo = $ua->post( "$geo_endpoint$key" );

my $location = $tx_geo->res->json->{location};
my $lat = $location->{lat};
my $lng = $location->{lng};

my $location_endpoint = 'https://maps.googleapis.com/maps/api/geocode/json?';
my $geo_local = "latlng=$lat,$lng&";

my $tx_local = $ua->get( $location_endpoint . $geo_local . $key );

print
$tx_local->res->json->{results}->[3]->{address_components}->[0]->{short_name};
