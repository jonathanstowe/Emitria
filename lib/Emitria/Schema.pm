use utf8;
package Emitria::Schema;


use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

=head1 NAME

Emitria::Schema

=head1 DESCRIPTION

L<DBIx::Class::Schema> sub-class for L<Emitria> storage.

=cut

__PACKAGE__->load_namespaces();




__PACKAGE__->meta()->make_immutable(inline_constructor => 0);

1;
