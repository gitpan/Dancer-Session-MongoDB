
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "MongoDB session backend for Dancer.",
  "AUTHOR" => "Ido Perlmuter <ido\@ido50.net>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dancer-Session-MongoDB",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dancer::Session::MongoDB",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Dancer::Config" => 0,
    "Dancer::ModuleLoader" => 0,
    "Dancer::Session::Abstract" => 0,
    "MongoDB" => 0,
    "base" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.3",
  "test" => {
    "TESTS" => "t/*.t"
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



