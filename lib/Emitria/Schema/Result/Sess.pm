use utf8;
package Emitria::Schema::Result::Sess;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Emitria::Schema::Result::Sess

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

=head1 TABLE: C<sess>

=cut

__PACKAGE__->table("sess");

=head1 ACCESSORS

=head2 sessid

  data_type: 'char'
  is_nullable: 0
  size: 32

=head2 userid

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
  "sessid",
  { data_type => "char", is_nullable => 0, size => 32 },
  "userid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "login",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "ts",
  { data_type => "timestamp", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</sessid>

=back

=cut

__PACKAGE__->set_primary_key("sessid");

=head1 RELATIONS

=head2 userid

Type: belongs_to

Related object: L<Emitria::Schema::Result::Subj>

=cut

__PACKAGE__->belongs_to(
  "userid",
  "Emitria::Schema::Result::Subj",
  { id => "userid" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2013-12-30 17:33:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zE6GDW89ENFTC/HbV+k6TQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
