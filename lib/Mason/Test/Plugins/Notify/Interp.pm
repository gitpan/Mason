package Mason::Test::Plugins::Notify::Interp;
BEGIN {
  $Mason::Test::Plugins::Notify::Interp::VERSION = '2.15';
}
use Mason::PluginRole;

before 'run' => sub {
    print STDERR "starting interp run\n";
};

1;
