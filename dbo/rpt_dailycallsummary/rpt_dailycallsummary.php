<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_dailycallsummary.conf.php');

function totalJobLink($col, $colVal, $data=array(), $html=null){
	switch ($col) {
		case 'astotaljob':
			$region = 'ASIA';
			break;
		case 'eutotaljob':
			$region = 'EURO';
			break;			
		case 'lctotaljob':
			$region = 'LOCAL';
			break;			
		default:
			$region = 'LOCAL';
			break;
	}

	$html = '<a href="salecalldetail?region='.$region.'&completiondate='.$data['completiondate'].'" >'.number_format($colVal,0).'</a>';
	return $html;

}

# customization
function dbo_rpt_dailycallsummary_customize(&$dbo){
}


# final rendering
$dbo->render();
?>