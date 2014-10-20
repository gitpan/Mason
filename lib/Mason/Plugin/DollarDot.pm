package Mason::Plugin::DollarDot;
BEGIN {
  $Mason::Plugin::DollarDot::VERSION = '2.12';
}
use Moose;
with 'Mason::Plugin';

1;



=pod

=head1 NAME

Mason::Plugin::DollarDot - Allow $. as substitution for $self-> and in
attribute names

=head1 SYNOPSIS

    <%args>
    $.name
    </%args>

    <%shared>
    $.date
    </%shared>

    <%method greet>
    Hello, <% $.name %>. Today is <% $.date %>.
    </%method>

    ...
    % $.greet();

    <%init>
    # Set the date
    $.date(scalar(localtime));
    # or, if combined with LvalueAttributes
    $.date = scalar(localtime);
    </%init>

=head1 DESCRIPTION

This plugin substitutes C<< $.I<identifier> >> for C<< $self->I<identifier> >>
in all Perl code inside components, so that C<< $. >> can be used when
referring to attributes and calling methods. The actual regex is

    s/ \$\.([^\W\d]\w*) / \$self->$1 /gx;

It also allows attributes in C<< <%args> >> and C<< <%shared> >> sections to be
harmlessly prefixed with C<< $. >>. The prefix is ignored; this is an optional
mnemonic to make the attribute's declaration match its use.

=head1 RATIONALE

In Mason 2, components have to write C<< $self-> >> a lot to refer to
attributes that were simple scalars in Mason 1. This eases the transition pain.
C<< $. >> was chosen because of its similar use in Perl 6.

This plugin falls under the heading of gratuitous source filtering, which the
author generally agrees is Evil. That said, this is a very limited filter, and
seems unlikely to break any legitimate Perl syntax other than use of the C<< $.
>> special variable (input line number).

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

