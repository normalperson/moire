<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'customeracceptance.conf.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');

# customization
function dbo_customeracceptance_customize(&$dbo){
	global $USER,$DB;
	$dbo->editModifier = 'dbo_customeracceptance_custom_edit';
	$dbo->cols['js_decision']->option->default = 'Accept
		Revert';
	/*$sql = "select case when org_created < now() - interval '3 months' then 0 else 1 end
			from fcorg
			where org_id = :0";
	$allowrevert = $DB->GetOne($sql,array($USER->orgid), PDO::FETCH_ASSOC);
	if($allowrevert){
			$dbo->cols['js_decision']->option->default = 'Accept
		Revert';
	}else{
			$dbo->cols['js_decision']->option->default = 'Accept';
	}*/

}

function dbo_customeracceptance_custom_edit($table, $cols, $wheres){
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
		if ($attachment) {
			// upload the the right place...
			$doc = new DocumentManager();
			$ok = $doc->saveMultipleFile($attachment,$jobid,'js_id','Customer reverted artwork');
		}
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
<script type="text/javascript">
$( document ).ready(function() {
	$('#dbo_customeracceptance_edit_js_decision').change(function(){
		if( $.trim($(this).val()) == 'Revert'){
			console.log($('[name='+escapeSelectorStr('dbo_customeracceptance_edit_js_custrejectreason[]')+']'));
	    	$('[name='+escapeSelectorStr('dbo_customeracceptance_edit_js_custrejectreason[]')+']').removeAttr("disabled");
	    	$('#dbo_customeracceptance_edit_remark').removeAttr("disabled");
	    	$('#dbo_customeracceptance_edit_artwork').trigger('enable');

	    }else{    	
	    	console.log('inside else');
	    	$('#dbo_customeracceptance_edit_artwork').trigger('disable');
	    	$('[name='+escapeSelectorStr('dbo_customeracceptance_edit_js_custrejectreason[]')+']').prop("disabled", true);
	    	$('#dbo_customeracceptance_edit_remark').prop("disabled", true);
	    }
	});
    
});
	
</script>
