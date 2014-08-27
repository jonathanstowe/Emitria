package Emitria::Config;

use strict;
use warnings;

use Moose;

use Config::Tiny;
use File::Spec::Functions qw(catfile catdir rel2abs curdir);
use File::ShareDir qw(dist_dir);
use File::HomeDir;
use File::Basename qw(dirname);
use Path::Class;
use Carp qw(croak);


=head1 NAME

Emitria::Config - Encapsulate the configuration

=head1 DESCRIPTION

This provides methods for obtaining the Emitria configuration.

=head2 METHODS

=over 4

=item config_file

This is the default configuration file for emitria.

/usr/local/etc/emitria/emitria.conf

Typically it shouldn't need to be changed but can be set if your
installation is unusual.

=cut

has config_file   => (
                        is    => 'rw',
                        isa   => 'Str',
                        lazy  => 1,
                        builder  => '_get_config_file',
                     );

sub _get_config_file
{
    my ( $self ) = @_;

    my $file;

    my $test_config =  file(curdir, 't', 'etc', 'emitria.conf')->resolve();

    if ( -f $test_config )
    {
        $file = $test_config->stringify();
    }
    elsif ( -f $ENV{EMITRIA_CONFIG} )
    {
        $file = $ENV{EMITRIA_CONFIG};
    }
    else
    {
        my $share_file = file($self->share_dir(), 'etc', 'emitria.conf'); 

        if ( -d $share_file )
        {
            $file = $share_file->stringify();
        }
    }

    return $file;
}

=item template_path

This returns an ArrayRef of places that the templates might be found.

This probably should be put something more web specific.

=cut

has template_path => (
                        is => 'ro',
                        isa   => 'ArrayRef',
                        lazy  => 1,
                        builder  => '_get_template_dirs',
                     );

sub _get_template_dirs
{
    my ( $self ) = @_;

    my @dirs;
    my $shared_template = dir($self->share_dir(), 'templates');

    if ( defined $ENV{EMITRIA_TEMPLATES} && -d $ENV{EMITRIA_TEMPLATES} )
    {
        push @dirs, $ENV{EMITRIA_TEMPLATES};
    }
    if ( -d $shared_template )
    {
        push @dirs, $shared_template->stringify();
    }

    my $test_templates =  dir(curdir, 'share', 'templates');

    if ( -d $test_templates )
    {
        push @dirs, $test_templates->stringify();
    }
    return \@dirs;
}

=item htdocs_dir

Returns a plausible directory for the htdocs that will be used for the
root for serving static content.

=cut

has htdocs_dir => (
                     is => 'ro',
                     isa   => 'Str',
                     lazy  => 1,
                     builder  => '_get_htdocs_dir',
                  );

sub _get_htdocs_dir
{
   my ($self) = @_;

   my $htdocs;
   my $shared_htdocs = dir( $self->share_dir(), 'htdocs' );

   if ( -d $shared_htdocs )
   {
      $htdocs = $shared_htdocs->stringify();
   }
   else
   {

      my $test_htdocs = dir( curdir, 'share', 'htdocs' );

      if ( -d $test_htdocs )
      {
         $htdocs = $test_htdocs->stringify();
      }
   }
   return $htdocs;
}

=item share_dir

This returns the path to the shared data directory.

=cut

has share_dir  => (
                     is    => 'rw',
                     isa   => 'Str',
                     lazy  => 1,
                     builder  => '_get_share_dir',
                  );

sub _get_share_dir
{
   my ($self) = @_;
   my $share_dir = ".";
   my $blib_share_dir = dir( curdir, 'blib', 'lib', 'auto', 'share', 'dist', 'Emitria' );

   if ( -d $blib_share_dir )
   {
      $share_dir = $blib_share_dir->stringify();
   }
   elsif ( -d dist_dir('Emitria') )
   {
      $share_dir = dist_dir('Emitria');
   }

   return $share_dir;

}

=item config_object

This returns the initialised Config::Tiny created from the C<config_file>

=cut

has config_object => (
                        is => 'ro',
                        isa   => 'Config::Tiny',
                        lazy  => 1,
                        builder  => '_get_config_object',
                     );

sub _get_config_object
{
   my ( $self ) = @_;

   my $conf = Config::Tiny->read($self->config_file());
   return $conf;
}

=item database

This returns the database section of the config.

=cut

has database   => (
                     is => 'ro',
                     isa   => 'HashRef',
                     lazy  => 1,
                     builder  => '_get_database',
                  );

sub _get_database
{
   my ( $self ) = @_;

   return $self->config_object()->{database};
}


=for reference

[database]
host = localhost
dbname = emitria
dbuser = emitria
dbpass = emitria


=cut

=item dbhost

Returns the host from the database (host key)

=cut

has dbhost  => (
                  is => 'ro',
                  isa   => 'Maybe[Str]',
                  lazy  => 1,
                  builder  => '_get_db_host',
               );

sub _get_db_host
{
   my ( $self ) = @_;

   return $self->database()->{host};
}

=item dbname

returns the database name. If not set in the configuration then it defaults to 'emitria.db' to help testing

=cut

has dbname  => (
                  is => 'ro',
                  isa   => 'Maybe[Str]',
                  lazy  => 1,
                  builder  => '_get_db_name',
               );

sub _get_db_name
{
   my ( $self ) = @_;

   my $dbname;

   if(!defined( $dbname = $self->database()->{dbname}))
   {
       $dbname = 'emitria.db';
   }
}

=item dbuser

returns the db user.

=cut

has dbuser  => (
                  is => 'ro',
                  isa   => 'Maybe[Str]',
                  lazy  => 1,
                  builder  => '_get_db_user',
               );

sub _get_db_user
{
   my ( $self ) = @_;

   return $self->database()->{dbuser};
}

=item dbpass

returns the db passsword

=cut

has dbpass  => (
                  is => 'ro',
                  isa   => 'Maybe[Str]',
                  lazy  => 1,
                  builder  => '_get_db_pass',
               );

sub _get_db_pass
{
   my ( $self ) = @_;

   return $self->database()->{dbpass};
}

=item db_dsn

This returns the DSN suitable to connect to the database as defined in the
configuration.

=cut

has db_dsn  => (
                  is => 'ro',
                  isa   => 'Maybe[Str]',
                  lazy  => 1,
                  builder  => '_get_dsn',
               );

sub _get_dsn
{
   my ($self) = @_;

   my $dsn;

   if ( !defined( $dsn = $self->database()->{dsn} ) )
   {

      $dsn = sprintf '%s:dbname=%s', $self->driver(), $self->dbname();

      if ( defined $self->dbhost() && ($self->dbhost() ne 'localhost' ))
      {
         $dsn .= sprintf ':host=s', $self->dbhost();
      }
   }

   return $dsn;
}

=item driver

This is the name of the DBD driver that will be used.  It is not required if the
full DSN is supplied in the configuration.  It defaults to 'dbi:SQLite'.

=cut

has driver  => (
                  is => 'ro',
                  isa   => 'Str',
                  lazy  => 1,
                  builder  => '_get_driver',
               );

sub _get_driver
{
    my ( $self ) = @_;

    my $driver;

    if (!defined($driver = $self->database()->{driver}))
    {
        $driver = 'dbi:SQLite',
    }

    return $driver;
}

=back


=cut

1;

