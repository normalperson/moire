<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_dailysalesummary_2.conf.php');

function customerLink($col, $colVal, $data=array(), $html=null){
	$html = '<a href="salecalldetail?customer='.$colVal.'&completiondate='.$data['completiondate'].'" >'.trim($html).'</a>';
	return $html;
}

# customization
function dbo_rpt_dailysalesummary_2_customize(&$dbo){
}


# final rendering
$dbo->render();
?>