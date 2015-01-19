<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'clientorg.conf.php');

# customization
function dbo_clientorg_customize(&$dbo){
	$dbo->newModifier = 'dbo_clientorg_custom_new';
	$dbo->editModifier = 'dbo_clientorg_custom_edit';
}

function dbo_clientorg_custom_new($table, $cols){
	global $DB,$USER;
	$ret = array();
	$custtype = $cols['tp_customertype'];
	unset($cols['tp_customertype']);
	if(count($ret) > 0) return $ret;
	
	// get the parent id	
	$cols['org_parentid'] = userTopOrgID();
	$ok = $DB->doInsert($table, $cols);
	$orgid = $DB->lastInsertId('fcorg_org_id_seq');
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
		$sql = "insert into mcustomertype(tp_orgid,tp_customertype) values (:0,:1);";
		$DB->execute($sql,array($orgid,$custtype));
	}
	return $ret;
}

function dbo_clientorg_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$org_id = $wheres['org_id'];
	$custtype = $cols['tp_customertype'];

	unset($cols['tp_customertype']);
	
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}else{
		$sql = "update mcustomertype set tp_customertype = :0 where tp_orgid = :1";
		$DB->execute($sql,array($custtype,$org_id));
	}
	return $ret;
}

// add filter only see current org data
global $USER;

if($USER->userid != 'admin'){
	$dbo->sql = "select * from fcorg where org_id = '".$USER->orgid."' or org_parentid = '".userTopOrgID()."'";
}

# final rendering
$dbo->render();
?>