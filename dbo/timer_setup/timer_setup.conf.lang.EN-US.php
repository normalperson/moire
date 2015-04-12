<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['pmev_id']->caption->set('default', 'pmev_id', 'text');
$dbo->cols['pmev_pmwfid']->caption->set('default', 'pmev_pmwfid', 'text');
$dbo->cols['pmev_pmslid']->caption->set('default', 'pmev_pmslid', 'text');
$dbo->cols['pmev_name']->caption->set('default', 'Timer Name', 'text');
$dbo->cols['pmev_type']->caption->set('default', 'pmev_type', 'text');
$dbo->cols['pmev_type_cat']->caption->set('default', 'pmev_type_cat', 'text');
$dbo->cols['pmev_intermediate_function']->caption->set('default', 'pmev_intermediate_function', 'text');
$dbo->cols['pmev_timer_interval']->caption->set('default', 'Timer Interval', 'text');
$dbo->cols['pmev_timer_workinghours_only']->caption->set('default', 'Follow Working Hour', 'text');
$dbo->cols['pmev_intermediate_show_task']->caption->set('default', 'pmev_intermediate_show_task', 'text');
$dbo->cols['pmev_attach_pmatid']->caption->set('default', 'pmev_attach_pmatid', 'text');
$dbo->cols['pmev_timer_non_interrupt_once']->caption->set('default', 'pmev_timer_non_interrupt_once', 'text');
$dbo->cols['pmev_start_function']->caption->set('default', 'pmev_start_function', 'text');

$dbo->titleList = 'List Timer';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Timer';
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