use utf8;
package Emitria::Schema::Result::UserToken;


=head1 NAME

Emitria::Schema::Result::UserToken

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

=head1 TABLE: C<user_token>

=cut

__PACKAGE__->table("user_token");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 action

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 token

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 created

  data_type: 'timestamp'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
  },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "action",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "token",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "created",
  { data_type => "timestamp", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<user_token_idx>

=over 4

=item * L</token>

=back

=cut

__PACKAGE__->add_unique_constraint("user_token_idx", ["token"]);

=head1 RELATIONS

=head2 user

Type: belongs_to

Related object: L<Emitria::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Emitria::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "NO ACTION" },
);




__PACKAGE__->meta->make_immutable;

1;
