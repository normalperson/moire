<?php
define('ANONYMOUS', true);
include(dirname(__FILE__).'/../../init.inc.php');

function genRptCallSummary() { // temp
	global $DB;
	// get yesterday date
	$yesterday = date('Y-m-d',strtotime("-1 days"));
	echo 'yesterday = '.$yesterday.'<br>';

	$sql = "select gendailycallsummary('".$yesterday."')";
	$ok = $DB->Execute($sql);

	// if not ok insert log
}

echo "------------------- ".date('Y-m-d H:i:s')."------------------------<br\>\n";
genRptCallSummary();
echo "-------------------------------------------------------------------<br\>\n\n";
?>
<!-- regen multi day code
DO 
$do$
DECLARE
 _counter int := 0;
BEGIN
WHILE _counter < 40
LOOP
   _counter := _counter + 1;
   perform gendailycallsummary( cast( cast('2014-07-01' as date) + ( interval '1 day' * _counter ) as date) );
   RAISE NOTICE 'The counter is %', _counter;  
END LOOP;
END
$do$ -->