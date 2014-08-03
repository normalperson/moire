<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['completiondate']->caption->set('default', 'Date', 'text');
$dbo->cols['astotaljob']->caption->set('default', 'Asia Total Job', 'text');
$dbo->cols['astotalprice']->caption->set('default', 'Asia Total Price (USD)', 'text');
$dbo->cols['astotalinch']->caption->set('default', 'Asia Total Inch<sup>2</sup>', 'text');
$dbo->cols['eutotaljob']->caption->set('default', 'Euro Total Job', 'text');
$dbo->cols['eutotalprice']->caption->set('default', 'Euro Total Price(USD)', 'text');
$dbo->cols['eutotalinch']->caption->set('default', 'Euro Total Inch<sup>2</sup>', 'text');
$dbo->cols['lctotaljob']->caption->set('default', 'Local Total Job', 'text');
$dbo->cols['lctotalprice']->caption->set('default', 'Local Total Price (MYR)', 'text');
$dbo->cols['lctotalinch']->caption->set('default', 'Local Total Inch<sup>2</sup>', 'text');
$dbo->cols['totalpriceinmyr']->caption->set('default', 'Total price in MYR', 'text');
$dbo->cols['totalpriceinusd']->caption->set('default', 'Total price in USD', 'text');

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
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average';

?>