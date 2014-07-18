<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'customeracceptance.conf.php');

# customization
function dbo_customeracceptance_customize(&$dbo){
	global $USER,$DB;
	$dbo->editModifier = 'dbo_customeracceptance_custom_edit';
	$sql = "select case when org_created < now() - interval '3 months' then 0 else 1 end
			from fcorg
			where org_id = :0";
	$allowrevert = $DB->GetOne($sql,array($USER->orgid), PDO::FETCH_ASSOC);
	if($allowrevert){
			$dbo->cols['js_decision']->option->default = 'Accept
		Revert';
	}else{
			$dbo->cols['js_decision']->option->default = 'Accept';
	}

}

function dbo_customeracceptance_custom_edit($table, $cols, $wheres){
	global $DB,$REMARK, $FLOWDECISION;
	$ret = array();
	$REMARK = $cols['remark'];
	unset($cols['remark']);
	
	if ($cols['js_decision'] == 'Accept') {
		$cols['js_status'] = 'COMPLETED';
		$cols['js_completiondate'] = $DB->GetOne("select now()");
	}
	else {
		$cols['js_status'] = 'REQUIREMENT VERIFICATION';		
	}
	
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
