package Mason::PluginRole;
BEGIN {
  $Mason::PluginRole::VERSION = '2.00';
}
use Moose::Role                ();
use Method::Signatures::Simple ();
use Moose::Exporter;
Moose::Exporter->setup_import_methods( also => ['Moose::Role'] );

sub init_meta {
    my $class     = shift;
    my %params    = @_;
    my $for_class = $params{for_class};
    Method::Signatures::Simple->import( into => $for_class );
    Moose::Role->init_meta(@_);
}

1;



=pod

=head1 NAME

Mason::PluginRole - Helper for defining Mason plugin roles

=head1 VERSION

version 2.00

=head1 SYNOPSIS

    # instead of use Moose::Role;
    use Mason::PluginRole;

=head1 DESCRIPTION

A variant on Moose::Role that can be used in Mason plugin roles. Using this
module is equivalent to

    use Moose::Role;
    use Method::Signatures::Simple;

=head1 SEE ALSO

L<Mason|Mason>

=head1 AUTHOR

Jonathan Swartz <swartz@pobox.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Jonathan Swartz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

