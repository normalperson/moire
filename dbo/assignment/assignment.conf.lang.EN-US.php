<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['js_cuid']->caption->set('default', 'js_cuid', 'text');
$dbo->cols['js_ctid']->caption->set('default', 'js_ctid', 'text');
$dbo->cols['js_request_date']->caption->set('default', 'Request date', 'text');
$dbo->cols['js_title']->caption->set('default', 'Job title', 'text');
$dbo->cols['js_status']->caption->set('default', 'Status', 'text');
$dbo->cols['js_completiondate']->caption->set('default', 'Completion date', 'text');
$dbo->cols['js_assignto']->caption->set('default', 'Assign to', 'text');
$dbo->cols['org_name']->caption->set('default', 'Customer name', 'text');
$dbo->cols['ct_name']->caption->set('default', 'Contact person', 'text');
$dbo->cols['js_id']->caption->set('default', 'Job ID', 'text');
$dbo->cols['taskaging']->caption->set('default', 'Aging (Minutes)', 'text');

$dbo->titleList = 'List Record';
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
$dbo->text->listSubmit = 'Save';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>