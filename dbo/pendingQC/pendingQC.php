<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'pendingQC.conf.php');

# customization
function dbo_pendingQC_customize(&$dbo){
	$dbo->editModifier = 'dbo_pendingQC_custom_edit';
}

function dbo_pendingQC_custom_edit($table, $cols, $wheres){
	global $DB,$REMARK, $FLOWDECISION;
	$ret = array();

	$REMARK = $cols['remark'];
	unset($cols['remark']);


	if($cols['js_decision'] == 'Forward to Customer'){
		$cols['js_status'] = 'PENDING ACCEPTANCE';
	}else{
		$cols['js_status'] = 'WORK IN PROGRESS';
	}

	$cols['js_forwardtocusttime'] = $DB->GetOne("select now()");

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
