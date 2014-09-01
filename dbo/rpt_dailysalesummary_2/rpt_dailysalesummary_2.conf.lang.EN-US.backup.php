<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['trimdatetime']->caption->set('default', 'trimdatetime', 'text');
$dbo->cols['js_orgid']->caption->set('default', 'Customer', 'text');
$dbo->cols['rg_code']->caption->set('default', 'Region', 'text');
$dbo->cols['js_currency']->caption->set('default', 'Currency', 'text');
$dbo->cols['totaljob']->caption->set('default', 'Total Job', 'text');
$dbo->cols['totalprice']->caption->set('default', 'Total Price', 'text');
$dbo->cols['inch']->caption->set('default', 'Total Inch <sup>2</sup>', 'text');
$dbo->cols['amtinusd']->caption->set('default', 'Total price in USD', 'text');
$dbo->cols['amtinmyr']->caption->set('default', 'Total price in MYR', 'text');
$dbo->cols['completiondate']->caption->set('default', 'Date', 'text');

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