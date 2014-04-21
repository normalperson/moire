<?php
global $GLOBAL, $DB,$HTML;
html_header('header.nh.html');
$HTML->showPageTime=false;
if(isset($_GET['load'])){
	$GLOBAL['dboload'] = $_GET['load'];
}
if(!empty($GLOBAL['dboload']) && file_exists(DOC_DIR.DS.'dbo'.DS.$GLOBAL['dboload'].DS.$GLOBAL['dboload'].'.php')){
	include(DOC_DIR.DS.'dbo'.DS.$GLOBAL['dboload'].DS.$GLOBAL['dboload'].'.php');
}else{
	echo DOC_DIR.DS.'dbo'.DS.$GLOBAL['dboload'].DS.$GLOBAL['dboload'].'.php not exists';
}
?>