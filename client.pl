#!/usr/bin/perl

# This code was originally the client code given in the Perl Socket manpage.

use strict;
use warnings;
use IO::Socket;

my ($host, $port, $kidpid, $handle, $line);

$host = "localhost";
$port = 9020;
$/= "\015\012";

# create a tcp connection to the specified host and port
$handle = IO::Socket::INET->new(
    Proto => "tcp",
    PeerAddr  => $host,
    PeerPort  => $port
)
|| die "can't connect to port $port on $host: $!";

$handle->autoflush(1); # so output gets there right away

print STDERR "[Connected to $host:$port]\n";

# split the program into two processes, identical twins
die "can't fork: $!" unless defined($kidpid = fork());

# the if{} block runs only in the parent process
if ( $kidpid )
{
    # copy the socket to standard output
    while ( defined($line = <$handle>) )
    {
        print STDOUT $line;
    }
    
    kill("TERM", $kidpid); # send SIGTERM to child
}
else # the else{} block runs only in the child process
{
    # copy standard input to the socket
    while ( defined($line = <STDIN>) )
    {
        print $handle $line;
    }
    
    exit(0); # just in case
}
