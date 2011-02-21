package Mason::t::DollarDot;
BEGIN {
  $Mason::t::DollarDot::VERSION = '2.01';
}
use Test::Class::Most parent => 'Mason::Test::Class';

sub test_dollardot : Test(1) {
    my $self = shift;
    $self->test_comp(
        src => '
<%args>
$.name => "Joe"
</%args>

<%shared>
$.date
</%shared>

<%method greet>
Hello, <% $.name %>. Today is <% $.date %>.
</%method>

% $.greet();

<%init>
$.date("March 5th");
</%init>
',
        expect => '
Hello, Joe. Today is March 5th.
',
    );
}

1;
