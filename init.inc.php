<?php
require_once(dirname(__FILE__).'/inc/constant.inc.php');
require_once(dirname(__FILE__).'/../../fcore/init.inc.php');
require_once(dirname(__FILE__).'/header.inc.php');
require_once(dirname(__FILE__).'/inc/generalFunc.php');
require_once(dirname(__FILE__).'/inc/appFunc.php');
$User->requireLogin();

global $PUSHSOCKET;
if (class_exists('ZMQContext')) {
	$dsn = "tcp://127.0.0.1:5555";
	$context = new ZMQContext();
	$socket = $context->getSocket(ZMQ::SOCKET_PUSH, 'app pusher');
	$endpoints = $socket->getEndpoints();
	/* Check if the socket is connected */
	if (!in_array($dsn, $endpoints['connect'])) {
		$socket->connect($dsn);
	}
	$PUSHSOCKET = $socket;
}

?>