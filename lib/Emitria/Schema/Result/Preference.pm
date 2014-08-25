use utf8;
package Emitria::Schema::Result::Preference;


=head1 NAME

Emitria::Schema::Result::Preference

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

=head1 TABLE: C<preference>

=cut

__PACKAGE__->table("preference");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 keystr

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 valstr

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => "integer",
      is_auto_increment => 1,
      is_nullable       => 0,
   },
   user_id => {
      data_type      => "integer",
      is_foreign_key => 1,
      is_nullable    => 1
   },
   keystr => {
      data_type   => "varchar",
      is_nullable => 1,
      size        => 255
   },
   valstr => { 
      data_type => "text", 
      is_nullable => 1 
   },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<pref_user_key_idx>

=over 4

=item * L</user_id>

=item * L</keystr>

=back

=cut

__PACKAGE__->add_unique_constraint("pref_user_key_idx", ["user_id", "keystr"]);

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




__PACKAGE__->meta->make_immutable;

1;
