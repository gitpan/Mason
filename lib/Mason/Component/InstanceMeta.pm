package Mason::Component::InstanceMeta;
BEGIN {
  $Mason::Component::InstanceMeta::VERSION = '2.00';
}
use Mason::Component::ClassMeta;
use Mason::Moose;

# Passed attributes
has 'args'        => ( required => 1 );
has 'class_cmeta' => ( isa => 'Mason::Component::ClassMeta', handles => qr/^(?!args)/ );
has 'instance'    => ( required => 1, weak_ref => 1 );

__PACKAGE__->meta->make_immutable();

1;



=pod

=head1 NAME

Mason::Component::InstanceMeta - Meta-information about Mason component
instance

=head1 VERSION

version 2.00

=head1 SYNOPSIS

    # In a component:
    My path is <% $.cmeta->path %>
    My source file is <% $.cmeta->source_file %>
    I was called with args <% join(", ", %{$.cmeta->args}) %>

=head1 DESCRIPTION

Provides everything that
L<Mason::Component::ClassMeta|Mason::Component::ClassMeta> does, plus extra
information only available for component instances.

=over

=item args

The full hashref of arguments that was passed to the component's constructor.

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

