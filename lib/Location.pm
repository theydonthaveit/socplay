package lib::Location;

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
        $json =
            <$fh>;
    close $fh;
}

my $configuration =
    from_json($json);

my $ua =
    Mojo::UserAgent->new;

my $google_url =
    'https://www.googleapis.com/';
my $geo_endpoint =
    'geolocation/v1/geolocate?';
my $key =
    'key='
    . $configuration->{google_api};

my $tx_geo =
    $ua->post(
        $google_url
        . $geo_endpoint
        . $key );
my $location =
    $tx_geo->res->json->{location};

my $lat =
    $location->{lat};
my $lng =
    $location->{lng};

my $location_endpoint =
    'maps/api/geocode/json?';
my $geo_local =
    'latlng='
    . "$lat,$lng"
    . '&';

my $tx_local =
    $ua->get(
        $google_url
        . $location_endpoint
        . $geo_local
        . $key );
my $res =
    $tx_local->res->json->{results};

print
    $res->[3]->{address_components}->[0]->{short_name};
