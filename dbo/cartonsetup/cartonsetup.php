<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'cartonsetup.conf.php');

# customization
function dbo_cartonsetup_customize(&$dbo){
	autoDetailTableInput($dbo);
	$dbo->newModifier = 'dbo_cartonsetup_custom_new';
}


function dbo_cartonsetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$filelocation = DOC_DIR.DS.'image'.DS.'boxtype'.DS;
	
	if(isset($cols['file']) && $cols['file']["name"]!= ''){
		$image = $cols['file'];
		$tmp = explode(".", $cols["file"]["name"]);
		$extension = end($tmp);
		$cols['car_fileextension'] = $extension;
		unset($cols['file']);
	}
	
	$ok = $DB->doInsert($table, $cols);
	$newfilename = $DB->lastInsertId('mcarton_car_id_seq');
	$ret  = moveSingleImage($filelocation, $newfilename='',$image);

	
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

# final rendering
$dbo->render();
?>