<?php

	$start = '2014-07-01';

	// A DATE TO STOP GENERATING DATA
	$stop  = date("Y-m-d");

	// A LOOP TO SHOW THE DATES
	while ($start <= $stop)
	{
	    $start = date('Y-M', strtotime($start));
	    echo strtoupper($start).'<br>';
	    $start = date('Y-m-01', strtotime($start . ' + 1 MONTH'));
	}
?>