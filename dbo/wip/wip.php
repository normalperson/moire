<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'wip.conf.php');

# customization
function dbo_wip_customize(&$dbo){
	$dbo->editModifier = 'dbo_wip_custom_edit';
}


function dbo_wip_custom_edit($table, $cols, $wheres){
	global $DB,$REMARK,$FLOWDECISION;
	$ret = array();
	unset($cols['artwork']);
	$REMARK = $cols['remark'];
	unset($cols['remark']);
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
		$FLOWDECISION = false;
	}else{
		$FLOWDECISION = true;
	}
	return $ret;
}


# final rendering
$dbo->render();
?>
