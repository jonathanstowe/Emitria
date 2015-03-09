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
      'Test::Most'            => '0.31',
      'Test::Exception'       => 0,
      'Test::Pod::Coverage'   => '1.10',
      'Devel::Cover'          => '1.03',
      'DBD::SQLite'           => 0,
   },
   requires => {
      perl                                            => 5.008,
      'Catalyst::Runtime'                             => '5.90019',
      'Catalyst::Action::REST'                        => '1.11',
      'Moose'                                         => '2.1',
      'MooseX::MethodAttributes'                      => '0.28',
      'DateTime'                                      => '1.06',
      'DBIx::Class'                                   => '0.08206',
      'DBIx::Class::TimeStamp'                        => '0.14',
      'DBIx::Class::PassphraseColumn'                 => '0.02',
      'DBIx::Class::Helpers'                          => '2.023005',
      'Catalyst::Model::DBIC::Schema'                 => '0.61',
      'Catalyst::Plugin::Authentication'              => '0.10022',
      'Config::Tiny'                                  => '2.14',
      'MooseX::MarkAsMethods'                         => '0.15',
      'MooseX::NonMoose'                              => '0.22',
      'Log::Log4perl'                                 => '1.44',
      'Try::Tiny'                                     => '0.22',
      'File::HomeDir'                                 => '1.00',
      'Catalyst::Plugin::Session::State::Cookie'      =>	'0.17',
      'Catalyst::Plugin::Session::Store::File'	      =>	'0.18',
      'Catalyst::Plugin::StackTrace'                  =>	'0.12',
      'Catalyst::Authentication::Store::DBIx::Class'  => '0.1506',
      'Catalyst::View::TT'	                           => '0.42',
      'Data::UUID'                                    => '1.220',
      'Throwable'                                     => '0.200012',
   },
   share_dir   => [qw(share)],
   create_makefile_pl => 'traditional',
   add_to_cleanup     => ['emitria.db*','Emetria-*'],
   meta_merge         => {
      resources => { repository => 'https://github.com/jonathanstowe/Emitria' }
   },
);

$builder->create_build_script();
