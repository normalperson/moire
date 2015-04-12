<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'rpt_salecalldetail.conf.php');

# customization
function dbo_rpt_salecalldetail_customize(&$dbo){
	global $GLOBAL;	
	if(isset($_GET['completiondate']) && $_GET['completiondate'] !='')
		$GLOBAL['completiondate'] = $_GET['completiondate'];
	if(isset($_GET['region']) && $_GET['region'] !='' ){
		$GLOBAL['region'] = $_GET['region'];	
		if(isset($GLOBAL['customer']) && $GLOBAL['customer']!= '')
			unset($GLOBAL['customer']);
	}		

	if(isset($_GET['customer']) && $_GET['customer'] !='' ){
		$GLOBAL['customer'] = $_GET['customer'];	
		if(isset($GLOBAL['region']) && $GLOBAL['region']!= '')
			unset($GLOBAL['region']);
	}		


	if(isset($GLOBAL['region']) && $GLOBAL['region']!='')
		$dbo->whereSQL = "org_region = '".$GLOBAL['region']."' and js_completiondate > '".$GLOBAL['completiondate']."' and js_completiondate <= cast('".$GLOBAL['completiondate']."' as date) + interval '1 day'";

	if(isset($GLOBAL['customer']) && $GLOBAL['customer']!='')
		$dbo->whereSQL = "js_orgid = '".$GLOBAL['customer']."' and js_completiondate > '".$GLOBAL['completiondate']."' and js_completiondate <= cast('".$GLOBAL['completiondate']."' as date) + interval '1 day'";

}


# final rendering
$dbo->render();
?>