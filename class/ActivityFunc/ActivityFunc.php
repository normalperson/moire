<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/../../inc/appFunc.php');
class ActivityFunc{

	function __construct(){
		global $HTML, $GLOBAL, $DB, $USER;
		
	}
	function initSmarty($headerTmpl = "header.nh.html"){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		html_header($headerTmpl);
		
		return $smarty;
	}
	function reqVerification(){
		html_header();
		$_GET['dboid']='reqverification';
		$_GET['js_id']='36';
		$_GET['dbostate']='edit';
		dbo_include('reqverification');
		

		$this->viewJobInfo();
	}
	function viewJobInfo($jsid=''){
		global $DB;
		$smarty = $this->initSmarty();

		$sql = "select * from mcarton";
		$carton = $DB->GetArray($sql,null, PDO::FETCH_ASSOC);
		$jsid = 36;
		$smarty->assign('carton',$carton);
		$smarty->assign('jsid',$jsid);
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
