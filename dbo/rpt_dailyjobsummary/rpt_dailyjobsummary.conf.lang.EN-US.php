<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['js_request_date']->caption->set('default', 'Request date', 'text');
$dbo->cols['totalrequest']->caption->set('default', 'Total request', 'text');
$dbo->cols['totalcomplete']->caption->set('default', 'Total completed', 'text');
$dbo->cols['totalcancel']->caption->set('default', 'Total cancelled', 'text');
$dbo->cols['totalinprogress']->caption->set('default', 'Total in progress', 'text');
$dbo->cols['revertedjob']->caption->set('default', 'Customer Reverted Job', 'text');
$dbo->cols['internalrevertedjob']->caption->set('default', 'Internal Reverted Job', 'text');

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
$dbo->text->listNew = 'New';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->sum = 'Total';
$dbo->text->sumPage = 'Total';
$dbo->text->sumPageGroup = 'Total (Group)';
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average';
$dbo->text->avgPageGroup = 'Average (Group)';

?>