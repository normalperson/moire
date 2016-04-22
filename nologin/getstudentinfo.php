<?php
define('ANONYMOUS', true); // define do not require login
include_once('../init.inc.php');

global $DB;

if(isset($_POST['studentid']) && $_POST['studentid']!= ''){
	$sql = "select shuserextrainfo.*, to_char(eif_enrolldate,'DD-MON-YYYY') as eif_enrolldate from shuserextrainfo where eif_studentid = :0";
	$stinfo = $DB->GetArray($sql,array($_POST['studentid']),PDO::FETCH_ASSOC);
	echo json_encode($stinfo);
	sleep(1);
}
?>
