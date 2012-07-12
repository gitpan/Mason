package Mason::Test::RootClass::Compilation;
BEGIN {
  $Mason::Test::RootClass::Compilation::VERSION = '2.20';
}
use Moose;
extends 'Mason::Compilation';

before 'parse' => sub {
    my ($self) = @_;
    print STDERR "starting compilation parse - " . $self->path . "\n";
};

__PACKAGE__->meta->make_immutable();

1;
