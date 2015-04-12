<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['tmp_jsid']->caption->set('default', 'Job ID', 'text');
$dbo->cols['tmp_submissiondate']->caption->set('default', 'Submission date', 'text');
$dbo->cols['tmp_customername']->caption->set('default', 'Customer name', 'text');
$dbo->cols['tmp_completiondate']->caption->set('default', 'Completion date', 'text');
$dbo->cols['tmp_status']->caption->set('default', 'Status', 'text');
$dbo->cols['tmp_category']->caption->set('default', 'Category', 'text');
$dbo->cols['tmp_invoice']->caption->set('default', 'Invoice', 'text');

$dbo->titleList = 'Job status report';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Cancel';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Save';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>