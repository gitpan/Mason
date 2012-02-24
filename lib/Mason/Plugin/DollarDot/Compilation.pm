package Mason::Plugin::DollarDot::Compilation;
BEGIN {
  $Mason::Plugin::DollarDot::Compilation::VERSION = '2.16';
}
use Mason::PluginRole;

after 'process_perl_code' => sub {
    my ( $self, $coderef ) = @_;

    # Replace $. with $self->
    $$coderef =~ s/ \$\.([^\W\d]\w*) / \$self->$1 /gx;
};

1;
