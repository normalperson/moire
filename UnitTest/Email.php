<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');
require_once(CORE_DIR.DS.'inc'.DS.'Email.inc.php');		


$mail = new Email();
$mail->sendEmail_bySMTP(
		$fromarr=array('emailadd'=>'noreply@moiregc.com.my', 'name'=>'no-reply-moire'),
		$replytoarr='',
		$toaddarr=array(array('emailadd'=>'esp@phiorion.com', 'name'=>'')),
		$subject='Moire Leave Message',
		$content='Test message',
		$altbody='',
		$attachmentpath='',
		$smtpauth=true,
		$host='moiregc.com.my',
		$port=25,
		$username='noreply@moiregc.com.my',
		$password='User123',
		true
	);


?>
