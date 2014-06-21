<?php 

$dsn = "tcp://127.0.0.1:5555";

  // This is our new stuff
    $context = new ZMQContext();
    $socket = $context->getSocket(ZMQ::SOCKET_PUSH, 'my pusher');
	
	
	$endpoints = $socket->getEndpoints();
var_dump($endpoints);
/* Check if the socket is connected */
if (!in_array($dsn, $endpoints['connect'])) {
    echo "<p>Connecting to $dsn</p>";
    $socket->connect($dsn);
} else {
    echo "<p>Already connected to $dsn</p>";
}
	
	$socket->send(json_encode(array('weeeee')));
	$socket->send(json_encode(array('weeeee')));
	$socket->send(json_encode(array('weeeee')));
	$socket->send(json_encode(array('weeeee')));

// $str = "An example of a long word is: Supercalifragulistic";
// echo wordwrap($str,15,"<br>\n");
?>