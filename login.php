<?php
define('ANONYMOUS', true);
define('LOGINPAGE', true);
require_once(dirname(__FILE__).'/init.inc.php');
$loginMessage = '';
if(!empty($_POST['username'])){
	$ok = $User->login($_POST['username'], $_POST['password']);
	if(function_exists('login_after_function')){
		login_after_function($ok);
	}
	if($ok){
		// $url = isset($GLOBAL['urlbeforelogin'])&&!empty($GLOBAL['urlbeforelogin'])?$GLOBAL['urlbeforelogin']:'index.php';
		if (isset($GLOBAL['urlbeforelogin'])) unset($GLOBAL['urlbeforelogin']);
		$url = 'index.php';
		redirect($url);
	}else{
		$loginMessage = $User->loginFailMessage;
	}
}else if(!empty($_POST['mulsess'])){
	$User->chooseSession($_POST['mulsess']);
}else if(isset($_GET['logout'])){
	$User->logout();
}else if(isset($_GET['forgot'])){
	$User->loginForm = 'forgot.html';
	if(!empty($_POST['forgotemail'])){
		$userid = $DB->getOne("select usr_userid from ".$DB->prefix."user where usr_email = :0", array($_POST['forgotemail']));
		if($userid){
			$newpassword = randomString(8);
			$DB->execute("update ".$DB->prefix."user set usr_password = :0 where usr_userid = :1", array($User->genPassword($newpassword), $userid));			
			
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
					$toaddarr=array(array('emailadd'=>$_POST['forgotemail'], 'name'=>'')),
					$subject='Moire Reset Password',
					$content='Password reset on request!<br />
					New password : '.$newpassword.'<br />
					Please change your password once you login!',
					$altbody='',
					$attachmentpath='',
					$smtpauth=true,
					$host=$emailSetting['EMAILHOST'],
					$port=$emailSetting['EMAILPORT'],
					$username=$emailSetting['EMAILUSERNAME'],
					$password=$emailSetting['EMAILPASSWORD']);
			}

			// mail($_POST['forgotemail'], "New password for PND", "New password : ".$newpassword, "From: pndhelpdesk@pnd.com");
			// pr(array($_POST['forgotemail'], "New password for PND", "New password : ".$newpassword));
			$loginMessage = 'Password reset. Please check email for new password.';
		}else{
			$loginMessage = 'User not found!';
		}
	}
}
$User->smarty->assign('loginMessage', $loginMessage);

// html_header();
// read login message from C:\vpos\smarty\template\loginMessage.txt
$filename = dirname(__FILE__)."/smarty/templates/loginMessage.txt";
$handle = fopen($filename, "r");
$contents = fread($handle, filesize($filename));
fclose($handle);

$User->smarty->assign('year', date('Y'));
$User->smarty->assign('contents', $contents);
$User->smarty->display($User->loginForm);
?>