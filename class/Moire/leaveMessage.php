<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).'/../../init.inc.php');

// pr($_GET);
// pr($_POST);
// die('sss');
echo json_encode(array(1));
$sql = "select ms_hostname,ms_port,ms_username,ms_password from fcemailsetting
		where ms_hostname = :0";
$emailSetting = $DB->GetRow($sql,array('202.190.181.92'), PDO::FETCH_ASSOC);
if(!empty($emailSetting)){
	$mail = new Email();
	// vd($mail); $fromarr['emailadd'], $fromarr['name']
	// need to add header
	// create the content
	extract($_POST);
	$contenthtml = "<p>Name:$name</p>
					<p>Email:$email</p>
					<p>Message:$message</p>
	               ";
	$ret = $mail->sendEmail_bySMTP(
		$fromarr=array('emailadd'=>'noreply@moiregc.com.my', 'name'=>'no-reply-moire'),
		$replytoarr='',
		$toaddarr=array( array('emailadd'=>'support@moiregc.com.my', 'name'=>'') ),
		$subject='Moire Leave Message',	
		$content=$contenthtml,
		$altbody='',
		$attachmentpath='',
		$smtpauth=true,
		$host=$emailSetting['ms_hostname'],
		$port=$emailSetting['ms_port'],
		$username=$emailSetting['ms_username'],
		$password=$emailSetting['ms_password']);
}
?>