#!/usr/bin/perl -T

# This code was originally the (non-threaded) IO::Socket server code given in the Perl Socket manpage.

use strict;
use warnings;
use IO::Socket;
use Net::hostent; # for OOish version of gethostbyaddr

$/ = "\015\012";

my $PORT = 9020; # pick something not in use
my $server = IO::Socket::INET->new(
    Proto     => "tcp",
    LocalPort => $PORT,
    Listen    => 10,
    Reuse     => 1
);
die "can't setup server: $!\n" unless $server;

print "[Server $0 accepting clients]\n";

my $user = "<user>"; # no user currently defined
print "1\n";
while ( my $client = $server->accept() )
{
    print "2\n";
    $client->autoflush(1);
    
    print $client "3\n";
    print $client "Welcome to Colby's chat room\n";
    
    my $hostinfo = gethostbyaddr($client->peeraddr);
    printf "[Connect from %s]\n", $hostinfo ? $hostinfo->name : $client->peerhost;
    
    print $client "$user: ";
    
    while ( <$client> )
    {
        next unless /\S/; # EOL
        # next unless /\r\n$/; # EOL
        
        # chomp($_);
        print $_ . "\n";
        if ( /^adios$/i )
        {
            last;
        }
        elsif ( /^date|time$/i )
        {
            printf $client "%s\n", scalar localtime();
        }
        elsif ( /^who$/i )
        {
            print $client "$_\n";
        }
        elsif ( /^cookie$/i )
        {
            print $client "$_\n";
        }
        elsif ( /^motd$/i )
        {
            print $client "$_\n";
        }
        elsif ( /^help$/i )
        {
            print $client "Commands: quit date who cookie motd\n";
        }
        else
        {
            print $client "Error: unrecognized command: $_\n";
        }
    }
    continue
    {
        print $client "$user: ";
    }
    
    close $client;
}
