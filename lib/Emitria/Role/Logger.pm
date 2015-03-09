package Emitria::Role::Logger;

use strict;
use warnings;
 
use Moose::Role;
with qw(
         Emitria::Role::ShareDir
       );

use Path::Class;
use File::Spec::Functions qw(curdir);

=head1 NAME

Emitria::Role::Logger

=head1 DESCRIPTION

Logging abstraction.

=head2 METHODS

All of these but C<log> are delegates of C<log>

=over 4

=item log

This is a L<Log::Log4perl::Logger>

=cut

has log  => (
               is => 'rw',
               isa   => 'Log::Log4perl::Logger',
               lazy  => 1,
               builder  => '_get_logger',
               handles  => {
                   log_debug  => 'debug',
                   log_info   => 'info',
                   log_warn   => 'warn',
                   log_error  => 'error',
                   log_fatal  => 'fatal',
                   log_level  => 'level',
               },
            );

sub _get_logger
{
    my ( $self ) = @_;

    require Log::Log4perl;
    Log::Log4perl->init_once($self->logger_config());

    my $logger = Log::Log4perl->get_logger();

    return $logger;
}


=item logger_config

This is the default l4j configuration file for emitria.

=cut

has logger_config => (
                        is    => 'rw',
                        isa   => 'Str',
                        lazy  => 1,
                        builder  => '_get_logger_config',
                     );

sub _get_logger_config
{
    my ( $self ) = @_;

    my $file;

    my $test_config =  file(curdir, 't', 'etc', 'emitria_logger.conf');

    if ( -f $test_config )
    {
        $file = $test_config->stringify();
    }
    elsif ( exists $ENV{EMITRIA_LOGGER_CONFIG} && -f $ENV{EMITRIA_LOGGER_CONFIG} )
    {
        $file = $ENV{EMITRIA_LOGGER_CONFIG};
    }
    else
    {
        my $share_file = file($self->share_dir(), 'etc', 'emitria_logger.conf'); 

        if ( -f $share_file )
        {
            $file = $share_file->stringify();
        }
    }

    return $file;
}

=back

=cut

1;
