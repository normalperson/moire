<?php
require_once(dirname(__FILE__).'/../../init.inc.php');

class Report{
	function __construct(){
	}	
	function dailycallsummary(){
		html_header();
		$dbo = dbo_include('rpt_dailycallsummary');
	}	
	function dailycallsummaryDet(){
		html_header();
		$dbo = dbo_include('rpt_dailycallsummary_det');
	}
	function dailysalesummary(){
		html_header();
		$dbo = dbo_include('rpt_dailysalesummary_2');
	}
	function salecalldetail(){
		html_header();
		$dbo = dbo_include('rpt_salecalldetail');
	}
	function jobdetail(){
		html_header();
		$dbo = dbo_include('rpt_jobdetail');
	}
	function dailyjobsummary(){
		html_header();
		$dbo = dbo_include('rpt_dailyjobsummary');	
	}
	function performancesummary(){
		html_header();
		$dbo = dbo_include('rpt_performance');	
	}
	function performancedet(){
		html_header();
		$dbo = dbo_include('rpt_performance_det');	

	}
	
}

$Report = new Report();
?>