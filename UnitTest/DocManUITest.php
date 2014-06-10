<?php
define('ANONYMOUS', true);
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');
require_once(CLASS_DIR.DS.'DocManUI'.DS.'DocManUI.php');		


$docUI = new DocManUI();
$html = $docUI->getFileList('34','car_id');

html_header();
echo $html;

?>
