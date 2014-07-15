<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'currencysetup.conf.php');

# customization
function dbo_currencysetup_customize(&$dbo){
	$dbo->editModifier = 'dbo_currencysetup_custom_edit';
}

function dbo_currencysetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdateAudit($table, $cols, $wheres, array('cr_rate'));
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

# final rendering
$dbo->render();
?>