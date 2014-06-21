<?php
require_once(dirname(__FILE__).'/../../init.inc.php');
html_header();
global $HTML, $DB;
$_GET['dboid'] = 'tnc_setup';
$_GET['dbostate'] = 'edit';
$_GET['tc_id'] = 1;
dbo_include('tnc_setup');

?>