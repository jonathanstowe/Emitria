use utf8;
package Emitria::Schema::Result::Perm;


=head1 NAME

Emitria::Schema::Result::Perm

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

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<perms>

=cut

__PACKAGE__->table("perms");

=head1 ACCESSORS

=head2 permid

  data_type: 'integer'
  is_nullable: 0

=head2 subj

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 action

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 obj

  data_type: 'integer'
  is_nullable: 1

=head2 type

  data_type: 'char'
  is_nullable: 1
  size: 1

=cut

__PACKAGE__->add_columns(
  "permid",
  { data_type => "integer", is_nullable => 0 },
  "subj",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "action",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "obj",
  { data_type => "integer", is_nullable => 1 },
  "type",
  { data_type => "char", is_nullable => 1, size => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</permid>

=back

=cut

__PACKAGE__->set_primary_key("permid");

=head1 UNIQUE CONSTRAINTS

=head2 C<perms_all_idx>

=over 4

=item * L</subj>

=item * L</action>

=item * L</obj>

=back

=cut

__PACKAGE__->add_unique_constraint("perms_all_idx", ["subj", "action", "obj"]);

=head1 RELATIONS

=head2 subj

Type: belongs_to

Related object: L<Emitria::Schema::Result::Subj>

=cut

__PACKAGE__->belongs_to(
  "subj",
  "Emitria::Schema::Result::Subj",
  { id => "subj" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);




__PACKAGE__->meta->make_immutable;
1;
