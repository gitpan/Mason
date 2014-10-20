package Mason::Exceptions;
BEGIN {
  $Mason::Exceptions::VERSION = '2.03';
}
use strict;
use warnings;

use Exception::Class (
    'Mason::Exception'        => { description => 'generic base class for all Mason exceptions', },
    'Mason::Exception::Abort' => {
        isa         => 'Mason::Exception',
        fields      => [qw(aborted_value)],
        description => 'a component called $m->abort'
    },

    'Mason::Exception::TopLevelNotFound' => {
        isa         => 'Mason::Exception',
        description => 'the top level component could not be found'
    },
);

1;



=pod

=head1 NAME

Mason::Exceptions - Exception objects thrown by Mason

=head1 VERSION

version 2.03

=head1 DESCRIPTION

This module creates the exception classes used by Mason.  Mason only throws
exception objects to communicate something specific to code catching the
exception; otherwise it is content to die with a string.

=head1 EXCEPTIONS

=over

=item Mason::Exception::Abort

The C<< $m->abort >> method was called.

Exceptions in this class contain the field C<aborted_value>.

=item Mason::Exception::TopLevelNotFound

The requested top level component passed to exec() could not be found. In a web
environment, this could be used to determine that a 404 should be returned.

=back

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

