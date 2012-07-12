package Mason::Test::RootClass::Interp;
BEGIN {
  $Mason::Test::RootClass::Interp::VERSION = '2.20';
}
use Moose;
extends 'Mason::Interp';

before 'run' => sub {
    print STDERR "starting interp run\n";
};

__PACKAGE__->meta->make_immutable();

1;
