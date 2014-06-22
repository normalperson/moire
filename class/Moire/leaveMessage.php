<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).'/../../init.inc.php');

// pr($_GET);
// pr($_POST);
// die('sss');
echo json_encode(array(1));
$emailSettingRS = $DB->getArray("select set_code, set_val from fcsetting where set_code in ('EMAILHOST', 'EMAILPORT', 'EMAILUSERNAME', 'EMAILPASSWORD')");
$emailSetting = array();
if($emailSettingRS){
	foreach($emailSettingRS as $row){
		$emailSetting[$row['set_code']] = $row['set_val'];
	}
	$mail = new Email();
	// vd($mail); $fromarr['emailadd'], $fromarr['name']
	$ret = $mail->sendEmail_bySMTP(
		$fromarr=array('emailadd'=>'noreply@moiregc.com.my', 'name'=>'no-reply-moire'),
		$replytoarr='',
		$toaddarr=array(array('emailadd'=>'noreply@moiregc.com.my', 'name'=>'')),
		$subject='Moire Leave Message',
		$content=$_POST['message'],
		$altbody='',
		$attachmentpath='',
		$smtpauth=true,
		$host=$emailSetting['EMAILHOST'],
		$port=$emailSetting['EMAILPORT'],
		$username=$emailSetting['EMAILUSERNAME'],
		$password=$emailSetting['EMAILPASSWORD']);
}
?>