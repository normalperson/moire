<?php
require_once(dirname(__FILE__).'/../../init.inc.php');

class Report{
	function __construct(){
	}	
	function jobstatusreport(){
		html_header();
		$dbo = dbo_include('tmp_jobstatusreport');
	}
	function custsalereport(){
		html_header();
		$dbo = dbo_include('tmp_customersalesbycategory');
	}
	function salebycategory(){
		html_header();
		$dbo = dbo_include('tmp_monthsalesbycategory');
	}
	function salebycustomer(){
		html_header();
		$dbo = dbo_include('tmp_monthsalesbycustomer');

	}
	function dailysale(){
		html_header();
		$dbo = dbo_include('tmp_dailysalereport');		
	}
	function dailyuseractivity(){
		html_header();
		$dbo = dbo_include('tmp_dailyactivity');			
	}
	
}

$Report = new Report();
?>