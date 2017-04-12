package lib::ApiRequester;

use strict;
use warnings;
use utf8;
use feature ':5.24';

use Mojo::Base 'Mojo';

use Moo;
use namespace::clean;

has url => (
    is => 'rw'
);
has req => (
    is => 'rw',
    default => 'get'
);
has ua => (
    is => 'ro',
    default => sub {
        Mojo::UserAgent->new()
    }
);

sub generate_request
{
    my $self = shift;
    return $self->ua->$self->req( $self->url );
}

1;
