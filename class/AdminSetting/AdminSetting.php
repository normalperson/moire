<?php
require_once(dirname(__FILE__).'/../../init.inc.php');

class AdminSetting{
	function __construct(){
		/*Verify the permission*/
	}	
	function customersetup(){
		html_header();
		$dbo = dbo_include('customersetup');	
	}
	function machinesetup(){
		html_header();
		$dbo = dbo_include('machinesetup');	
	}
	
}

$AdminSetting = new AdminSetting();
?>