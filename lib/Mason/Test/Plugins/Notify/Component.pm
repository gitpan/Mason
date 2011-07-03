package Mason::Test::Plugins::Notify::Component;
BEGIN {
  $Mason::Test::Plugins::Notify::Component::VERSION = '2.12';
}
use Mason::PluginRole;

# This doesn't work - it interrupts the inner() chain. Investigate later.
#
#  before 'render' => sub {
#      my ($self) = @_;
#      print STDERR "starting component render - " . $self->cmeta->path . "\n";
#  };

1;
