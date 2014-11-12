<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'pendingQC.conf.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');

# customization
function dbo_pendingQC_customize(&$dbo){
	$dbo->editModifier = 'dbo_pendingQC_custom_edit';
}

function dbo_pendingQC_custom_edit($table, $cols, $wheres){
	global $DB,$REMARK, $FLOWDECISION;
	$ret = array();
	$jobid = $wheres["js_id"];
	$REMARK = $cols['remark'];
	unset($cols['remark']);

	if(!empty($cols['artwork']['name'])) {
		/*$ret = "Attachement cannot be empty";
		return $ret;*/
		unset($cols['artwork']);
	}
	else{
		$attachment = json_decode($cols['artwork'],true);
		// validate rar or zip format
		unset($cols['artwork']); 
	}

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
		// upload the the right place...
		$doc = new DocumentManager();
		$ok = $doc->saveMultipleFile($attachment,$jobid,'js_id','QC artwork done');
		$FLOWDECISION = true;

	}
	return $ret;
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
if( $('#dbo_pendingQC_edit_js_decision').val() != 'Revert' ){
	// dropzone-dbo_pendingQC_edit_artwork mandatory
}
</script>