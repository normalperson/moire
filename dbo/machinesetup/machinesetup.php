<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'machinesetup.conf.php');

function fiveinputinarow_new($col, $colVal, $data=array(), $html=null){
	$colname = $col;
	
	$inputname = substr($colname,1,strlen($colname)-1);
	// get the input name
	$html = '<div id="'.'dbo_machinesetup_new_'.$inputname.'"  inputtype="text" inputtypesize="">';

	for($i=1;$i<=5;$i++){
		$html .= '<input type="text" class="fiveinarow" name="'.'dbo_machinesetup_new_'.$inputname.$i.'" id="'.'dbo_machinesetup_new_'.$inputname.$i.'" value="">';
	}
	$html .="</div>";

	return $html;
}
# customization
function dbo_machinesetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>