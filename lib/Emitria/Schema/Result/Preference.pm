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


__PACKAGE__->load_components(qw(InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

L<DBIx::Class::ResultSource>

=head2 TABLE: C<preference>

=cut

__PACKAGE__->table("preference");

=head2 METHODS

=over 4

=item id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=item user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=item keystr

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=item valstr

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

=back

=head2 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


=head2 UNIQUE CONSTRAINTS

=over 4


=item C<pref_user_key_idx>

=over 4

=item * L</user_id>

=item * L</keystr>

=back

=cut

__PACKAGE__->add_unique_constraint("pref_user_key_idx", ["user_id", "keystr"]);

=back

=head2 RELATIONS

=over 4


=item user_id

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

=back

=cut



__PACKAGE__->meta()->make_immutable();

1;
