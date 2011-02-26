
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Powerful, high-performance templating for the web and beyond',
  'AUTHOR' => 'Jonathan Swartz <swartz@pobox.com>',
  'BUILD_REQUIRES' => {
    'Test::Class::Most' => '0',
    'Test::LongString' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Mason',
  'EXE_FILES' => [
    'bin/mason'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'Mason',
  'PREREQ_PM' => {
    'Capture::Tiny' => '0',
    'Class::Unload' => '0',
    'Devel::GlobalDestruction' => '0',
    'File::Spec' => '0',
    'File::Temp' => '0',
    'Guard' => '0',
    'IPC::System::Simple' => '0',
    'JSON' => '0',
    'Log::Any' => '0.08',
    'Memoize' => '0',
    'Method::Signatures::Simple' => '0',
    'Moose' => '0.95',
    'MooseX::HasDefaults' => '0',
    'MooseX::StrictConstructor' => '0',
    'Scalar::Util' => '1.01',
    'Try::Tiny' => '0'
  },
  'VERSION' => '2.04',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



