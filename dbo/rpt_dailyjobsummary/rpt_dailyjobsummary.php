<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_dailyjobsummary.conf.php');

function jobsummarylink($col, $colVal, $data=array(), $html=null){

	$html = '<a href="jobdetail?fromcol='.$col.'&requestdate='.$data['js_request_date'].'" >'.number_format($colVal,0).'</a>';
	return $html;

}
function flowsummarylink($col, $colVal, $data=array(), $html=null){

	$html = '<a href="flowdetail?fromcol='.$col.'&requestdate='.$data['js_request_date'].'" >'.number_format($colVal,0).'</a>';
	return $html;

}

# customization
function dbo_rpt_dailyjobsummary_customize(&$dbo){
}


# final rendering
$dbo->render();
?>