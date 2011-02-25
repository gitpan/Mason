package Mason::t::Sanity;
BEGIN {
  $Mason::t::Sanity::VERSION = '2.03';
}
use Test::Class::Most parent => 'Mason::Test::Class';

sub test_ok : Test(1) {
    my $self = shift;
    $self->test_comp( src => '2 + 2 = <% 2 + 2 %>', expect => '2 + 2 = 4' );
}

1;
