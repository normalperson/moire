<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['udv_id']->caption->set('default', 'udv_id', 'text');
$dbo->cols['udv_code']->caption->set('default', 'Code', 'text');
$dbo->cols['udv_name']->caption->set('default', 'Name', 'text');
$dbo->cols['udv_query_type']->caption->set('default', 'Query Type', 'text');
$dbo->cols['udv_query']->caption->set('default', 'Query', 'text');
$dbo->cols['udv_result_type']->caption->set('default', 'Result Type', 'text');
$dbo->cols['udv_result_lookup']->caption->set('default', 'Result Lookup', 'text');
$dbo->cols['udv_result_lookup_type']->caption->set('default', 'Result Lookup Type', 'text');
$dbo->cols['udv_test']->caption->set('default', 'Test', 'text');
$dbo->cols['udv_return_type']->caption->set('default', 'Return Type', 'text');

$dbo->titleList = 'List UDV';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New UDV';
$dbo->titleEdit = 'Edit UDV';
$dbo->titleSearch = 'Search UDV';
$dbo->text->searchCancel = 'Cancel';
$dbo->text->searchSubmit = 'Submit';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Submit';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Back';
$dbo->text->detailDelete = 'Delete';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>