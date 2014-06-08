<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'artistsetup.conf.php');

# customization
function dbo_artistsetup_customize(&$dbo){
	$dbo->newModifier = 'dbo_artistsetup_custom_new';
	$dbo->editModifier = 'dbo_artistsetup_custom_edit';
}

function dbo_artistsetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	pr($cols);
	return array('superman');
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_artistsetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

# final rendering
$dbo->render();
?>