package lib::ApiRequester;

use strict;
use warnings;
use utf8;
use feature ':5.24';
use Data::Dumper;

use Mojo::Base 'Mojo';

use Moo;
use namespace::clean;

has url     => ( is => 'rw' );
has req     => ( is => 'rw' );
has ua      => (
    is => 'ro',
    isa => sub {  }
);

sub generate_request {
    my $self = shift;


}

1;
