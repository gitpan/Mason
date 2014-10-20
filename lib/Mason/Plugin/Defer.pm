package Mason::Plugin::Defer;
BEGIN {
  $Mason::Plugin::Defer::VERSION = '2.15';
}
use Moose;
with 'Mason::Plugin';

1;



=pod

=head1 NAME

Mason::Plugin::Defer - Defer computing parts of output until the end of the
request

=head1 SYNOPSIS

    <head>
    <title><% $m->defer(sub { $m->page->title }) %></title>

    % $.Defer {{
    %   my $content = join(", ", @{ $m->page->meta_content });
    <meta name="description" content="<% $content %>">
    % }}

    <body>
    ...

=head1 DESCRIPTION

The I<defer> feature allows sections of output to be deferred til the end of
the request. You can set up multiple deferred code blocks which will execute
and insert themselves into the output stream at request end.

=head1 REQUEST METHOD

=over

=item defer (code)

Returns a marker string that is unique and will not appear in normal output. At
the end of the request, each marker string is replaced with the output of its
associated code. e.g.

    <title><% $m->defer(sub { $m->page->title }) %></title>

=back

=head1 FILTER

=over

=item Defer

Applies C<< $m->defer >> to the content block. e.g.

    % $.Defer {{
    %   my $content = join(", ", @{ $m->page->meta_content });
    <meta name="description" content="<% $content %>">
    % }}

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

