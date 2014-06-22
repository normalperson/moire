<?php
define('ANONYMOUS', true);
include(dirname(__FILE__).'/../../init.inc.php');

function runAllTimer() { // temp
	global $DB;
	$DB->showSQL=true;
	$dueArr = $DB->getArray("select * from fcpmcaseflow where pmf_end_date is null and pmf_timer_due_date <= now()");
	foreach($dueArr as $d) {
		$case = new PM_Case($d['pmf_pmcid']);
		$case->performFlow($d['pmf_id'], false, true);
	}
}
runAllTimer();
?>