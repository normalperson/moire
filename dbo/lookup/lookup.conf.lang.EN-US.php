<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['lu_cat']->caption->set('default', 'Category', 'text');
$dbo->cols['lu_code']->caption->set('default', 'Code', 'text');
$dbo->cols['lu_parentcode']->caption->set('default', 'Parent Code', 'text');
$dbo->cols['lu_title']->caption->set('default', 'Title', 'text');
$dbo->cols['lu_status']->caption->set('default', 'Status', 'text');
$dbo->cols['lu_id']->caption->set('default', 'lu_id', 'text');

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