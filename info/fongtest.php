<?php
define('ANONYMOUS', true);
require_once('../init.inc.php');
/* $mail = new Email();
// vd($mail); $fromarr['emailadd'], $fromarr['name']
$ret = $mail->sendEmail_bySMTP($fromarr=array('emailadd'=>'noreply@moiregc.com.my', 'name'=>'no-reply-moire'),$replytoarr='',$toaddarr=array(array('emailadd'=>'fong_yeh@hotmail.com', 'name'=>'fong hotmail')),$subject='test 1',$content='test 1 content',$altbody='',$attachmentpath='',$smtpauth=true,$host='moiregc.com.my',$port=25,$username='noreply@moiregc.com.my',$password='User123');
vd($ret); */
		
$mail = new Email();
// vd($mail); $fromarr['emailadd'], $fromarr['name']
$ret = $mail->sendEmail_bySMTP(
	$fromarr=array('emailadd'=>'noreply@moiregc.com.my', 'name'=>'no-reply-moire'),
	$replytoarr='',
	$toaddarr=array(array('emailadd'=>'fong_yeh@hotmail.com', 'name'=>''), array('emailadd'=>'hingyeh@gmail.com', 'name'=>'')),
	$subject='test1',
	$content='contest 1',
	$altbody='',
	$attachmentpath='',
	$smtpauth=true,
	$host='moiregc.com.my',
	$port=25,
	$username='noreply@moiregc.com.my',
	$password='User123');
?>