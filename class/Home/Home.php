<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/../../inc/appFunc.php');

class Home{

	function __construct(){
		global $HTML, $GLOBAL, $DB, $USER;
		
	}
	function initSmarty($headerTmpl = "header.html"){
		$smarty = new Smarty();
		$smarty->caching = false;
		$smarty->setTemplateDir(dirname(__FILE__).DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		html_header($headerTmpl);
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
		
		$HTML->addJS('js/highchart/highcharts.js');
		$HTML->addCSS('css/css.php?c=Home&css=home.css');
		$smarty = $this->initSmarty();
		$smarty->display('qchome.html');
		$HTML->addJS('js/js.php?c=Home&js=graph');
		
	}
	function artisthome(){
		global $HTML;
		$HTML->addJS('js/highchart/highcharts.js');
		$HTML->addCSS('css/css.php?c=Home&css=home.css');
		$smarty = $this->initSmarty();
		$smarty->display('artisthome.html');
		$HTML->addJS('js/js.php?c=Home&js=graph');
	}
	function supervisorhome(){
		global $HTML;
		$HTML->addJS('js/highchart/highcharts.js');
		$HTML->addJS('js/highchart/highcharts-more.js');
		$HTML->addCSS('css/css.php?c=Home&css=home.css');
		$smarty = $this->initSmarty();
		$smarty->display('supervisorhome.html');
		$HTML->addJS('js/js.php?c=Home&js=graph');

	}
	function customerhome(){
		global $HTML;
		
		//$HTML->addJS('js/highchart/highcharts.js');
		//$HTML->addCSS('css/css.php?c=Home&css=home.css');
		$smarty = $this->initSmarty();
		$smarty->display('customerhome.html');
		$HTML->addJS('js/js.php?c=Home&js=graph');
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
