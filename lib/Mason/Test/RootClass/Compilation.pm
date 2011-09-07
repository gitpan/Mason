package Mason::Test::RootClass::Compilation;
BEGIN {
  $Mason::Test::RootClass::Compilation::VERSION = '2.14';
}
use Moose;
extends 'Mason::Compilation';

before 'parse' => sub {
    my ($self) = @_;
    print STDERR "starting compilation parse - " . $self->path . "\n";
};

1;
