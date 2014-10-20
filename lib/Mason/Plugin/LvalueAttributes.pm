package Mason::Plugin::LvalueAttributes;
BEGIN {
  $Mason::Plugin::LvalueAttributes::VERSION = '2.01';
}
use Moose;
with 'Mason::Plugin';

1;



=pod

=head1 NAME

Mason::Plugin::LvalueAttributes - Create lvalue accessors for all rw component
attributes

=head1 VERSION

version 2.01

=head1 SYNOPSIS

    <%shared>
    $.a => (is => "rw")
    $.b => (is => "ro")
    </%shared>

    <%init>
    # set a to 5
    $.a = 5;

    # set a to 6
    $.a(6);

    # error
    $.b = 7;
    </%init>

=head1 DESCRIPTION

This plugins creates an Lvalue accessor for every read/write attribute in the
component. Which means that instead of writing:

    $.name( "Foo" );

you can use the more natural syntax

    $.name = "Foo";

=head1 WARNING

Standard Moose setter features such as type checking, triggers, and coercion
will not work on Lvalue attributes. You should only use this plugin when the
convenience of the Lvalue attributes outweighs the need for setter features.

=head1 ACKNOWLEDGEMENTS

Inspired by Christopher Brown's
L<MooseX::Meta::Attribute::Lvalue|MooseX::Meta::Attribute::Lvalue >.

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

