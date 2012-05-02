package Mason::Test::Overrides::Component::StrictMoose;
BEGIN {
  $Mason::Test::Overrides::Component::StrictMoose::VERSION = '2.19';
}
use Moose::Exporter;
use MooseX::StrictConstructor ();
use base qw(Mason::Component::Moose);
Moose::Exporter->setup_import_methods();

sub init_meta {
    my $class  = shift;
    my %params = @_;
    $class->SUPER::init_meta(@_);
    MooseX::StrictConstructor->import( { into => $params{for_class} } );
}

1;
