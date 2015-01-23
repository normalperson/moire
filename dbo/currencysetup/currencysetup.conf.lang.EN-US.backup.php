<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['cr_code']->caption->set('default', 'Code', 'text');
$dbo->cols['cr_name']->caption->set('default', 'Full Name', 'text');
$dbo->cols['cr_rate']->caption->set('default', 'Rate', 'text');
$dbo->cols['cr_symbol']->caption->set('default', 'Symbol', 'text');
$dbo->cols['cr_format']->caption->set('default', 'Format', 'text');
$dbo->cols['cr_decimalsep']->caption->set('default', 'Decimal Separator', 'text');
$dbo->cols['cr_thousandsep']->caption->set('default', 'Thousand Separator', 'text');
$dbo->cols['cr_precision']->caption->set('default', 'Precision', 'text');
$dbo->cols['curr_code']->caption->set('default', 'Code', 'text');
$dbo->cols['curr_name']->caption->set('default', 'Currency Name', 'text');
$dbo->cols['curr_symbol']->caption->set('default', 'Symbol', 'text');
$dbo->cols['curr_decimal']->caption->set('default', 'Decimal', 'text');
$dbo->cols['curr_thousand']->caption->set('default', 'Thousand', 'text');
$dbo->cols['curr_precision']->caption->set('default', 'Precision', 'text');
$dbo->cols['curr_format']->caption->set('default', 'Format', 'text');
$dbo->cols['curr_rate']->caption->set('default', 'Rate', 'text');
$dbo->cols['curr_status']->caption->set('default', 'Status', 'text');

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