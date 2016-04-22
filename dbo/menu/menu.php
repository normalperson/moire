<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'menu.conf.php');

# customization
if(!function_exists('genparentselect')){
	function genparentselect(){
		global $DB;
		$ret = array(0=>'*ROOT');
		$rs = $DB->getArray("select mn_id, mn_title from fcmenu where mn_parentcode is null or mn_parentcode = ''");
		foreach($rs as $row){
			$ret[$row['mn_id']] = $row['mn_title'];
		}
		return $ret;
	}
}

function testoptiontitle($title){
	global $DB;
	// vd($title);
	// return array('a'=>$title, 'b'=>'B');
	$rs = $DB->getArray("select ft_code from fongtest where ft_code like '$title%'");
	return $rs;
}

/*
$dbo->newModifier = 'menu_custom_new';
function menu_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}
*/
/*
$dbo->editModifier = 'menu_custom_edit';
function menu_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}
*/
/*
$dbo->deleteModifier = 'menu_custom_delete';
function menu_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}
*/
/*
$dbo->searchModifier = 'menu_custom_search';
function menu_custom_search(&$search){
	return $search;
}
*/
# final rendering
$dbo->render();
?>