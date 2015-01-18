<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['org_name']->caption->set('default', 'Customer name', 'text');
$dbo->cols['totaljobrequested']->caption->set('default', 'Total Job Request', 'text');
$dbo->cols['totalwip']->caption->set('default', 'Total WIP', 'text');
$dbo->cols['totalcancelled']->caption->set('default', 'Total Cancelled', 'text');
$dbo->cols['totalcompleted']->caption->set('default', 'Total Completed', 'text');
$dbo->cols['to_char']->caption->set('default', 'to_char', 'text');
$dbo->cols['js_request_dateinmth']->caption->set('default', 'Month', 'text');
$dbo->cols['dateinnum']->caption->set('default', 'dateinnum', 'text');

$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Reset';
$dbo->text->searchSubmit = 'Search';
$dbo->text->searchToggle = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Edit';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Cancel';
$dbo->text->detailDelete = 'Delete';
$dbo->text->listListNew = 'List New';
$dbo->text->listListNewAdd = 'Add';
$dbo->text->listListNewDelete = 'Delete';
$dbo->text->listListEditToggle = 'Edit Toggle';
$dbo->text->listNew = 'New';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageConfirmDelete = ' ';
$dbo->text->messageConfirmMultipleDelete = ' ';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageConfirmDelete = 'Confirm delete?';
$dbo->text->defaultMessageConfirmMultipleDelete = 'Confirm delete?';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->sum = 'Total';
$dbo->text->sumPage = 'Total (Page)';
$dbo->text->sumPageGroup = 'Total (Group)';
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average (Page)';
$dbo->text->avgPageGroup = 'Average (Group)';

?>