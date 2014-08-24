Emitria
=======

Emitria is a software platform for the management of an internet radio station,  it is inspired by the excellent Airtime http://airtime.sourcefabric.org/.

In summary it provides the means for managing a radio schedule, managing the media that is to be played on the station and causing that media to be streamed to the network.

Under the hood it relies on two tried and tested software applications for performing the streaming:


*	Icecast2 <http://icecast.org> - the de facto standard for open source streaming servers with virtually universal client support
*	Liquidsoap <http://liquidsoap.fm/> - a rock solid middleware for providing streams to an icecast server, managing multiple input streams (files, playlists live streams etc) and transcoding them as multiple format streams to the icecast server.

The high level design goals for this application are:

*	Provide a higher degree of cross-platform compatibility (Airtime targets debian nicely, other Linux reasonably well, other OS not well at all.)
*	Reduce the application complexity by using fewer different implementation technologies (this is written in Perl, whereas Airtime is in PHP and Python.)
*	Allowing a greater degree of choice of database used for storage (Airtime exclusively uses PostgresSQL whereas this will use the Perl DBI allowing most supported databases to used.

Beyond that the architecture will be fairly similar at a high level to Airtime:

*	A web part providing the management console and services for access to the schedule by 3rd party software
*	A media management part to deal with incoming media files
*	A playout engine to manage the scheduling of the playout and the control of the liquidsoap daemon.


		
