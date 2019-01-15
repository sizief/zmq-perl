use strict;
use warnings;
use v5.10;
use ZMQ::LibZMQ3;
use ZMQ::Constants qw(ZMQ_REP); 

say "Server is up...";
my $ctxt = zmq_init;
my $socket = zmq_socket( $ctxt, ZMQ_REP);
zmq_bind( $socket, "tcp://127.0.0.1:5555" );

while (1) {
    my $msg = zmq_recvmsg( $socket );
    say "Received Hello";
    sleep 1;
    zmq_sendmsg( $socket, "World" );
}