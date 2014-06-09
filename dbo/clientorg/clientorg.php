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

	if(count($ret) > 0) return $ret;
	
	// get the parent id	
	$cols['org_parentid'] = userTopOrgID();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_clientorg_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
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