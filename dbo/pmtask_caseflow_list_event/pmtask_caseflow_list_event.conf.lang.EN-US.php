<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['pmc_id']->caption->set('default', 'Case ID', 'text');
$dbo->cols['pmc_created_date']->caption->set('default', 'Case Created Date', 'text');
$dbo->cols['pmc_created_by']->caption->set('default', 'Case Created By', 'text');
$dbo->cols['pmc_casekey']->caption->set('default', 'Case Description', 'text');
$dbo->cols['pmc_casetype']->caption->set('default', 'pmc_casetype', 'text');
$dbo->cols['pmc_parentid']->caption->set('default', 'pmc_parentid', 'text');
$dbo->cols['pmc_pmwfid']->caption->set('default', 'pmc_pmwfid', 'text');
$dbo->cols['pmc_start_pmevid']->caption->set('default', 'pmc_start_pmevid', 'text');
$dbo->cols['pmc_start_date']->caption->set('default', 'pmc_start_date', 'text');
$dbo->cols['pmc_end_pmevid']->caption->set('default', 'pmc_end_pmevid', 'text');
$dbo->cols['pmc_end_date']->caption->set('default', 'pmc_end_date', 'text');
$dbo->cols['pmc_closed']->caption->set('default', 'pmc_closed', 'text');
$dbo->cols['pmf_id']->caption->set('default', 'pmf_id', 'text');
$dbo->cols['pmf_pmcid']->caption->set('default', 'pmf_pmcid', 'text');
$dbo->cols['pmf_obj_id']->caption->set('default', 'pmf_obj_id', 'text');
$dbo->cols['pmf_obj_type']->caption->set('default', 'pmf_obj_type', 'text');
$dbo->cols['pmf_previd']->caption->set('default', 'pmf_previd', 'text');
$dbo->cols['pmf_prev_pmcnid']->caption->set('default', 'pmf_prev_pmcnid', 'text');
$dbo->cols['pmf_start_date']->caption->set('default', 'Activity Start Date', 'text');
$dbo->cols['pmf_end_date']->caption->set('default', 'pmf_end_date', 'text');
$dbo->cols['pmf_end_status']->caption->set('default', 'pmf_end_status', 'text');
$dbo->cols['pmf_due_date']->caption->set('default', 'Activity Due Date', 'text');
$dbo->cols['pmf_last_perform_date']->caption->set('default', 'pmf_last_perform_date', 'text');
$dbo->cols['pmf_token_pmgwid']->caption->set('default', 'pmf_token_pmgwid', 'text');
$dbo->cols['pmf_token_return_pmgwid']->caption->set('default', 'pmf_token_return_pmgwid', 'text');
$dbo->cols['urgency']->caption->set('default', ' ', 'text');
$dbo->cols['actions']->caption->set('default', 'Actions', 'text');
$dbo->cols['pmf_specific_userid']->caption->set('default', 'pmf_specific_userid', 'text');
$dbo->cols['pmf_end_by']->caption->set('default', 'pmf_end_by', 'text');
$dbo->cols['pmf_end_pmfid']->caption->set('default', 'pmf_end_pmfid', 'text');
$dbo->cols['pmf_from_event_gateway']->caption->set('default', 'pmf_from_event_gateway', 'text');
$dbo->cols['pmf_last_timer_check_date']->caption->set('default', 'pmf_last_timer_check_date', 'text');
$dbo->cols['pmf_timer_due_date']->caption->set('default', 'pmf_timer_due_date', 'text');
$dbo->cols['pmf_timer_due_count']->caption->set('default', 'pmf_timer_due_count', 'text');

$dbo->titleList = ' ';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Cancel';
$dbo->text->searchSubmit = 'Submit';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Submit';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Back';
$dbo->text->detailDelete = 'Delete';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>