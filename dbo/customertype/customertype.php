<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'customertype.conf.php');

$dbo->newModifier = 'dbo_customertype_custom_new';
function dbo_customertype_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$cols['lu_cat'] = 'CUSTYPE';
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}
# customization
function dbo_customertype_customize(&$dbo){
}


# final rendering
$dbo->render();
?>