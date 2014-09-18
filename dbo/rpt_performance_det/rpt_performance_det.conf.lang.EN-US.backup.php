<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['pmf_id']->caption->set('default', 'pmf_id', 'text');
$dbo->cols['actvname']->caption->set('default', 'Task', 'text');
$dbo->cols['pmf_start_date']->caption->set('default', 'Start date', 'text');
$dbo->cols['pmf_due_date']->caption->set('default', 'Due date', 'text');
$dbo->cols['pmf_end_date']->caption->set('default', 'End date', 'text');
$dbo->cols['timediff']->caption->set('default', 'Time different', 'text');
$dbo->cols['pmf_pmcid']->caption->set('default', 'pmf_pmcid', 'text');
$dbo->cols['pmf_obj_id']->caption->set('default', 'pmf_obj_id', 'text');
$dbo->cols['pmf_obj_type']->caption->set('default', 'pmf_obj_type', 'text');
$dbo->cols['pmf_previd']->caption->set('default', 'pmf_previd', 'text');
$dbo->cols['pmf_prev_pmcnid']->caption->set('default', 'pmf_prev_pmcnid', 'text');
$dbo->cols['pmf_end_status']->caption->set('default', 'pmf_end_status', 'text');
$dbo->cols['pmf_last_perform_date']->caption->set('default', 'pmf_last_perform_date', 'text');
$dbo->cols['pmf_end_by']->caption->set('default', 'pmf_end_by', 'text');
$dbo->cols['pmf_end_pmfid']->caption->set('default', 'pmf_end_pmfid', 'text');
$dbo->cols['pmf_from_event_gateway']->caption->set('default', 'pmf_from_event_gateway', 'text');
$dbo->cols['pmf_last_timer_check_date']->caption->set('default', 'pmf_last_timer_check_date', 'text');
$dbo->cols['pmf_timer_due_date']->caption->set('default', 'pmf_timer_due_date', 'text');
$dbo->cols['pmf_timer_due_count']->caption->set('default', 'pmf_timer_due_count', 'text');
$dbo->cols['usr_name']->caption->set('default', 'User', 'text');
$dbo->cols['js_code']->caption->set('default', 'Job code', 'text');
$dbo->cols['js_description']->caption->set('default', 'Job description', 'text');

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
$dbo->text->sumPage = 'Total (Page)';
$dbo->text->sumPageGroup = 'Total (Group)';
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average (Page)';
$dbo->text->avgPageGroup = 'Average (Group)';

?>