package Mason::Test::Plugins::Notify::Interp;
{
  $Mason::Test::Plugins::Notify::Interp::VERSION = '2.21';
}
use Mason::PluginRole;

before 'run' => sub {
    print STDERR "starting interp run\n";
};

1;
