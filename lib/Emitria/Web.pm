package Emitria::Web;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

use Catalyst qw(
    -Debug
    ConfigLoader
    Static::Simple
    StackTrace
    Authentication
    Session
    Session::Store::File
    Session::State::Cookie
   );

extends 'Catalyst';

use Emitria;

our $VERSION = '0.01';


my $e = Emitria->new();

__PACKAGE__->config(
    name => 'Emitria::Web',
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, 
    'Model::DB' => {
        connect_info => $e->connect_info(),
    },
   'Plugin::Authentication' => {
        default => {
            class           => 'SimpleDB',
            user_model      => 'DB::User',
            password_type   => 'self_check',
        },
    },
);

# Start the application
__PACKAGE__->setup();


=head1 NAME

Emitria::Web - Catalyst based application

=head1 SYNOPSIS

    script/emitria_web_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Emitria::Web::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Jonathan Stowe

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
