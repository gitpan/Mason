package Mason::Test::RootClass::Request;
BEGIN {
  $Mason::Test::RootClass::Request::VERSION = '2.18';
}
use Moose;
extends 'Mason::Request';

before 'run' => sub {
    my ( $self, $path ) = @_;
    print STDERR "starting request run - $path\n";
};

before 'comp' => sub {
    my ( $self, $path ) = @_;
    print STDERR "starting request comp - $path\n";
};

1;
