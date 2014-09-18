<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_performance_det.conf.php');

# customization
function dbo_rpt_performance_det_customize(&$dbo){
	global $GLOBAL,$DB;	

	if(isset($_GET['colval']) && $_GET['colval'] !='')
		$GLOBAL['colval'] = $_GET['colval'];


	if(isset($_GET['sladate']) && $_GET['sladate'] !='' )
		$GLOBAL['sladate'] = $_GET['sladate'];	
	
	if(isset($_GET['endby']) && $_GET['endby'] !='' )
		$GLOBAL['endby'] = $_GET['endby'];	
	
	if(isset($GLOBAL['colval']) && $GLOBAL['colval']!=''){
		switch ($GLOBAL['colval']) {
			case 'complysla':
				$dbo->whereSQL = "( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) / timediffinmin(pmf_start_date, pmf_due_date) ) * 100 < 0 and pmf_end_by = '".$GLOBAL['endby']."' and pmf_start_date > '".$GLOBAL['sladate']."' and pmf_start_date <= cast('".$GLOBAL['sladate']."' as date) + interval '1 day'";
				break;
			case 'totalcancel':
				$dbo->whereSQL = "js_status = 'CANCELLED' and js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day'";
				break;
			case 'totalinprogress':
				$dbo->whereSQL = "js_status != 'CANCELLED' and js_status != 'COMPLETED' and js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day'";
				break;			
			default:
			case 'totalinprogress':
				$dbo->whereSQL = "js_request_date > '".$GLOBAL['requestdate']."' and js_request_date <= cast('".$GLOBAL['requestdate']."' as date) + interval '1 day'";
				break;			
		}
	}
}


# final rendering
$dbo->render();
?>