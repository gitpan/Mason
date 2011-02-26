package Mason::Test::Overrides::Component::StrictMoose;
BEGIN {
  $Mason::Test::Overrides::Component::StrictMoose::VERSION = '2.04';
}
use Moose::Exporter;
use MooseX::StrictConstructor ();
use base qw(Mason::Component::Moose);
Moose::Exporter->setup_import_methods();

sub init_meta {
    my $class = shift;
    $class->SUPER::init_meta(@_);
    MooseX::StrictConstructor->init_meta(@_);
}

1;
