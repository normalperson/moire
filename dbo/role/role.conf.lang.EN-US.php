<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['rol_id']->caption->set('default', 'rol_id', 'text');
$dbo->cols['rol_code']->caption->set('default', 'Role Code', 'text');
$dbo->cols['rol_desc']->caption->set('default', 'Role Desc', 'text');
$dbo->cols['rol_permission']->caption->set('default', 'Permission', 'text');
$dbo->cols['last_modified_date']->caption->set('default', 'last_modified_date', 'text');
$dbo->cols['last_synchronized_date']->caption->set('default', 'last_synchronized_date', 'text');
$dbo->cols['record_synchronized']->caption->set('default', 'record_synchronized', 'text');
$dbo->cols['cloud_refid']->caption->set('default', 'cloud_refid', 'text');
$dbo->cols['rol_status']->caption->set('default', 'Status', 'text');

$dbo->titleList = 'List Role';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Role';
$dbo->titleEdit = 'Edit Role';
$dbo->titleSearch = 'Search Role';
$dbo->text->searchCancel = 'Cancel';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Save';
$dbo->text->detailCancel = 'Back';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>