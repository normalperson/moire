<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['pmat_id']->caption->set('default', 'pmat_id', 'text');
$dbo->cols['pmat_pmwfid']->caption->set('default', 'pmat_pmwfid', 'text');
$dbo->cols['pmat_pmslid']->caption->set('default', 'pmat_pmslid', 'text');
$dbo->cols['pmat_name']->caption->set('default', 'Activity Name', 'text');
$dbo->cols['pmat_type']->caption->set('default', 'pmat_type', 'text');
$dbo->cols['pmat_function']->caption->set('default', 'pmat_function', 'text');
$dbo->cols['pmat_sla_interval']->caption->set('default', 'SLA Timer', 'text');
$dbo->cols['pmat_sla_workinghours_only']->caption->set('default', 'pmat_sla_workinghours_only', 'text');
$dbo->cols['pmat_show_caseinfo']->caption->set('default', 'pmat_show_caseinfo', 'text');

$dbo->titleList = 'List SLA Activity';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit SLA';
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