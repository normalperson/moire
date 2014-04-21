<?php
include_once('../init.inc.php');
global $GLOBAL;
class adminSetup{
	function __construct(){
		global $HTML;

		$HTML->addCSS('css/bootstrap/css/bootstrap.min.css'); 

	}
	function populateAdmin(){
		global $GLOBAL;
		$smarty = new Smarty();
		$smarty->caching = false;
		// $smarty->debugging = true;
		$smarty->setTemplateDir(DOC_DIR.DS.'smarty'.DS.'templates');
		$smarty->setCompileDir(DOC_DIR.DS.'smarty'.DS.'templates_c');
		$smarty->setCacheDir(DOC_DIR.DS.'smarty'.DS.'cache');
		$smarty->setConfigDir(DOC_DIR.DS.'smarty'.DS.'configs');
		html_header('header.nh.html', false);
		$smarty->display('adminsetting.html');

		if(isset($GLOBAL['displaymenu'])){
			print '<div style="margin-left:200px;" id="rptRightDiv">';
			switch ($GLOBAL['displaymenu']) {
				case 'menu':
			        $dbo = dbo_include('menu');
			        break;
				case 'role':
			        $dbo = dbo_include('role');
			        break;			        
				case 'permission':
			        $dbo = dbo_include('permission');
			        break;			        			        
			}	
			print '</div>';					
		}	
	}
}


$adminSetup = new adminSetup();
if(isset($_GET['displaymenu']) && $_GET['displaymenu']!=''){
	$GLOBAL['displaymenu'] =  $_GET['displaymenu'];		
	
}
$adminSetup->populateAdmin();

?>