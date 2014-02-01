package Mason::Test::Plugins::Notify::Compilation;
$Mason::Test::Plugins::Notify::Compilation::VERSION = '2.22';
use Mason::PluginRole;

before 'parse' => sub {
    my ($self) = @_;
    print STDERR "starting compilation parse - " . $self->path . "\n";
};

1;
