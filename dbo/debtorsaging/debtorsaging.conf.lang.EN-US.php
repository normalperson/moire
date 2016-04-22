<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['iv_id']->caption->set('default', 'iv_id', 'text');
$dbo->cols['iv_invoicedate']->caption->set('default', 'iv_invoicedate', 'text');
$dbo->cols['iv_created']->caption->set('default', 'iv_created', 'text');
$dbo->cols['iv_orgid']->caption->set('default', 'Customer', 'text');
$dbo->cols['iv_amount']->caption->set('default', 'iv_amount', 'text');
$dbo->cols['iv_paid']->caption->set('default', 'iv_paid', 'text');
$dbo->cols['iv_paydate']->caption->set('default', 'iv_paydate', 'text');
$dbo->cols['age1']->caption->set('default', '1 Month Aging', 'text');
$dbo->cols['age2']->caption->set('default', '2 Month Aging', 'text');
$dbo->cols['agemt2']->caption->set('default', '>2 Month Aging', 'text');

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