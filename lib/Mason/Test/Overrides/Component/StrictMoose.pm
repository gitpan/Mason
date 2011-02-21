package Mason::Test::Overrides::Component::StrictMoose;
BEGIN {
  $Mason::Test::Overrides::Component::StrictMoose::VERSION = '2.01';
}
use Moose::Exporter;
use MooseX::StrictConstructor ();
use strict;
use warnings;
use base qw(Mason::Component::Moose);
Moose::Exporter->setup_import_methods();

sub init_meta {
    my $class = shift;
    $class->SUPER::init_meta(@_);
    MooseX::StrictConstructor->init_meta(@_);
}

1;
