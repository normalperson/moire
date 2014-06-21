<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'reassign.conf.php');

function defaultReassignTime($col, $colVal, $data=array(), $html=null){
  global $DB;
  //vd($html);
  //dbo_reqverification_edit_js_manrequiretime
  $defminutes = $DB->GetOne("select getreqtimebyjob(".$data['js_id'].",'REASSIGN')");
  $html .= "<script>$('#dbo_reqverification_edit_js_requiretime').val(".$defminutes.");</script>";

  return $html;
}

# customization
function dbo_reassign_customize(&$dbo){
	$dbo->editModifier = 'dbo_reassign_custom_edit';
}

function dbo_reassign_custom_edit($table, $cols, $wheres){
	global $DB,$FLOWDECISION,$REMARK;
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



# final rendering
$dbo->render();
?>