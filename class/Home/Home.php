<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/../../inc/appFunc.php');

class Home{

	function __construct(){
		global $HTML, $GLOBAL, $DB, $USER;
		
	}
	function initSmarty(){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		return $smarty;
	}
	function qchome(){
		global $HTML;
		html_header();		
		$smarty = $this->initSmarty();
		$smarty->assign('Home', $this);	
		$smarty->display('qchome.html');
		
		
	}
	function artisthome(){
		global $HTML;
		html_header();
		$smarty = $this->initSmarty();
		$smarty->assign('Home', $this);	
		$smarty->display('artisthome.html');

	}
	function supervisorhome(){
		global $HTML;
		html_header();
		$smarty = $this->initSmarty();
		$smarty->assign('Home', $this);		
		$smarty->display('supervisorhome.html');
		

	}
	function customerhome(){
		global $HTML;
		
		html_header();
		$smarty = $this->initSmarty();
		$smarty->assign('Home', $this);		
		$smarty->display('customerhome.html');
	}
	function renderJobByCategory($paneltitle='JOB BY CATEGORY', $charttitle = 'Total Job', $chartsubtitle='Job by category',$type,$actvid=0){
		global $USER,$HTML;
		if (trim($userid) == '') $userid = $USER->userid;

		$sql = "select * from mjobcatlookup order by jcl_title";
		$jobcat = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);

		if($type == 'supervisor'){
			//$sql = "select count(*) from mjobsheet";
		}

