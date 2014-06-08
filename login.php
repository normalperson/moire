<?php
define('ANONYMOUS', true);
define('LOGINPAGE', true);
require_once(dirname(__FILE__).'/init.inc.php');

if(!empty($_POST['username'])){
	$ok = $User->login($_POST['username'], $_POST['password']);
	if($ok){
		// $url = isset($GLOBAL['urlbeforelogin'])&&!empty($GLOBAL['urlbeforelogin'])?$GLOBAL['urlbeforelogin']:'index.php';
		if (isset($GLOBAL['urlbeforelogin'])) unset($GLOBAL['urlbeforelogin']);
		$url = 'index.php';
		redirect($url);
	}
}else if(!empty($_POST['mulsess'])){
	$User->chooseSession($_POST['mulsess']);
}else if(isset($_GET['logout'])){
	$User->logout();
}

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