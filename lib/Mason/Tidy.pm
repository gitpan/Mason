package Mason::Tidy;
BEGIN {
  $Mason::Tidy::VERSION = '2.12';
}
use File::Slurp;
use IO::Scalar;
use Mason::Tidy::Moose;
use HTML::TreeBuilder;

our $unique_string_count = 0;

# Passed attributes
has 'unique_string_prefix' => ( default => '__masontidy__' );

#
# BUILD
#

method tidy ($source) {
    foreach my $subclass qw(PlainText IsolatedBlock InlinePerl RecursiveBlock) {
        my $class = "Mason::Tidy::Compilation::$subclass";
        Class::MOP::load_class($class);
        my $c = $class->new( source => $source, tidy_object => $self );
        $c->transform;
        $source = $c->source;
    }
    return $source;
}

method unique_string () {
    return join( "_", $self->unique_string_prefix, $unique_string_count++ );
}

1;
