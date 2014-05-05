<?php
require_once(dirname(__FILE__).'/../../init.inc.php');

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
	
	function home(){
		global $HTML, $DB,$THEME;
	
		$smarty = $this->initSmarty();
		$pm = new ProcessManager();
		
		$ev = new PM_Event(1);
		$ret = $ev->perform('123','abc');
		
		// $ret = new PM_Case(10);
		// $ret->performFlow(1);
		vd($ret);
	}
	
}
?>
