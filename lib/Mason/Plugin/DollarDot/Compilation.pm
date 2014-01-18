package Mason::Plugin::DollarDot::Compilation;
{
  $Mason::Plugin::DollarDot::Compilation::VERSION = '2.21';
}
use Mason::PluginRole;

after 'process_perl_code' => sub {
    my ( $self, $coderef ) = @_;

    # Replace $. with $self->
    $$coderef =~ s/ \$\.([^\W\d]\w*) / \$self->$1 /gx;
};

1;
