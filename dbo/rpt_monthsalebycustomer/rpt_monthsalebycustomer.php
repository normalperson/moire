<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_monthsalebycustomer.conf.php');
require_once(INCLUDE_DIR.'\generalFunc.php');

function jobsummarylink($col, $colVal, $data=array(), $html=null){

	$html = '<a href="jobdetail?fromcol='.$col.'&requestdate='.$data['dateinnum'].'&customer='.$data['org_id'].'" >'.number_format($colVal,0).'</a>';
	return $html;

}
# customization
function dbo_rpt_monthsalebycustomer_customize(&$dbo){
}


# final rendering
$dbo->render();
?>