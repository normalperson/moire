<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['car_id']->caption->set('default', 'Carton Type ID', 'text');
$dbo->cols['car_name']->caption->set('default', 'Carton Type Name', 'text');
$dbo->cols['car_status']->caption->set('default', 'Status', 'text');
$dbo->cols['car_seq']->caption->set('default', 'Sequence', 'text');

$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Reset';
$dbo->text->searchSubmit = 'Search';
$dbo->text->searchToggle = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Edit';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Cancel';
$dbo->text->detailDelete = 'Delete';
$dbo->text->listNew = 'New';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->sum = 'Total';
$dbo->text->sumPage = 'Total (Page)';
$dbo->text->sumPageGroup = 'Total (Group)';
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average (Page)';
$dbo->text->avgPageGroup = 'Average (Group)';

?>