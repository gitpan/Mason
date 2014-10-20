package Mason::Test::RootClass::Request;
BEGIN {
  $Mason::Test::RootClass::Request::VERSION = '2.20';
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

__PACKAGE__->meta->make_immutable();

1;
