package Mason::App;
BEGIN {
  $Mason::App::VERSION = '2.00';
}
use Cwd qw(realpath);
use File::Basename;
use File::Temp qw(tempdir);
use Getopt::Long;
use Mason;
use JSON;
use strict;
use warnings;

my $usage =
  "usage: $0 [--data-dir dir] [--plugins Plugin1,Plugin2] [--args json-string] [template-file]";

sub run {
    my ( %params, $args, $help );
    GetOptions(
        'args=s' => \$args,
        'h|help' => \$help,
        map { dashify($_) . "=s" => \$params{$_} } qw(data_dir plugins)
    ) or usage();
    if ($help) {
        system("perldoc $0");
        exit;
    }
    %params = map { defined( $params{$_} ) ? ( $_, $params{$_} ) : () } keys(%params);
    if ( $params{plugins} ) {
        $params{plugins} = [ split( /\s*,\s*/, $params{plugins} ) ];
    }
    my %run_args = defined($args) ? %{ decode_json($args) } : ();

    my $file = shift(@ARGV);
    usage() if @ARGV;
    if ( !$file ) {
        my $tempdir = tempdir( 'mason-XXXX', TMPDIR => 1, CLEANUP => 1 );
        $file = "$tempdir/stdin.m";
        open( my $fh, ">", $file );
        while (<STDIN>) { print $fh $_ }
    }

    my $comp_root = dirname($file);
    my $path      = "/" . basename($file);
    my $interp    = Mason->new( comp_root => $comp_root, autoextend_request_path => [], %params );
    print $interp->run( $path, %run_args )->output . "\n";
}

sub usage {
    print "$usage\n";
    exit;
}

sub dashify {
    my $name = shift;
    $name =~ s/_/-/g;
    return $name;
}

1;



=pod

=head1 NAME

Mason::App - Implementation of bin/mason

=head1 VERSION

version 2.00

=head1 DESCRIPTION

See documentation for bin/mason.

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

