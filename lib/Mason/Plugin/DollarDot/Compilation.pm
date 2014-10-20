package Mason::Plugin::DollarDot::Compilation;
BEGIN {
  $Mason::Plugin::DollarDot::Compilation::VERSION = '2.03';
}
use Mason::PluginRole;

after 'process_perl_code' => sub {
    my ( $self, $coderef ) = @_;
    $$coderef =~ s/ \$\.([^\W\d]\w*) / \$self->$1 /gx;
};

1;
