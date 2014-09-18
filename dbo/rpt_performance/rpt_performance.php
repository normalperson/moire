<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_performance.conf.php');

function sladrilldown($col, $colVal, $data=array(), $html=null){
	$html = '<a href="performancedet?colval='.$col.'&sladate='.$data['actvdate'].'&endby='.$data['pmf_end_by'].'" >'.number_format($colVal,0).'</a>';
	return $html;
}	
# customization
function dbo_rpt_performance_customize(&$dbo){
}


# final rendering
$dbo->render();
?>