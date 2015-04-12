<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'joblisting.conf.php');
require_once(DOC_DIR.DS.'inc'.DS.'appFunc.php');
require_once(CLASS_DIR.DS.'DocManUI'.DS.'DocManUI.php');
require_once(CORE_DIR.DS.'inc'.DS.'DocumentManager.inc.php');

function displayCartonDetail($col, $colVal, $data=array(), $html=null){
	$str = "<script>getCarton(".$colVal.",'dbotab_joblisting_detail_tbody_1',".$data['js_id'].",true)</script>";
	$html .= $str;

	return $html;
}

function showActionButtons($col, $colVal, $data=array(), $html=null) {
	
	$ret = '<div style="white-space:nowrap"><button class="btn" form="noform" title="'.tl('Print',false).'" onclick="printJobPreview('.$data['js_id'].');"><span class="btn-label icon fa fa-print"></span></button>';
	global $USER;
	if ($USER->inGroup('REQUEST_NEWJOB')) 
		$ret.= "<a class='btn' title='".tl('Create New Jobsheet',false)."' href='../PMTask/startEvent?id=1&type=PM_Event&referjs={$data['js_id']}'><span class='btn-label icon fa fa-file-text-o'></span></a>";

	if (!empty($data['pmc_id'])) {	
		include_once(CLASS_DIR.DS.'PMTask'.DS.'PMTask.php');	
		$ret .= PMTask::showTimelineButton($data['pmc_id']);
		$ret .= PMTask::showCommentButton($data['pmc_id']);
	}
	return $ret."</div>";
}

function showFileHistory($col, $colVal, $data=array(), $html=null){
	$docUI = new DocManUI();
	$html = $docUI->getFileList($data['js_id'],'js_id');
	return $html;
}

function showPercentageDet($col, $colVal, $data=array(), $html=null){

	$newhtml = '<div id="dbo_jobsheet_detail_cont_js_distortion_value" class="value_container" inputtype="text" inputtypesize="">'.$colVal.' %</div>';

	return $newhtml;
}
function showPriceDet($col, $colVal, $data, $html) {
	global $USER,$DB;
	// get the currency code by org

	$sql = "select rg_currency as currencycode
			from fcorg join mregion on org_region = rg_code where org_id = :0";
	$currcode = $DB->GetOne($sql,array($data['js_orgid']), PDO::FETCH_ASSOC);			

	$html = $currcode.' :'.$html;
	return $html;
}

# customization
function dbo_joblisting_customize(&$dbo){
	global $GLOBAL,$USER,$DB;
	autoDetailTableInput($dbo);
	list($currentOrgId, $currentOrgExternal) = $DB->getRow("select org_id, org_external from fcuserorgrole join fcorg on uor_orgid = org_id where uor_id = :0 and uor_rolid = :1", array($USER->userorgroleid, $USER->roleid));
	
	if($currentOrgExternal=='Y'){
		$dbo->whereSQL = "js_orgid = ".$USER->orgid;
		$dbo->colSearch = array('pmc_id', 'js_code', 'js_status', 'js_request_date', 'js_description', 'js_primcat', 'js_assignto');
	}else{
		$dbo->colSearch = array('pmc_id', 'js_code', 'js_status', 'js_request_date', 'js_description', 'js_primcat', 'js_orgid', 'js_assignto');
	}

	if( isset($_GET['active']) && $_GET['active'] == 'true' ){
		$GLOBAL['actvorder'] = true;
	}elseif ( !isset($_GET['page'])  ){
		unset($GLOBAL['actvorder']);
	}	
	if( isset($GLOBAL['actvorder'])  && $GLOBAL['actvorder'] ){
		$dbo->whereSQL .= " and js_status != 'COMPLETED' and js_status != 'CANCELLED' and js_status != 'PENDING CUSTOMER RESOLUTION' and js_status != 'PENDING ACCEPTANCE'";
	}

}


# final rendering
$dbo->render();
?>
