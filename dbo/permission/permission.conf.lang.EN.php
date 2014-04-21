<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['pm_id']->caption->set('default', 'pm_id', 'text');
$dbo->cols['pm_code']->caption->set('default', 'Code', 'text');
$dbo->cols['pm_desc']->caption->set('default', 'Description', 'text');

$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';

?>