<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).'/../../init.inc.php');
global $DB, $USER;
// $DB->showsql=1;

// accept only date format YYYY-MM-DD
// if found year 1970-01-01, will reject
function generateMonthlyInvoice($invoiceDate=false){
	global $DB;
	// $DB->showsql=1;
	if($invoiceDate===false){
		$invoiceDate = date('Y-m-01', strtotime('last month'));
	}
	$ret = $DB->getOne("select generatemonthlyinvoice(:0)", array($invoiceDate));
}

$invoiceDate = false;
if(isset($argv) && !empty($argv)){ // command line
	if(isset($argv[1])){
		$invoiceDate = date('Y-m-01', strtotime($argv[1]));
		if($invoiceDate=='1970-01-01') $invoiceDate = false;
	}
}else if($_GET){ // web
	if(isset($_GET['invoicedate'])){
		$invoiceDate = date('Y-m-01', strtotime($_GET['invoicedate']));
		if($invoiceDate=='1970-01-01') $invoiceDate = false;
	}
}
generateMonthlyInvoice($invoiceDate);
?>