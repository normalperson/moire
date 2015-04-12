<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).'/../../init.inc.php');
global $DB, $USER;
// $DB->showsql=1;

// accept only date format YYYY-MM-DD
// if found year 1970-01-01, will reject
function generateInvoice($invoiceDate=false, $orgid=false){
	global $DB;
	// $DB->showsql=1;
	if($invoiceDate===false){
		$invoiceDate = date('Y-m-01', strtotime('last month'));
	}
	$startDate = date('Y-m-01', strtotime($invoiceDate));
	$endDate = date('Y-m-t', strtotime($invoiceDate));
	if($startDate=='1970-01-01' || $endDate=='1970-01-01'){
		echo 'generateInvoice Failed! 1970-01-01?';
		return false;
	}
	$DB->execute("delete from minvoice where iv_invoicedate = :0", array($startDate));
	$bindArr = $whereArr = array();
	$whereArr[] = "js_completiondate between :0 and :1";
	$bindArr[] = $startDate;
	$bindArr[] = $endDate;
	if($orgid){
		$whereArr[] = "js_orgid = :".count($bindArr);
		$bindArr[] = $orgid;
	}
	$whereSQL = implode(" and ", $whereArr);
	$DB->execute("insert into minvoice (iv_invoicedate, iv_orgid, iv_amount) 
select date_trunc('month', js_completiondate), js_orgid, sum(js_price) from mjobsheet where ".$whereSQL."
group by js_orgid, date_trunc('month', js_completiondate)", $bindArr);
}
$invoiceDate = false;
$orgid = false;
if(isset($argv) && !empty($argv)){ // command line
	if(isset($argv[1])){
		$invoiceDate = date('Y-m-01', strtotime($argv[1]));
		if($invoiceDate=='1970-01-01') $invoiceDate = false;
	}
	if(isset($argv[2]) && is_numeric($argv[2]) && strpos($argv[2], '.')===false){
		$orgid = $argv[2];
	}
}else if($_GET){ // web
	if(isset($_GET['invoicedate'])){
		$invoiceDate = date('Y-m-01', strtotime($_GET['invoicedate']));
		if($invoiceDate=='1970-01-01') $invoiceDate = false;
	}
	if(isset($_GET['orgid']) && is_numeric($_GET['orgid']) && strpos($_GET['orgid'], '.')===false){
		$orgid = $_GET['orgid'];
	}
}
generateInvoice($invoiceDate, $orgid);
?>