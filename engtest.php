<?php
$data = array(
				'js_status'=>'CANCELLED',
				'js_decision'=>'Cancel',
			);
$cremark = array('js_cancelremark' => '1234');
$data = array_merge($data, $cremark);

var_dump($data);
?>