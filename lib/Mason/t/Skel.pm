package Mason::t::Skel;
BEGIN {
  $Mason::t::Skel::VERSION = '2.02';
}
use Test::Class::Most parent => 'Mason::Test::Class';

sub test_ : Test(1) {
    my $self = shift;
    $self->test_comp(
        src => '
',
        expect => '
',
    );
}

1;
