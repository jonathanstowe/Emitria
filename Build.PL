#!perl
use 5.008;
use strict;
use warnings;

use Module::Build;



my $builder = Module::Build->new(
   module_name        => 'Emitria',
   dist_author        => q{Jonathan Stowe <jns@gellyfish.co.uk>},
   dist_version_from  => 'lib/Emitria.pm',
   license            => 'perl',
   configure_requires => {
      'Module::Build' => 0,
   },
   build_requires => {
      'Test::More'      => 0,
      'Test::Exception' => 0,
      'DBD::SQLite'     => 0,
   },
   requires => {
      perl                     => 5.008,
      'Moose'                  => 0,
      'DateTime'               => 0,
      'DBIx::Class'            => 0,
      'DBIx::Class::TimeStamp' => '0.14',
      'DBIx::Class::PassphraseColumn'  =>  '0.02',
      'Config::Tiny'           => 0,
      'MooseX::MarkAsMethods'  => 0,
      'MooseX::NonMoose'       => 0,
   },
   share_dir   => [qw(share)],
   create_makefile_pl => 'traditional',
   add_to_cleanup     => ['Emetria-*'],
   meta_merge         => {
      resources => { repository => 'https://github.com/jonathanstowe/Emitria' }
   },

);

$builder->create_build_script();
