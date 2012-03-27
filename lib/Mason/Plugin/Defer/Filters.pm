package Mason::Plugin::Defer::Filters;
BEGIN {
  $Mason::Plugin::Defer::Filters::VERSION = '2.17';
}
use Mason::PluginRole;

method Defer () {
    Mason::DynamicFilter->new(
        filter => sub {
            $self->m->defer( $_[0] );
        }
    );
}

1;
