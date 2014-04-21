<?php
require_once(dirname(__FILE__).'/../../init.inc.php');

class ProcessManager{
	function __construct(){
		//....
	}
	function processmanager(){
		global $HTML;
		$smarty = new Smarty();
		$smarty->caching = false;
		// $smarty->debugging = true;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');	
		$HTML->addJS('js/jsplumb/lib/jquery.ui.touch-punch.min.js');
		# support lib for bezier stuff 
		$HTML->addJS('js/jsplumb/lib/jsBezier-0.6.js');
		# jsplumb geom functions 
		$HTML->addJS('js/jsplumb/lib/jsplumb-geom-0.1.js');
		# jsplumb util -->
		$HTML->addJS('js/jsplumb/src/util.js');
        # base DOM adapter 
        $HTML->addJS('js/jsplumb/src/dom-adapter.js');
		# main jsplumb engine 
		$HTML->addJS('js/jsplumb/src/jsPlumb.js');
        # endpoint 
        $HTML->addJS('js/jsplumb/src/endpoint.js');
        # connection 
        $HTML->addJS('js/jsplumb/src/connection.js');
        # anchors 
        $HTML->addJS('js/jsplumb/src/anchors.js');
		# connectors, endpoint and overlays  
		$HTML->addJS('js/jsplumb/src/defaults.js');		
        # bezier connectors 
        $HTML->addJS('js/jsplumb/src/connectors-bezier.js');		
		# state machine connectors 
		$HTML->addJS('js/jsplumb/src/connectors-statemachine.js');		
        # flowchart connectors 
        $HTML->addJS('js/jsplumb/src/connectors-flowchart.js');		
		# SVG renderer 
		$HTML->addJS('js/jsplumb/src/renderers-svg.js');		
		# canvas renderer 
		$HTML->addJS('js/jsplumb/src/renderers-canvas.js');		
		# vml renderer 
		$HTML->addJS('js/jsplumb/src/renderers-vml.js');		
        
        # jquery jsPlumb adapter 
        $HTML->addJS('js/jsplumb/src/jquery.jsPlumb.js');		

		$HTML->addcss('css/jsplumb.css');
		$HTML->addcss('css/css.php?c=ProcessManager&js=processmanager');		
		html_header();
		$smarty->display('processmanager.html');
		$HTML->addJS('js/jsplumb/src/jquery.jsPlumb.js');				
		$HTML->addJS('js/js.php?c=ProcessManager&js=processmanager');
		$HTML->addJS('js/jsplumb/helper/demo-list.js');	
		$HTML->addJS('js/jsplumb/helper/demo-helper-jquery.js');	


	}
}

$ProcessManager = new ProcessManager();
?>