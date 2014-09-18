<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_dailycallsummary.conf.php');

function totalJobLink($col, $colVal, $data=array(), $html=null){
	switch ($col) {
		case 'rpt_astotaljob':
			$region = 'ASIA';
			break;
		case 'rpt_eutotaljob':
			$region = 'EURO';
			break;			
		case 'rpt_lctotaljob':
			$region = 'LOCAL';
			break;			
		default:
			$region = 'LOCAL';
			break;
	}

	$html = '<a href="salecalldetail?region='.$region.'&completiondate='.$data['rpt_completiondate'].'" >'.number_format($colVal,0).'</a>';
	return $html;

}

# customization
function dbo_rpt_dailycallsummary_customize(&$dbo){
}


# final rendering
$dbo->render();
?>