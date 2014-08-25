use utf8;
package Emitria::Schema::Result::Session;


=head1 NAME

Emitria::Schema::Result::Session

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 TABLE: C<session>

=cut

__PACKAGE__->table("session");

=head1 ACCESSORS

=head2 sessid

  data_type: 'char'
  is_nullable: 0
  size: 32

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 login

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 ts

  data_type: 'timestamp'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   sessid => {
      data_type   => "char",
      is_nullable => 0,
      size        => 32
   },
   user_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   login => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   ts => {
      data_type   => "timestamp",
      is_nullable => 1
   },
);

=head1 PRIMARY KEY

=over 4

=item * L</sessid>

=back

=cut

__PACKAGE__->set_primary_key("sessid");

=head1 RELATIONS

=head2 user_id

Type: belongs_to

Related object: L<Emitria::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  user =>
  "Emitria::Schema::Result::User",
  { id => "user_id" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta()->make_immutable();

1;
