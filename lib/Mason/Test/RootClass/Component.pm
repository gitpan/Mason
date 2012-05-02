package Mason::Test::RootClass::Component;
BEGIN {
  $Mason::Test::RootClass::Component::VERSION = '2.19';
}
use Moose;
extends 'Mason::Component';

# This doesn't work - it interrupts the inner() chain. Investigate later.
#
#  before 'render' => sub {
#      my ($self) = @_;
#      print STDERR "starting component render - " . $self->cmeta->path . "\n";
#  };

1;
