<?php
namespace MyApp;
use Ratchet\ConnectionInterface;
use Ratchet\Wamp\WampServerInterface;

class Pusher implements WampServerInterface {
     /**
     * A lookup of all the topics clients have subscribed to
     */
    protected $subscribedTopic = array();

    public function onSubscribe(ConnectionInterface $conn, $topic) {
        $this->subscribedTopic[$topic->getId()] = $topic;
    }

    /**
     * @param string JSON'ified string we'll receive from ZeroMQ
     */
    public function onPull($entry) {
        $entryData = json_decode($entry, true);
		if (empty($entryData['topic'])) return false;
        // If the lookup topic object isn't set there is no one to publish to
        if (!array_key_exists($entryData['topic'], $this->subscribedTopic)) {
            return;
        }
        $topic = $this->subscribedTopic[$entryData['topic']];
        // re-send the data to all the clients subscribed to that category
		
        $topic->broadcast($entryData);
    }
	
    public function onUnSubscribe(ConnectionInterface $conn, $topic) {
		var_dump($conn);
    }
    public function onOpen(ConnectionInterface $conn) {
    }
    public function onClose(ConnectionInterface $conn) {
    }
    public function onCall(ConnectionInterface $conn, $id, $topic, array $params) {
        // In this application if clients send data it's because the user hacked around in console
        $conn->callError($id, $topic, 'You are not allowed to make calls')->close();
    }
    public function onPublish(ConnectionInterface $conn, $topic, $event, array $exclude, array $eligible) {
        // In this application if clients send data it's because the user hacked around in console
        $conn->close();
    }
    public function onError(ConnectionInterface $conn, \Exception $e) {
    }
}