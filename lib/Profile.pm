package lib::Profile;

use strict;
use warnings;
use utf8;
use feature ':5.24';
use Data::Dumper;

use Moo;
use namespace::clean;

has tag_name    => ( is => 'rw' );
has avatar      => ( is => 'rw' );
has games       => ( is => 'rw' );
has user_name   => ( is => 'rw' );
has mmr         => ( is => 'rw' );
has region      => ( is => 'rw' );
has team        => ( is => 'rw' );

no Moo;
1;
