use utf8;
package Emitria::Schema::Result::Permission;


=head1 NAME

Emitria::Schema::Result::Permission

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

L<DBIx::Class::ResultSource>

=head2 TABLE: C<permission>

=cut

__PACKAGE__->table("permssion");

=head2 METHODS

=over 4

=item permid

  data_type: 'integer'
  is_nullable: 0

=item user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item action

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=item obj

  data_type: 'integer'
  is_nullable: 1

=item type

  data_type: 'char'
  is_nullable: 1
  size: 1

=cut

__PACKAGE__->add_columns(
   permid => {
      data_type   => "integer",
      is_nullable => 0
   },
   user_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   action => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 20
   },
   obj => {
      data_type   => "integer",
      is_nullable => 1
   },
   type => {
      data_type   => "char",
      is_nullable => 1,
      size        => 1
   },
);

=back

=head2 PRIMARY KEY

=over 4

=item * L</permid>

=back

=cut

__PACKAGE__->set_primary_key("permid");


=head2 UNIQUE CONSTRAINTS

=over 4


=item C<perms_all_idx>

=over 4

=item * L</user>

=item * L</action>

=item * L</obj>

=back

=cut

__PACKAGE__->add_unique_constraint("perms_all_idx", ["user_id", "action", "obj"]);

=back

=head2 RELATIONS

=over 4


=item user

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
