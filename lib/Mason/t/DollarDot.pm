package Mason::t::DollarDot;
BEGIN {
  $Mason::t::DollarDot::VERSION = '2.12';
}
use Test::Class::Most parent => 'Mason::Test::Class';

sub test_dollardot : Tests {
    my $self = shift;
    $self->add_comp(
        path => '/helper.mi',
        src  => '%% has "foo";
Helper: <% $.foo %>
',
    );
    $self->test_comp(
        src => '
<%args>
$.name => "Joe"
</%args>

<%shared>
$.compname
$.date
</%shared>

<%method greet>
Hello, <% $.name %>. Today is <% $.date %>.
</%method>

% $.greet();

<& $.compname, foo => $.date &>
<& /helper.mi, foo => $.name &>

<%init>
$.date("March 5th");
$.compname("helper.mi");
</%init>
',
        expect => '
Hello, Joe. Today is March 5th.

Helper: March 5th

Helper: Joe
',
    );
}

1;
