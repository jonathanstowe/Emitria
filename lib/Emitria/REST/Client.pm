package Emitria::REST::Client;

use strict;
use warnings;


use Moose;
with qw(
         Emitria::Role::Logger
       );


=head1 NAME

Emitria::REST::Client

=head1 DESCRIPTION

This is a common client for REST calls.

=head1 SYNOPSIS

    my $client = Emitria::REST::Client->new(
                                        base => 'https://foo.service.com/',
                                        content_type => '/x-data-dumpxml',
                                       );

    my $result = $client->get('/rest/application/');


=head2 METHODS

=over 4

=item new

Constructor for the REST Client.  


=cut


=item content_type

Set and get the content type to be used in the headers for each request.

=cut

has content_type  => (
                        is => 'rw',
                        isa   => 'Str',
                        default  => 'application/json',
                     );


=item accept

Set and get the value to be used in the Accept headers for each request.

=cut

has accept  => (
                        is => 'rw',
                        isa   => 'Str',
                        lazy  => 1,
                        builder  => '_get_accept',
                     );

sub _get_accept
{
    my ( $self ) = @_;

    return $self->content_type();
}

=item base

This will form the base of all URIs that are passed to the request
methods, if left empty then a URI with only the path part will be
constructed.

If the URI passed to the request method has a protocol scheme (i.e. is
a complete URL) then this is ignored.

=cut

has base => (
               is => 'rw',
               isa   => 'Maybe[Str]',
            );


=item force_http_10 

=cut

has force_http_10 => (
                        is => 'rw',
                        isa   => 'Bool',
                        default  => 0,
                     );

=item default_headers

set/get headers to act as defautls

=cut


has default_headers  => (
                           is => 'rw',
                           isa   => 'HashRef',
                           default  => sub { {} },
                           auto_deref  => 1,
                           lazy  => 1,
                        );

=item throttle 

Set a throttle time in seconds (and fractions thereof).

=cut

has throttle   => (
                     is => 'rw',
                     isa   => 'Int',
                     default  => 0,
                  );
 

=item ua

Returns a L<LWP::UserAgent>

=cut

has ua   => (
               is => 'rw',
               isa   => 'LWP::UserAgent',
               lazy  => 1,
               builder  => '_get_ua',
            );

sub _get_ua
{
   my ( $self ) = @_;

   require LWP::UserAgent;

   my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0, 
                                              SSL_version => 'SSLv3',
                                              SSL_verify_mode => 0x00});

   return $ua;
}

=back

=head2 REQUEST METHODS

The following methods all have the same interface and only differ in the
HTTP Request method that is used to make the request.  The methods whose
name begins with a '_' return a suitably initialized L<HTTP::Request>
object and those without a '_' actually perform the request and return
the resulting L<HTTP::Response>.

There are several named arguments:

=over 2

=item  url

This is a complete (with schema and host) or partial (just the path part)
URI that is to be used for the request.  If the URI is partial and C<base>
has been defined then the request will be made to the host and scheme
thereof, if the URI supplies a scheme then base is ignored.

=item headers

A HASH reference specifying the headers to be applied to the request as
header name => value pairs.

=item query

A HASH reference containing query parameters to be appended to the URI
as name => value pairs.  This may only be meaningful for GET requests.

=item data

This specifies the encoded data to be sent in the body of the request,
this is only used for PUT and POST requests, for any other methods it
will be ignored.

=back

=over 4


=item _get

Construct a GET request

=cut

=item get

Execute a GET request

=cut

=item _delete

Construct a DELETE request

=cut

=item delete

Execute a DELETE request

=cut

=item _options

Construct a OPTIONS request

=cut

=item options

Execute a OPTIONS request

=cut

=item _put

Construct a PUT request

=cut

=item put

Execute a PUT request

=cut

=item _post

Construct a POST request

=cut

=item post

Execute a POST request

=cut

{
   my @non_data_methods = qw(GET DELETE OPTIONS HEAD);
   foreach my $method (@non_data_methods)
   {

      my $sub          = lc($method);
      my $sub_sub      = "_$sub";
      my $sub_sub_code = sub {
         my ( $self, %args ) = @_;
         my $req = $self->_new_request( $method, %args );
         return $req;
      };

      my $sub_sub_wrapped = Moose::Meta::Method->wrap($sub_sub_code,
                                                     
                                                       name => $sub_sub,
                                                       package_name => __PACKAGE__,
                                                     );
      __PACKAGE__->meta()->add_method($sub_sub, $sub_sub_wrapped);

      my $sub_code = sub {
         my ( $self, @args ) = @_;
         return $self->ua()->request( $self->$sub_sub(@args) );
      };

      my $sub_wrapped = Moose::Meta::Method->wrap($sub_code,
                                                     
                                                       name => $sub,
                                                       package_name => __PACKAGE__,
                                                     );
      __PACKAGE__->meta()->add_method($sub, $sub_wrapped);
   }

   my @data_methods = qw(PUT POST);

   foreach my $method (@data_methods)
   {
      my $sub = lc($method);

      my $sub_sub = "_$sub";

      my $sub_sub_code = sub {
         my ( $self, %args ) = @_;

         my $req = $self->_new_request( $method, %args );

         if ( defined $args{data} )
         {
            $req->content_length(
                                  do { use bytes; length( $args{'data'} ) }
            );
            $req->content( $args{'data'} );
         }
         $self->log_debug( $req->as_string() );
         return $req;
      };

      my $sub_sub_wrapped = Moose::Meta::Method->wrap($sub_sub_code,
                                                     
                                                       name => $sub_sub,
                                                       package_name => __PACKAGE__,
                                                     );
      __PACKAGE__->meta()->add_method($sub_sub, $sub_sub_wrapped);

      my $sub_code = sub {
         my ( $self, @args ) = @_;
         return $self->ua()->request( $self->$sub_sub(@args) );
      };
      my $sub_wrapped = Moose::Meta::Method->wrap($sub_code,
                                                     
                                                       name => $sub,
                                                       package_name => __PACKAGE__,
                                                     );
      __PACKAGE__->meta()->add_method($sub, $sub_wrapped);
   }
}


=item _new_request

Returns a new initialized HTTP::Request object with the specified 
parameters. These will typically be passed through from the parent
method.

=cut

sub _new_request
{
   my ( $self,$method, %args ) = @_;

   if (!exists $args{url} )
   {
       die "No URL provided";
   }

   require URI;
   require HTTP::Request;

   my $uri = URI->new($args{'url'});

   if (!$uri->scheme() && $self->base() )
   {
      $uri = URI->new($self->base());
      $uri->path($args{'url'});
   }

   if ( defined $args{query} )
   {
      $uri->query_form($args{query});
   }

   # Use values already set as headers as the defaults.
   my %default_headers = $self->default_headers();
   foreach my $k (keys(%default_headers)) {
     next if (exists($args{headers}{$k}));
     $args{headers}{$k} = $default_headers{$k}
   }

   my $req = HTTP::Request->new( "$method" => $uri );

   if ($self->force_http_10()) 
   {
     $req->protocol('HTTP/1.0');
   }

   $req->header( $_ => $args{headers}{$_} ) for keys %{ $args{headers} };
   $req->header("Accept-Charset" => "utf-8");
   $req->header("Accept"   => $self->accept());
   $req->content_type( $self->content_type() . '; charset=UTF-8' );

   $self->log_debug($req->as_string());

   return $req;
}


=back

=head1 INHERITS FROM

=over 4

=item L<Emitria::Client|Emitria::Client>

=back

=cut

1;
