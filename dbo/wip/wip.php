<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'wip.conf.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');

# customization
function dbo_wip_customize(&$dbo){
	$dbo->editModifier = 'dbo_wip_custom_edit';
}


function dbo_wip_custom_edit($table, $cols, $wheres){
	global $DB,$REMARK,$FLOWDECISION;
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
	$cols['js_status'] = 'PENDING QC CHECK';
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
		$FLOWDECISION = false;
	}else{		
		// upload the the right place...
		$doc = new DocumentManager();
		$ok = $doc->saveMultipleFile($attachment,$jobid,'js_id','Artwork job done');
		$FLOWDECISION = true;		
	}
	return $ret;
}


# final rendering
$dbo->render();
?>
<script type="text/javascript">
	$('#dbo_wip_edit_js_width').rules("add", { number:true});	 // validation
	$('#dbo_wip_edit_js_height').rules("add", { number:true});	 // validation

</script>