use utf8;
package Emitria::Schema::Result::Station;


=head1 NAME

Emitria::Schema::Result::Station

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';


__PACKAGE__->load_components(qw(TimeStamp InflateColumn::DateTime PK::Auto));

=head1 DESCRIPTION

A L<DBIx::Class::ResultSource> that describes a "radio station".  This is the top
level object that contains the users, shows, files etc.

=head2 TABLE: C<station>

=cut

__PACKAGE__->table("station");

=head2 METHODS

=over 4

=cut

__PACKAGE__->add_columns(
   id => {
      data_type         => 'integer',
      is_auto_increment => 1,
      is_nullable       => 0,

   },
   name => {
      data_type   => 'varchar',
      length      => 255,
      is_nullable => 0,
   },
   description => {
      data_type   => 'varchar',
      length      => 1024,
      is_nullable => 1,
   },
   date_created => {
      data_type     => 'datetime',
      set_on_create => 1,
      is_nullable   => 0,
   },
   last_modified => {
      data_type     => 'datetime',
      set_on_update => 1,
      set_on_create => 0,
      is_nullable   => 1,
   }
);

__PACKAGE__->set_primary_key('id');

=item users

A relation to the L<Emitria::Schema::Result::User>s for this station

=cut

__PACKAGE__->has_many( users => "Emitria::Schema::Result::User",'station_id', { cascade_copy => 0, cascade_delete => 0 });

=item roles

A relation to the L<Emitria::Schema::Result::Role>s for this station

=cut

__PACKAGE__->has_many( roles => "Emitria::Schema::Result::Role",'station_id', { cascade_copy => 0, cascade_delete => 0 });

=item files

A relation to the L<Emitria::Schema::Result::File>s for this station

=cut

__PACKAGE__->has_many( files => "Emitria::Schema::Result::File",'station_id', { cascade_copy => 0, cascade_delete => 0 });

=item shows

A relation to the L<Emitria::Schema::Result::File>s for this station

=cut

__PACKAGE__->has_many( shows => "Emitria::Schema::Result::Show",'station_id', { cascade_copy => 0, cascade_delete => 0 });

=item music_dirs

A relation to the L<Emitria::Schema::Result::MusicDir>s for this station

=cut

__PACKAGE__->has_many( music_dirs => "Emitria::Schema::Result::MusicDir",'station_id', { cascade_copy => 0, cascade_delete => 0 });


__PACKAGE__->meta()->make_immutable();

=back

=cut


1;


