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
	function alljob(){
		html_header();
		dbo_include('alljob');
	}
	function ackjob(){
		html_header();
		dbo_include('ackjob');
	}
	function assignment(){
		html_header();
		dbo_include('assignment');
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
	function renderJobByCategory($userid=''){
		global $USER;
		if (trim($userid) == '') $userid = $USER->userid;

		$smarty = $this->initSmarty();
		$html = $smarty->fetch('jobbycategory.html');
		return $html;

	}
	function renderPassOrder($custid=''){
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('passorder.html');
		return $html;		
	}
	function renderTaskPendingAction($userid=''){
		global $USER;
		if (trim($userid) == '') $userid = $USER->userid;

		$smarty = $this->initSmarty();
		$html = $smarty->fetch('taskpendingaction.html');
		return $html;

	}
	function renderMyPerformance($userid=''){
		global $USER;
		if (trim($userid) == '') $userid = $USER->userid;

		$smarty = $this->initSmarty();
		$html = $smarty->fetch('myperformance.html');
		return $html;
	}
	function renderMonthlySalesByCat(){
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('monthlysalesbycat.html');
		return $html;
	}
	function renderArtistPerformance(){
		$smarty = $this->initSmarty();
		$html = $smarty->fetch('artistperformance.html');
		return $html;
	}
	function renderForcastVsActual(){
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
	/*same with pending job?*/
	function getJobPendingAction(){
		// check with yow		
	}
	function getActiveJob(){
		// check with yow		
	}
	/* for admin screen(Artist) */
	function getJobCompletedByArtist(){
		// cannot get from mjobsheet right?
		// js_assignto will change time to time right?

	}
	function getPendingJob(){
		// cannot get from mjobsheet right?
		// js_assignto will change time to time right?

	}
	function engtest(){
		$smarty = $this->initSmarty();
		$smarty->display('engtest.html');

	}
	function viewJobInfo(){
		global $DB;
		$smarty = $this->initSmarty();
		$sql = "select * from mcarton";
		$carton = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
		$jsid = $_GET['jsid'];
		$smarty->assign('carton',$carton);		
		$smarty->assign('jsid',$jsid);
		$smarty->assign('createcase','Y');
		
		$smarty->display('viewjob.html');
	}
	function jobinfo(){
		global $HTML;

		$HTML->showPageTime = false;
		html_header('header.nh.html');
		dbo_include('jobinfo');	
	}
	function jobcolor(){
		global $HTML;

		$HTML->showPageTime = false;
		html_header('header.nh.html');
		dbo_include('jobcolor');	
	}
	function jobother(){
		global $HTML;
		
		$HTML->showPageTime = false;
		html_header('header.nh.html');
		dbo_include('jobother');	
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
