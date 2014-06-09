<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['ru_id']->caption->set('default', 'Rule ID', 'text');
$dbo->cols['ru_name']->caption->set('default', 'Name', 'text');
$dbo->cols['ru_true_msg']->caption->set('default', 'If True', 'text');
$dbo->cols['ru_false_msg']->caption->set('default', 'If False', 'text');
$dbo->cols['ru_data']->caption->set('default', 'Setup', 'text');
$dbo->cols['testselect']->caption->set('default', 'testselect', 'text');

$dbo->titleList = 'List Rule';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Rule';
$dbo->titleEdit = 'Edit Rule';
$dbo->titleSearch = 'Search Rule';
$dbo->text->searchCancel = 'Reset';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Edit';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Cancel';
$dbo->text->detailDelete = 'Delete';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>