<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_jobdetail.conf.php');

# customization
function dbo_rpt_jobdetail_customize(&$dbo){
	global $GLOBAL;	

	if(isset($_GET['requestdate']) && $_GET['requestdate'] !='')
		$GLOBAL['requestdate'] = $_GET['requestdate'];


	if(isset($_GET['fromcol']) && $_GET['fromcol'] !='' ){
		$GLOBAL['fromcol'] = $_GET['fromcol'];	
	}		



	if(isset($GLOBAL['fromcol']) && $GLOBAL['fromcol']!=''){
		switch ($GLOBAL['fromcol']) {
			case 'totalcomplete':
				$dbo->whereSQL = "js_status = 'COMPLETED' and js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day'";
				break;
			case 'totalcancel':
				$dbo->whereSQL = "js_status = 'CANCELLED' and js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day'";
				break;
			case 'totalinprogress':
				$dbo->whereSQL = "js_status != 'CANCELLED' and js_status != 'COMPLETED' and js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day'";
				break;			
			case 'totalinprogress':
				$dbo->whereSQL = "js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day'";
				break;			
			case 'revertedjob':
				$dbo->whereSQL = "js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day' and js_id in (
                                 select js_id from fcpmcaseflow join fcpmcase on pmf_pmcid = pmc_id join mjobsheet on js_id = pmc_casekey and pmc_casetype = 'jobsheet' where pmf_prev_pmcnid = 26)";
				break;			
			default:								
		}
	}
		

}


# final rendering
$dbo->render();
?>