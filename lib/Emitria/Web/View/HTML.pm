package Emitria::Web::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    PROCESS => 'html.tt',
    render_die => 1,
);

=head1 NAME

Emitria::Web::View::HTML - TT View for Emitria::Web

=head1 DESCRIPTION

TT View for Emitria::Web.

=head1 SEE ALSO

L<Emitria::Web>

=head1 AUTHOR

Jonathan Stowe

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
