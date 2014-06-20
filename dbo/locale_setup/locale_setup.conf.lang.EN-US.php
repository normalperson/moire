<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['lc_code']->caption->set('default', 'Code', 'text');
$dbo->cols['lc_description']->caption->set('default', 'Description', 'text');
$dbo->cols['lc_primary_langcode']->caption->set('default', 'Primary Language', 'text');
$dbo->cols['lc_tzcode']->caption->set('default', 'Timezone', 'text');

$dbo->titleList = 'List Locale';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Locale';
$dbo->titleEdit = 'Edit Locale';
$dbo->titleSearch = 'Search Locale';
$dbo->text->searchCancel = 'Reset';
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