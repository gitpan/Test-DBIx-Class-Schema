
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "DBIx::Class schema sanity checking tests",
  "AUTHOR" => "Chisel Wright <chisel\@chizography.net>",
  "BUILD_REQUIRES" => {
    "Test::Builder::Tester" => 0,
    "Test::More" => "0.92"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Test-DBIx-Class-Schema",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Test::DBIx::Class::Schema",
  "PREREQ_PM" => {
    "DBIx::Class" => "0.08",
    "FindBin" => 0,
    "Test::More" => "0.92"
  },
  "VERSION" => "0.01016",
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



