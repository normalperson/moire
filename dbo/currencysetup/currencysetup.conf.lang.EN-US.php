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