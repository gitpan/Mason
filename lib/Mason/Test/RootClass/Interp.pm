package Mason::Test::RootClass::Interp;
BEGIN {
  $Mason::Test::RootClass::Interp::VERSION = '2.19';
}
use Moose;
extends 'Mason::Interp';

before 'run' => sub {
    print STDERR "starting interp run\n";
};

1;
