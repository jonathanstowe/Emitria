use 5.006;
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
   NAME               => 'Emitria',
   AUTHOR             => q{Jonathan Stowe <jns@gellyfish.co.uk>},
   VERSION_FROM       => 'lib/Emitria.pm',
   ABSTRACT_FROM      => 'lib/Emitria.pm',
   LICENSE            => 'Artistic_2_0',
   PL_FILES           => {},
   MIN_PERL_VERSION   => 5.006,
   CONFIGURE_REQUIRES => {
      'ExtUtils::MakeMaker' => 0,
   },
   BUILD_REQUIRES => {
      'Test::More' => 0,
      'Test::Exception' => 0,
   },
   PREREQ_PM => {
      'Moose'                 => 0,
      'DateTime'              => 0,
      'DBIx::Class'           => 0,
      'DBD::Pg'               => 0,
      'Config::Tiny'          => 0,
      'MooseX::MarkAsMethods' => 0,
      'MooseX::NonMoose'      => 0,
      'Net::Google::Calendar'   => 0,
   },
   dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
   clean => { FILES    => 'Emetria-*' },
);
