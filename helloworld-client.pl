use strict;
use warnings;
use v5.10;
use ZMQ::LibZMQ3;
use ZMQ::Constants qw(ZMQ_REQ); 

say "Connecting to hello world server…";
my $ctxt = zmq_init;
my $socket = zmq_socket( $ctxt, ZMQ_REQ);
zmq_bind( $socket, "tcp://127.0.0.1:5555" );

for my $request_nbr (0..9) {
    say "Sending Hello $request_nbr…";
    zmq_sendmsg( $socket, "Hello" );
    my $msg = zmq_recvmsg( $socket );
    say "Received $msg $request_nbr";
}