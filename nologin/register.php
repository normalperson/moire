<?php
define('ANONYMOUS', true); // define do not require login
include_once('../init.inc.php');
global $HTML,$DB;
$HTML->showPageTime = false;

html_header('header.nh.html');
/*function showMemberDBO() {
	if (empty($_GET['dboid']) && empty($_GET['dbostate'])) {
		$_GET['dboid'] = "membership";
		$_GET['dbostate'] = "new";
	}
	$dbo = dbo_include("membership");
	if ($dbo->currState != 'new') {
		redirect(APP_HREF);
	}
}
*/
if ($_GET['dbostate'] == 'list') redirect("/".APP);
$dbo = dbo_include("register");

		

?>
