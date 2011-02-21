package Mason::Result;
BEGIN {
  $Mason::Result::VERSION = '2.01';
}
use Mason::Moose;

# Public attributes
has 'output' => ( required => 1 );

__PACKAGE__->meta->make_immutable();

1;



=pod

=head1 NAME

Mason::Result - Result returned from Mason request

=head1 VERSION

version 2.01

=head1 SYNOPSIS

    my $interp = Mason->new(...);
    my $output = $result->output;

=head1 DESCRIPTION

An object of this class is returned from C<< $interp->run >>. By default it
contains just the page output, but plugins may add additional accessors.

=head1 METHODS

=over

=item output

The output of the entire page, unless L<Mason::Request/out_method> was defined
in which case this will be empty.

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

