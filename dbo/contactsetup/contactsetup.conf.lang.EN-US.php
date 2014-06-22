<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['ct_id']->caption->set('default', 'ID', 'text');
$dbo->cols['ct_refid']->caption->set('default', 'Customer', 'text');
$dbo->cols['ct_reftype']->caption->set('default', 'ct_reftype', 'text');
$dbo->cols['ct_name']->caption->set('default', 'Name', 'text');
$dbo->cols['ct_email']->caption->set('default', 'Email', 'text');
$dbo->cols['ct_concode']->caption->set('default', 'Country', 'text');
$dbo->cols['org_id']->caption->set('default', 'org_id', 'text');
$dbo->cols['org_type']->caption->set('default', 'org_type', 'text');
$dbo->cols['org_external']->caption->set('default', 'org_external', 'text');
$dbo->cols['org_name']->caption->set('default', 'Customer', 'text');
$dbo->cols['org_parentid']->caption->set('default', 'org_parentid', 'text');
$dbo->cols['org_primaryid']->caption->set('default', 'org_primaryid', 'text');
$dbo->cols['org_address']->caption->set('default', 'org_address', 'text');
$dbo->cols['org_contactno']->caption->set('default', 'org_contactno', 'text');
$dbo->cols['org_status']->caption->set('default', 'org_status', 'text');
$dbo->cols['org_lccode']->caption->set('default', 'org_lccode', 'text');
$dbo->cols['org_concode']->caption->set('default', 'org_concode', 'text');

$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Reset';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Edit';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Cancel';
$dbo->text->detailDelete = 'Delete';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>