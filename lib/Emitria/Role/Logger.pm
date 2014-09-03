package Emitria::Role::Logger;

use strict;
use warnings;
 
use Moose::Role;

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
    Log::Log4perl->init_once(\<<EIEIO);
log4perl.logger = FATAL, Screen
log4perl.appender.Screen   = Log::Log4perl::Appender::Screen
log4perl.appender.Screen.layout = SimpleLayout
EIEIO

    my $logger = Log::Log4perl->get_logger();

    return $logger;
}

=back

=cut

1;
