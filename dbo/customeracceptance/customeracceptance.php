<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'customeracceptance.conf.php');

# customization
function dbo_customeracceptance_customize(&$dbo){
	$dbo->editModifier = 'dbo_customeracceptance_custom_edit';
}

function dbo_customeracceptance_custom_edit($table, $cols, $wheres){
	global $DB,$REMARK, $FLOWDECISION;
	$ret = array();
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

function downloadlink($colname,$colval,$rowinfo){
	$ret = "<a href='#'><span class='glyphicon glyphicon-download-alt'></span>Download</a>";

	return $ret;
}

# final rendering
$dbo->render();
?>
