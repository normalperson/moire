<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_flowdetail.conf.php');

# customization
function dbo_rpt_flowdetail_customize(&$dbo){
	global $GLOBAL;	

	if(isset($_GET['requestdate']) && $_GET['requestdate'] !='')
		$GLOBAL['requestdate'] = $_GET['requestdate'];


	if(isset($_GET['fromcol']) && $_GET['fromcol'] !='' ){
		$GLOBAL['fromcol'] = $_GET['fromcol'];	
	}		



	if(isset($GLOBAL['fromcol']) && $GLOBAL['fromcol']!=''){
		switch ($GLOBAL['fromcol']) {
			case 'revertedjob':
				$dbo->whereSQL = "js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day' and pmf_prev_pmcnid = 26";
				break;			
			case 'internalrevertedjob':
				$dbo->whereSQL = "js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day' and pmf_prev_pmcnid = 19";
				break;			
			default:								
		}
	}
		

}


# final rendering
$dbo->render();
?>