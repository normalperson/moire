<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobsheet.conf.php');

# customization
function dbo_jobsheet_customize(&$dbo){
	$dbo->newModifier = 'dbo_jobsheet_custom_new';
}

function dbo_jobsheet_custom_new($table, $cols){

	global $DB;
	$ret = array();
	/*
	Screen
	1. Modify the on change drop down on showing the image
	2. Show the instruction on showing image

	Logic
	1. Choose the primary category
	2. save the request by and create by
	3. save the created date
	4. insert remark
	5. move the uploaded zip file (verify the zip file format)


	*/
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

# final rendering
$dbo->render();
?>