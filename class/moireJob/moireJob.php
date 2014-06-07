<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
require_once(dirname(__FILE__).'/../../inc/appFunc.php'); // include application function
require_once(INCLUDE_DIR.DS.'Image.inc.php'); // include image class
class moireJob{

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
	function newjob(){
		html_header();
		dbo_include('jobsheet');	
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

		$value = 0;
		$carid = $_POST['carid'];
		$jobid = $_POST['jobid'];

		
		// get image location
		$img = new Image();
		$imageinfo = $img->getImage('boxtype',$carid);


		$sql = "select * from mcartonvariable where carv_carid = :0";
		$var = $DB->GetArray($sql,array($carid), PDO::FETCH_ASSOC);

		if($jobid != 0){
			$sql = "select * from mjscartonvalue
					where carval_carid = :0
					and carval_jsid = :1";
			$value = $DB->GetArray($sql,array($carid,$jobid), PDO::FETCH_ASSOC);				
		}

		$ret = array('imageinfo' => $imageinfo, 'variable' => $var, 'boxsize' => $value);

		echo json_encode($ret);
	}
	
	
}
?>
