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
}

?>
