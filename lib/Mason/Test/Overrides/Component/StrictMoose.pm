package Mason::Test::Overrides::Component::StrictMoose;
BEGIN {
  $Mason::Test::Overrides::Component::StrictMoose::VERSION = '2.20';
}
use Moose::Exporter;
use MooseX::StrictConstructor ();
use strict;
use warnings;
use base qw(Mason::Component::Moose);
use strict;
use warnings;

Moose::Exporter->setup_import_methods();

sub init_meta {
    my $class  = shift;
    my %params = @_;
    $class->SUPER::init_meta(@_);
    MooseX::StrictConstructor->import( { into => $params{for_class} } );
}

1;
