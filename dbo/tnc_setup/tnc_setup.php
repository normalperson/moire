<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'tnc_setup.conf.php');

# customization
function dbo_tnc_setup_customize(&$dbo){

$dbo->editModifier = 'dbo_tnc_setup_custom_edit';

}

function dbo_tnc_setup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	else {
		$DB->execute("delete from mtncacceptance");
	}
	return $ret;
}

# final rendering
$dbo->render();
?>