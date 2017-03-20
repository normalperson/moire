<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_jobsla.conf.php');


function slaresult($col, $colVal, $data=array(), $html=null){
	switch ($colVal) {
		case 'WithinSLA':
			return '<a href="#" class="label label-success">'.$colVal.'</a>';
			break;
		case 'ExceedSLA':
			return '<a href="#" class="label label-danger">'.$colVal.'</a>';
			break;			
		
		default:
			return '<a href="#" class="label label-waring">Unknown</a>';
			break;
	}

}
# customization
function dbo_rpt_jobsla_customize(&$dbo){
	global $DB;

}


# final rendering
$dbo->render();
?>