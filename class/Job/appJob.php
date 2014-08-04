<?php
define('ANONYMOUS', true);
include(dirname(__FILE__).'/../../init.inc.php');

function genRptCallSummary() { // temp
	global $DB;
	// get yesterday date
	$yesterday = date('Y-m-d',strtotime("-1 days"));
	echo 'yesterday = '.$yesterday.'<br>';

	$sql = "select gendailycallsummary('".$yesterday."')";
	$ok = $DB->Execute($sql);

	// if not ok insert log
}

echo "------------------- ".date('Y-m-d H:i:s')."------------------------<br\>\n";
genRptCallSummary();
echo "-------------------------------------------------------------------<br\>\n\n";
?>