		$HTML->addJS('js/highcharts.js');
		$smarty = $this->initSmarty();
		$smarty->assign('paneltitle',$paneltitle );
		$smarty->assign('charttitle',$charttitle );
		$smarty->assign('chartsubtitle',$chartsubtitle );		
		$html = $smarty->fetch('jobbycategory.html');
		return $html;

	}
	function renderPassOrder($custid=''){
		global $HTML;
		$HTML->addJS('js/highcharts.js');
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('passorder.html');
		return $html;		
	}
	function renderTaskPendingAction($usertype='', $userid=''){
		global $USER,$HTML;
		if (trim($userid) == '') $userid = $USER->userid;

		$HTML->addJS('js/highcharts.js');
		$smarty = $this->initSmarty();
		$smarty->assign('usertype',$usertype );
		$html = $smarty->fetch('taskpendingaction.html');
		return $html;

	}
	function renderMyPerformance($userid=''){
		global $USER,$HTML;
		if (trim($userid) == '') $userid = $USER->userid;

		$HTML->addJS('js/highcharts.js');
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('myperformance.html');
		return $html;
	}
	function renderMonthlySalesByCat(){
		global $HTML;
		$HTML->addJS('js/highcharts.js');
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('monthlysalesbycat.html');
		return $html;
	}
	function renderArtistPerformance(){
		global $HTML;
		$HTML->addJS('js/highcharts.js');
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('artistperformance.html');
		return $html;
	}
	function renderForcastVsActual(){
		global $HTML;
		$HTML->addJS('js/highcharts.js');
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('forcastvsactual.html');
		return $html;
	}
	function renderCustomerContribution(){
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('customercontribution.html');
		return $html;	
	}
	/*for customer screen*/
	function getTotalOrderByCustomer($custid,$thismonth='N'){
		
		$datefilter = " and js_request_date between date_trunc('month', current_date) and current_date + interval '1' day ";

		$sql = "select count(*) from mjobsheet
			where js_orgid = :0";

		if($thismonth == 'Y') $sql .= $datefilter;

		$total = $DB->GetOne($sql,array($custid), PDO::FETCH_ASSOC);
		return $total;

	}	
	function totalOrderMTD(){
		global $DB,$USER;
		//vd($USER->orgid);
		$sql = "select count(*) from mjobsheet where js_orgid = :0
		        and js_request_date > date_trunc('month', current_date)
		        and js_request_date < (date_trunc('MONTH', current_date) + INTERVAL '1 MONTH')::date";
		$cnt = $DB->GetOne($sql,array($USER->orgid), PDO::FETCH_ASSOC);
		return $cnt;
	}
	function activeOrder(){
		global $DB,$USER;
		//vd($USER->orgid);
		$sql = "select count(*) from mjobsheet where js_orgid = :0 and js_status != :1";
		$cnt = $DB->GetOne($sql,array($USER->orgid,'COMPLETED'), PDO::FETCH_ASSOC);
		return $cnt;
		
	}
	function totalOrder(){
		global $DB,$USER;
		//vd($USER->orgid);
		$sql = "select count(*) from mjobsheet where js_orgid = :0";
		$cnt = $DB->GetOne($sql,array($USER->orgid), PDO::FETCH_ASSOC);
		return $cnt;
	}
	function getArtistExeedSLA(){
		global $DB, $USER;
		$sql= "select count(*)  
				from fcpmcaseflow
				where ( ( pmf_obj_type = :0 and pmf_obj_id =:1 )
				or ( pmf_obj_type = :2 and pmf_obj_id =:3 ) )
				and pmf_end_date is not null
				and pmf_end_by = :4
				and pmf_start_date > date_trunc('month', current_date)
				and pmf_start_date < (date_trunc('MONTH', current_date) + INTERVAL '1 MONTH')::date
				and pmf_end_date > pmf_due_date";
		$cnt = $DB->GetOne($sql,array('PM_Activity',4,'PM_Event',2,$USER->userid), PDO::FETCH_ASSOC);
		return $cnt;

	}
	function getQCExeedSLA(){
		global $DB, $USER;
		$sql= "select count(*)  
				from fcpmcaseflow
				where pmf_obj_type = :0
				and pmf_obj_id =:1
				and pmf_end_date is not null
				and pmf_end_by = :2
				and pmf_start_date > date_trunc('month', current_date)
				and pmf_start_date < (date_trunc('MONTH', current_date) + INTERVAL '1 MONTH')::date
				and pmf_end_date > pmf_due_date";
		$cnt = $DB->GetOne($sql,array('PM_Activity',5,$USER->userid), PDO::FETCH_ASSOC);
		return $cnt;

	}
	function getCompletedJob($type='PM_Activity',$id){
		global $DB, $USER;
		$sql= "select count(*)  
				from fcpmcaseflow
				where pmf_obj_type = :0
				and pmf_obj_id =:1
				and pmf_end_date is not null
				and pmf_end_by = :2";
		$cnt = $DB->GetOne($sql,array($type,$id,$USER->userid), PDO::FETCH_ASSOC);
		return $cnt;
	}
	function showFlowSummaryMTD(){
		global $GLOBAL;
		html_header();
		dbo_include('flowsummarymtd');
	}
	function showFlowSummary(){
		global $GLOBAL;
		html_header();
		dbo_include('flowsummary');
	}
	function showJobList(){
		global $GLOBAL;
		html_header();
		if( isset($GLOBAL['dbosess']['joblisting']) && count($GLOBAL['dbosess']['joblisting']) > 0 ) unset($GLOBAL['dbosess']['joblisting']);
		dbo_include('joblisting');
	}
	function getTotalJob(){
		global $DB;
		$sql = "select count(*) from mjobsheet";
		$cnt = $DB->GetOne($sql,null, PDO::FETCH_ASSOC);
		return $cnt;
	}
	function getFlowUrl($id,$type){

		$url = '#';
		if($type == 'PM_Activity'){
			$url = WEB_HREF.'/PMTask/caseFlowList?id='.$id.'&type=PM_Activity';
		}elseif ($type == 'PM_Event'){
			$url = WEB_HREF.'/PMTask/caseFlowList?id='.$id.'&type=PM_Event';
		}
		return $url;
	}
	function getEventData($eventid,$column){
		global $DB;
		$sql = "select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Event' as object_type, 
				pmev_id eventid, pmev_type eventtype, max(pmev_name) eventname, 
				sum(case when pmf_id is not null then 1 else 0 end) totalcount, 
				sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount, 
				sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount, 
				min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date else null end) earliestduedate 
				from fcpmworkflow join fcpmevent on pmwf_id = pmev_pmwfid 
				and ((pmev_type = 'INTERMEDIATE' and pmev_intermediate_show_task = 'Y') or (pmev_type = 'START' and pmev_start_function is not null)) 
				left join fcpmcaseflow on pmf_obj_type = 'PM_Event' and pmev_id = pmf_obj_id 
				and pmf_end_date is null 
				where pmev_id = :0
				group by pmwf_id, pmev_id, pmev_type ";		
		$data = $DB->GetRow($sql,array($eventid), PDO::FETCH_ASSOC);

		return $data[$column];
	}
	/*get flow data*/
	function getActivityData($activityid, $column){
		global $DB;
		$sql = "select pmwf_id workflowid, max(pmwf_name) workflowname, 'PM_Activity' as object_type, 
				pmat_id activityid, max(pmat_name) activityname, sum(case when pmf_id is not null then 1 else 0 end) totalcount, 
				sum(case when pmf_id is not null and pmf_end_date is null then 1 else 0 end) totalpendingcount, 
				sum(case when pmf_id is not null and pmf_end_date is null and pmf_due_date < now() then 1 else 0 end) totaloverduecount, 
				min(case when pmf_id is not null and pmf_end_date is null then pmf_due_date else null end) earliestduedate 
				from fcpmworkflow join fcpmactivity on pmwf_id = pmat_pmwfid and pmat_type = 'USER' 
				left join fcpmcaseflow on pmf_obj_type = 'PM_Activity' and pmat_id = pmf_obj_id and pmf_end_date is null 
				where pmat_id = :0
				group by pmwf_id, pmat_id";
		$data = $DB->GetRow($sql,array($activityid), PDO::FETCH_ASSOC);

		return $data[$column];
		
	}

	function getCartonInfo(){
		global $DB;

		// include document class
		require_once(CORE_DIR.DS.'inc'.DS.'Document.inc.php');		

		$carid = $_POST['carid'];

		// get image location
		$doc = new Document();
		$imageinfo = $doc->getSingleDocInfo($carid,'car_id');


		$sql = "select * from mcartonvariable where carv_carid = :0";
		$var = $DB->GetArray($sql,array($carid), PDO::FETCH_ASSOC);

		$ret = array('imageinfo' => $imageinfo, 'var' => $var);

		echo json_encode($ret);
	}
}

?>
