<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['jol_id']->caption->set('default', 'jol_id', 'text');
$dbo->cols['jol_title']->caption->set('default', 'Title', 'text');
$dbo->cols['jol_requiredtime']->caption->set('default', 'Required Time (Minute)', 'text');
$dbo->cols['jol_status']->caption->set('default', 'Status', 'text');

$dbo->titleList = 'List Job Output';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Job Output';
$dbo->titleEdit = 'Edit Job Output';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Reset';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Cancel';
$dbo->text->detailDelete = 'Delete';
$dbo->text->listEdit = 'Save';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>