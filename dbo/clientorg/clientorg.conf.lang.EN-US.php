<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['org_id']->caption->set('default', 'org_id', 'text');
$dbo->cols['org_code']->caption->set('default', 'Organization code', 'text');
$dbo->cols['org_name']->caption->set('default', 'Organization Name', 'text');
$dbo->cols['org_parentid']->caption->set('default', 'org_parentid', 'text');
$dbo->cols['org_primaryid']->caption->set('default', 'org_primaryid', 'text');
$dbo->cols['org_address']->caption->set('default', 'Address', 'text');
$dbo->cols['org_contactno']->caption->set('default', 'Contact No.', 'text');
$dbo->cols['org_status']->caption->set('default', 'Status', 'text');
$dbo->cols['org_type']->caption->set('default', 'org_type', 'text');
$dbo->cols['org_external']->caption->set('default', 'External', 'text');
$dbo->cols['org_lccode']->caption->set('default', 'org_lccode', 'text');
$dbo->cols['org_concode']->caption->set('default', 'org_concode', 'text');

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
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Back';
$dbo->text->detailDelete = 'Delete ';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->listNewEditSubmit = 'Save';

?>