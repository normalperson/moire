<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['pay_id']->caption->set('default', 'ID', 'text');
$dbo->cols['pay_created']->caption->set('default', 'Record Time', 'text');
$dbo->cols['pay_amount']->caption->set('default', 'Amount', 'text');
$dbo->cols['pay_allocatedamount']->caption->set('default', 'Allocated Amount', 'text');
$dbo->cols['pay_orgid']->caption->set('default', 'Company', 'text');
$dbo->cols['ivids']->caption->set('default', 'ivids', 'text');

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