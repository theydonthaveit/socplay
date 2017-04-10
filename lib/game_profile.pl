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

my $euw_endpoint = 'https://euw1.api.riotgames.com/';
my $summer_name = 'power of rice';
my $profile = 'lol/summoner/v3/summoners/by-name/';
my $api_key = '?api_key=' . $configuration->{riot_api};

my $tx = $ua->get( "$euw_endpoint$profile$summer_name$api_key" );

my $summer_id = $tx->res->json->{id};
my $sum_stats = "api/lol/{region}/v1.3/stats/by-summoner/$summer_id/summary";
my $rank_stats = "api/lol/{region}/v1.3/stats/by-summoner/$summer_id/ranked";

my $tx_sum = $ua->get("$euw_endpoint$sum_stats$api_key");

print $tx_sum->res->body;
