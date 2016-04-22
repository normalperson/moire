<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'inc'.DIRECTORY_SEPARATOR.'Accounting.inc.php');

global $USER;
$act = new Accounting();

// Test with valid data
/*$amt = 500;
$journaldate = '2014-2-14';
$createdby = $USER->userid;
$desc = null;
$ref1 = 'MEMBER';
$ref2 = 10;

$ok = $act->membershipsub($amt, $journaldate, $createdby, $desc, $ref1,$ref2,$costcenter=5);
vd($ok);*/

// test with invalid data
/*$amt = 0;
$journaldate = '2014-2-14';
$createdby = $USER->userid;
$desc = null;
$ref1 = 'MEMBER';
$ref2 = 10;

$ok = $act->membershipsub($amt, $journaldate, $createdby, $desc, $ref1,$ref2,$costcenter=5);
vd($ok);*/


// test with valid exam data
/*$amt = 1500;
$journaldate = '2014-2-14';
$createdby = $USER->userid;
$desc = 'Exam payment';
$ref1 = 'EXAM';
$ref2 = 20;

$ok = $act->exampayment($amt, $journaldate, $createdby, $desc, $ref1,$ref2);
vd($ok);*/

// test with valid dinner data
$amt = 300;
$journaldate = '2014-2-14';
$createdby = $USER->userid;
$desc = 'Dinner fee';
$ref1 = 'DINNER';
$ref2 = 15;

$ok = $act->dinnerfee($amt, $journaldate, $createdby, $desc, $ref1,$ref2);
vd($ok);



?>