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
/*		$pm = new ProcessManager();
		
		$ev = new PM_Event(1);
		$ret = $ev->perform('123','abc');
		*/
		// $ret = new PM_Case(10);
		// $ret->performFlow(1);

	}
}

?>
