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
	function flowdetail(){
		html_header();		
		$dbo = dbo_include('rpt_flowdetail');
	}
	function dailyjobsummary(){
		html_header();
		$dbo = dbo_include('rpt_dailyjobsummary');	
	}
	public function dailyoutput()
	{
		html_header();
		$dbo = dbo_include('rpt_dailyoutput');	
	}
	function performancesummary(){
		html_header();
		$dbo = dbo_include('rpt_performance');	
	}
	function performancedet(){
		html_header();
		$dbo = dbo_include('rpt_performance_det');	

	}
	function monthlysalesbycustomer(){
		html_header();
		$dbo = dbo_include('rpt_monthsalebycustomer');			
	}

	function jobsla(){
		html_header();
		$dbo = dbo_include('rpt_jobsla');
	}
	function job(){
		html_header();
		$dbo = dbo_include('rpt_job');
	}
	
}

$Report = new Report();
?>