<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'pmtask_caseflow_list_event';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcpmcaseflow';
$dbo->key = array('pmf_id', 'pmf_pmcid');
$dbo->sql = 'select a.*,b.*,\'\' as urgency, \'\' as actions from fcpmcase a join fcpmcaseflow b on pmf_pmcid=pmc_id 
	where pmf_obj_id = 2 and pmf_obj_type = \'PM_Event\' and pmf_end_date is null
	and (pmf_specific_userid is null or (pmf_specific_userid is not null and pmf_specific_userid = \'admin\')) order by pmf_due_date, pmf_id';
$dbo->col = array('pmc_id', 'pmc_created_date', 'pmc_created_by', 'pmc_casekey', 'pmc_casetype', 'pmc_parentid', 'pmc_pmwfid', 'pmc_start_pmevid', 'pmc_start_date', 'pmc_end_pmevid', 'pmc_end_date', 'pmc_closed', 'pmf_id', 'pmf_pmcid', 'pmf_obj_id', 'pmf_obj_type', 'pmf_previd', 'pmf_prev_pmcnid', 'pmf_start_date', 'pmf_end_date', 'pmf_end_status', 'pmf_due_date', 'pmf_last_perform_date', 'pmf_specific_userid', 'pmf_end_by', 'pmf_end_pmfid', 'pmf_from_event_gateway', 'urgency', 'actions');
$dbo->colList = array('urgency', 'pmc_id', 'pmc_casekey', 'pmc_created_date', 'pmc_created_by', 'pmf_start_date', 'pmf_due_date', 'actions');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('pmc_id', 'pmc_created_date', 'pmc_created_by', 'pmc_casekey', 'pmc_casetype', 'pmc_parentid', 'pmc_pmwfid', 'pmc_start_pmevid', 'pmc_start_date', 'pmc_end_pmevid', 'pmc_end_date', 'pmc_closed', 'pmf_id', 'pmf_pmcid', 'pmf_obj_id', 'pmf_obj_type', 'pmf_previd', 'pmf_prev_pmcnid', 'pmf_start_date', 'pmf_end_date', 'pmf_end_status', 'pmf_due_date', 'pmf_last_perform_date');
$dbo->colNew = array('pmc_id', 'pmc_created_date', 'pmc_created_by', 'pmc_casekey', 'pmc_casetype', 'pmc_parentid', 'pmc_pmwfid', 'pmc_start_pmevid', 'pmc_start_date', 'pmc_end_pmevid', 'pmc_end_date', 'pmc_closed', 'pmf_id', 'pmf_pmcid', 'pmf_obj_id', 'pmf_obj_type', 'pmf_previd', 'pmf_prev_pmcnid', 'pmf_start_date', 'pmf_end_date', 'pmf_end_status', 'pmf_due_date', 'pmf_last_perform_date');
$dbo->colEdit = array('pmc_id', 'pmc_created_date', 'pmc_created_by', 'pmc_casekey', 'pmc_casetype', 'pmc_parentid', 'pmc_pmwfid', 'pmc_start_pmevid', 'pmc_start_date', 'pmc_end_pmevid', 'pmc_end_date', 'pmc_closed', 'pmf_id', 'pmf_pmcid', 'pmf_obj_id', 'pmf_obj_type', 'pmf_previd', 'pmf_prev_pmcnid', 'pmf_start_date', 'pmf_end_date', 'pmf_end_status', 'pmf_due_date', 'pmf_last_perform_date');
$dbo->colSearch = array('pmc_id', 'pmc_created_date', 'pmc_created_by', 'pmc_casekey', 'pmc_casetype', 'pmc_parentid', 'pmc_pmwfid', 'pmc_start_pmevid', 'pmc_start_date', 'pmc_end_pmevid', 'pmc_end_date', 'pmc_closed', 'pmf_id', 'pmf_pmcid', 'pmf_obj_id', 'pmf_obj_type', 'pmf_previd', 'pmf_prev_pmcnid', 'pmf_start_date', 'pmf_end_date', 'pmf_end_status', 'pmf_due_date', 'pmf_last_perform_date');
$dbo->colExport = array('pmc_id', 'pmc_created_date', 'pmc_created_by', 'pmc_casekey', 'pmc_casetype', 'pmc_parentid', 'pmc_pmwfid', 'pmc_start_pmevid', 'pmc_start_date', 'pmc_end_pmevid', 'pmc_end_date', 'pmc_closed', 'pmf_id', 'pmf_pmcid', 'pmf_obj_id', 'pmf_obj_type', 'pmf_previd', 'pmf_prev_pmcnid', 'pmf_start_date', 'pmf_end_date', 'pmf_end_status', 'pmf_due_date', 'pmf_last_perform_date');
$dbo->colSort = array();
$dbo->canSearch = false;
$dbo->canNew = false;
$dbo->canEdit = false;
$dbo->canDelete = false;
$dbo->canDetail = false;
$dbo->canListEdit = false;
$dbo->canListNew = false;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->titleList = ' ';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'metro';
$dbo->layout = 'AlwaysList';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

$dbo->cols['pmc_id'] = new DBO_COL('pmc_id', 'int4', '4', '-1');
$dbo->cols['pmc_id']->inputTypeDefault = 'text';
$dbo->cols['pmc_id']->searchMode = 'exact';
$dbo->cols['pmc_id']->capContClassDefault = array();
$dbo->cols['pmc_id']->valContClassDefault = array();
$dbo->cols['pmc_id']->option->defaultMethod = 'text';
$dbo->cols['pmc_id']->option->searchMethod = 'text';
$dbo->cols['pmc_id']->option->listMethod = 'text';
$dbo->cols['pmc_id']->option->detailMethod = 'text';
$dbo->cols['pmc_id']->option->newMethod = 'text';
$dbo->cols['pmc_id']->option->editMethod = 'text';
$dbo->cols['pmc_id']->displayListModifierMethod = 'phpfunc';
$dbo->cols['pmc_id']->displayListModifier = 'showcaselink';
$dbo->cols['pmc_created_date'] = new DBO_COL('pmc_created_date', 'timestamptz', '8', '-1');
$dbo->cols['pmc_created_date']->inputTypeDefault = 'text';
$dbo->cols['pmc_created_date']->searchMode = 'exact';
$dbo->cols['pmc_created_date']->capContClassDefault = array();
$dbo->cols['pmc_created_date']->valContClassDefault = array();
$dbo->cols['pmc_created_date']->option->defaultMethod = 'text';
$dbo->cols['pmc_created_date']->option->searchMethod = 'text';
$dbo->cols['pmc_created_date']->option->listMethod = 'text';
$dbo->cols['pmc_created_date']->option->detailMethod = 'text';
$dbo->cols['pmc_created_date']->option->newMethod = 'text';
$dbo->cols['pmc_created_date']->option->editMethod = 'text';
$dbo->cols['pmc_created_by'] = new DBO_COL('pmc_created_by', 'varchar', '-1', '104');
$dbo->cols['pmc_created_by']->inputTypeDefault = 'text';
$dbo->cols['pmc_created_by']->searchMode = 'exact';
$dbo->cols['pmc_created_by']->capContClassDefault = array();
$dbo->cols['pmc_created_by']->valContClassDefault = array();
$dbo->cols['pmc_created_by']->option->defaultMethod = 'text';
$dbo->cols['pmc_created_by']->option->searchMethod = 'text';
$dbo->cols['pmc_created_by']->option->listMethod = 'text';
$dbo->cols['pmc_created_by']->option->detailMethod = 'text';
$dbo->cols['pmc_created_by']->option->newMethod = 'text';
$dbo->cols['pmc_created_by']->option->editMethod = 'text';
$dbo->cols['pmc_casekey'] = new DBO_COL('pmc_casekey', 'int4', '4', '-1');
$dbo->cols['pmc_casekey']->displayListModifierMethod = 'phpfunc';
$dbo->cols['pmc_casekey']->displayListModifier = 'showcasedescription';
$dbo->cols['pmc_casekey']->inputTypeDefault = 'text';
$dbo->cols['pmc_casekey']->searchMode = 'exact';
$dbo->cols['pmc_casekey']->capContClassDefault = array();
$dbo->cols['pmc_casekey']->valContClassDefault = array();
$dbo->cols['pmc_casekey']->option->defaultMethod = 'text';
$dbo->cols['pmc_casekey']->option->searchMethod = 'text';
$dbo->cols['pmc_casekey']->option->listMethod = 'text';
$dbo->cols['pmc_casekey']->option->detailMethod = 'text';
$dbo->cols['pmc_casekey']->option->newMethod = 'text';
$dbo->cols['pmc_casekey']->option->editMethod = 'text';
$dbo->cols['pmc_casetype'] = new DBO_COL('pmc_casetype', 'varchar', '-1', '36');
$dbo->cols['pmc_casetype']->inputTypeDefault = 'text';
$dbo->cols['pmc_casetype']->searchMode = 'exact';
$dbo->cols['pmc_casetype']->capContClassDefault = array();
$dbo->cols['pmc_casetype']->valContClassDefault = array();
$dbo->cols['pmc_casetype']->option->defaultMethod = 'text';
$dbo->cols['pmc_casetype']->option->searchMethod = 'text';
$dbo->cols['pmc_casetype']->option->listMethod = 'text';
$dbo->cols['pmc_casetype']->option->detailMethod = 'text';
$dbo->cols['pmc_casetype']->option->newMethod = 'text';
$dbo->cols['pmc_casetype']->option->editMethod = 'text';
$dbo->cols['pmc_parentid'] = new DBO_COL('pmc_parentid', 'int4', '4', '-1');
$dbo->cols['pmc_parentid']->inputTypeDefault = 'text';
$dbo->cols['pmc_parentid']->searchMode = 'exact';
$dbo->cols['pmc_parentid']->capContClassDefault = array();
$dbo->cols['pmc_parentid']->valContClassDefault = array();
$dbo->cols['pmc_parentid']->option->defaultMethod = 'text';
$dbo->cols['pmc_parentid']->option->searchMethod = 'text';
$dbo->cols['pmc_parentid']->option->listMethod = 'text';
$dbo->cols['pmc_parentid']->option->detailMethod = 'text';
$dbo->cols['pmc_parentid']->option->newMethod = 'text';
$dbo->cols['pmc_parentid']->option->editMethod = 'text';
$dbo->cols['pmc_pmwfid'] = new DBO_COL('pmc_pmwfid', 'int4', '4', '-1');
$dbo->cols['pmc_pmwfid']->inputTypeDefault = 'text';
$dbo->cols['pmc_pmwfid']->searchMode = 'exact';
$dbo->cols['pmc_pmwfid']->capContClassDefault = array();
$dbo->cols['pmc_pmwfid']->valContClassDefault = array();
$dbo->cols['pmc_pmwfid']->option->defaultMethod = 'text';
$dbo->cols['pmc_pmwfid']->option->searchMethod = 'text';
$dbo->cols['pmc_pmwfid']->option->listMethod = 'text';
$dbo->cols['pmc_pmwfid']->option->detailMethod = 'text';
$dbo->cols['pmc_pmwfid']->option->newMethod = 'text';
$dbo->cols['pmc_pmwfid']->option->editMethod = 'text';
$dbo->cols['pmc_start_pmevid'] = new DBO_COL('pmc_start_pmevid', 'int4', '4', '-1');
$dbo->cols['pmc_start_pmevid']->inputTypeDefault = 'text';
$dbo->cols['pmc_start_pmevid']->searchMode = 'exact';
$dbo->cols['pmc_start_pmevid']->capContClassDefault = array();
$dbo->cols['pmc_start_pmevid']->valContClassDefault = array();
$dbo->cols['pmc_start_pmevid']->option->defaultMethod = 'text';
$dbo->cols['pmc_start_pmevid']->option->searchMethod = 'text';
$dbo->cols['pmc_start_pmevid']->option->listMethod = 'text';
$dbo->cols['pmc_start_pmevid']->option->detailMethod = 'text';
$dbo->cols['pmc_start_pmevid']->option->newMethod = 'text';
$dbo->cols['pmc_start_pmevid']->option->editMethod = 'text';
$dbo->cols['pmc_start_date'] = new DBO_COL('pmc_start_date', 'timestamptz', '8', '-1');
$dbo->cols['pmc_start_date']->inputTypeDefault = 'text';
$dbo->cols['pmc_start_date']->searchMode = 'exact';
$dbo->cols['pmc_start_date']->capContClassDefault = array();
$dbo->cols['pmc_start_date']->valContClassDefault = array();
$dbo->cols['pmc_start_date']->option->defaultMethod = 'text';
$dbo->cols['pmc_start_date']->option->searchMethod = 'text';
$dbo->cols['pmc_start_date']->option->listMethod = 'text';
$dbo->cols['pmc_start_date']->option->detailMethod = 'text';
$dbo->cols['pmc_start_date']->option->newMethod = 'text';
$dbo->cols['pmc_start_date']->option->editMethod = 'text';
$dbo->cols['pmc_end_pmevid'] = new DBO_COL('pmc_end_pmevid', 'int4', '4', '-1');
$dbo->cols['pmc_end_pmevid']->inputTypeDefault = 'text';
$dbo->cols['pmc_end_pmevid']->searchMode = 'exact';
$dbo->cols['pmc_end_pmevid']->capContClassDefault = array();
$dbo->cols['pmc_end_pmevid']->valContClassDefault = array();
$dbo->cols['pmc_end_pmevid']->option->defaultMethod = 'text';
$dbo->cols['pmc_end_pmevid']->option->searchMethod = 'text';
$dbo->cols['pmc_end_pmevid']->option->listMethod = 'text';
$dbo->cols['pmc_end_pmevid']->option->detailMethod = 'text';
$dbo->cols['pmc_end_pmevid']->option->newMethod = 'text';
$dbo->cols['pmc_end_pmevid']->option->editMethod = 'text';
$dbo->cols['pmc_end_date'] = new DBO_COL('pmc_end_date', 'timestamptz', '8', '-1');
$dbo->cols['pmc_end_date']->inputTypeDefault = 'text';
$dbo->cols['pmc_end_date']->searchMode = 'exact';
$dbo->cols['pmc_end_date']->capContClassDefault = array();
$dbo->cols['pmc_end_date']->valContClassDefault = array();
$dbo->cols['pmc_end_date']->option->defaultMethod = 'text';
$dbo->cols['pmc_end_date']->option->searchMethod = 'text';
$dbo->cols['pmc_end_date']->option->listMethod = 'text';
$dbo->cols['pmc_end_date']->option->detailMethod = 'text';
$dbo->cols['pmc_end_date']->option->newMethod = 'text';
$dbo->cols['pmc_end_date']->option->editMethod = 'text';
$dbo->cols['pmc_closed'] = new DBO_COL('pmc_closed', 'varchar', '-1', '5');
$dbo->cols['pmc_closed']->inputTypeDefault = 'text';
$dbo->cols['pmc_closed']->searchMode = 'exact';
$dbo->cols['pmc_closed']->capContClassDefault = array();
$dbo->cols['pmc_closed']->valContClassDefault = array();
$dbo->cols['pmc_closed']->option->defaultMethod = 'text';
$dbo->cols['pmc_closed']->option->searchMethod = 'text';
$dbo->cols['pmc_closed']->option->listMethod = 'text';
$dbo->cols['pmc_closed']->option->detailMethod = 'text';
$dbo->cols['pmc_closed']->option->newMethod = 'text';
$dbo->cols['pmc_closed']->option->editMethod = 'text';
$dbo->cols['pmf_id'] = new DBO_COL('pmf_id', 'int4', '4', '-1');
$dbo->cols['pmf_id']->inputTypeDefault = 'text';
$dbo->cols['pmf_id']->searchMode = 'exact';
$dbo->cols['pmf_id']->capContClassDefault = array();
$dbo->cols['pmf_id']->valContClassDefault = array();
$dbo->cols['pmf_id']->option->defaultMethod = 'text';
$dbo->cols['pmf_id']->option->searchMethod = 'text';
$dbo->cols['pmf_id']->option->listMethod = 'text';
$dbo->cols['pmf_id']->option->detailMethod = 'text';
$dbo->cols['pmf_id']->option->newMethod = 'text';
$dbo->cols['pmf_id']->option->editMethod = 'text';
$dbo->cols['pmf_pmcid'] = new DBO_COL('pmf_pmcid', 'int4', '4', '-1');
$dbo->cols['pmf_pmcid']->inputTypeDefault = 'text';
$dbo->cols['pmf_pmcid']->searchMode = 'exact';
$dbo->cols['pmf_pmcid']->capContClassDefault = array();
$dbo->cols['pmf_pmcid']->valContClassDefault = array();
$dbo->cols['pmf_pmcid']->option->defaultMethod = 'text';
$dbo->cols['pmf_pmcid']->option->searchMethod = 'text';
$dbo->cols['pmf_pmcid']->option->listMethod = 'text';
$dbo->cols['pmf_pmcid']->option->detailMethod = 'text';
$dbo->cols['pmf_pmcid']->option->newMethod = 'text';
$dbo->cols['pmf_pmcid']->option->editMethod = 'text';
$dbo->cols['pmf_obj_id'] = new DBO_COL('pmf_obj_id', 'int4', '4', '-1');
$dbo->cols['pmf_obj_id']->inputTypeDefault = 'text';
$dbo->cols['pmf_obj_id']->searchMode = 'exact';
$dbo->cols['pmf_obj_id']->capContClassDefault = array();
$dbo->cols['pmf_obj_id']->valContClassDefault = array();
$dbo->cols['pmf_obj_id']->option->defaultMethod = 'text';
$dbo->cols['pmf_obj_id']->option->searchMethod = 'text';
$dbo->cols['pmf_obj_id']->option->listMethod = 'text';
$dbo->cols['pmf_obj_id']->option->detailMethod = 'text';
$dbo->cols['pmf_obj_id']->option->newMethod = 'text';
$dbo->cols['pmf_obj_id']->option->editMethod = 'text';
$dbo->cols['pmf_obj_type'] = new DBO_COL('pmf_obj_type', 'varchar', '-1', '104');
$dbo->cols['pmf_obj_type']->inputTypeDefault = 'text';
$dbo->cols['pmf_obj_type']->searchMode = 'exact';
$dbo->cols['pmf_obj_type']->capContClassDefault = array();
$dbo->cols['pmf_obj_type']->valContClassDefault = array();
$dbo->cols['pmf_obj_type']->option->defaultMethod = 'text';
$dbo->cols['pmf_obj_type']->option->searchMethod = 'text';
$dbo->cols['pmf_obj_type']->option->listMethod = 'text';
$dbo->cols['pmf_obj_type']->option->detailMethod = 'text';
$dbo->cols['pmf_obj_type']->option->newMethod = 'text';
$dbo->cols['pmf_obj_type']->option->editMethod = 'text';
$dbo->cols['pmf_previd'] = new DBO_COL('pmf_previd', 'int4', '4', '-1');
$dbo->cols['pmf_previd']->inputTypeDefault = 'text';
$dbo->cols['pmf_previd']->searchMode = 'exact';
$dbo->cols['pmf_previd']->capContClassDefault = array();
$dbo->cols['pmf_previd']->valContClassDefault = array();
$dbo->cols['pmf_previd']->option->defaultMethod = 'text';
$dbo->cols['pmf_previd']->option->searchMethod = 'text';
$dbo->cols['pmf_previd']->option->listMethod = 'text';
$dbo->cols['pmf_previd']->option->detailMethod = 'text';
$dbo->cols['pmf_previd']->option->newMethod = 'text';
$dbo->cols['pmf_previd']->option->editMethod = 'text';
$dbo->cols['pmf_prev_pmcnid'] = new DBO_COL('pmf_prev_pmcnid', 'int4', '4', '-1');
$dbo->cols['pmf_prev_pmcnid']->inputTypeDefault = 'text';
$dbo->cols['pmf_prev_pmcnid']->searchMode = 'exact';
$dbo->cols['pmf_prev_pmcnid']->capContClassDefault = array();
$dbo->cols['pmf_prev_pmcnid']->valContClassDefault = array();
$dbo->cols['pmf_prev_pmcnid']->option->defaultMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->searchMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->listMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->detailMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->newMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->editMethod = 'text';
$dbo->cols['pmf_start_date'] = new DBO_COL('pmf_start_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_start_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_start_date']->searchMode = 'exact';
$dbo->cols['pmf_start_date']->capContClassDefault = array();
$dbo->cols['pmf_start_date']->valContClassDefault = array();
$dbo->cols['pmf_start_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_start_date']->option->searchMethod = 'text';
$dbo->cols['pmf_start_date']->option->listMethod = 'text';
$dbo->cols['pmf_start_date']->option->detailMethod = 'text';
$dbo->cols['pmf_start_date']->option->newMethod = 'text';
$dbo->cols['pmf_start_date']->option->editMethod = 'text';
$dbo->cols['pmf_end_date'] = new DBO_COL('pmf_end_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_end_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_end_date']->searchMode = 'exact';
$dbo->cols['pmf_end_date']->capContClassDefault = array();
$dbo->cols['pmf_end_date']->valContClassDefault = array();
$dbo->cols['pmf_end_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_end_date']->option->searchMethod = 'text';
$dbo->cols['pmf_end_date']->option->listMethod = 'text';
$dbo->cols['pmf_end_date']->option->detailMethod = 'text';
$dbo->cols['pmf_end_date']->option->newMethod = 'text';
$dbo->cols['pmf_end_date']->option->editMethod = 'text';
$dbo->cols['pmf_end_status'] = new DBO_COL('pmf_end_status', 'varchar', '-1', '36');
$dbo->cols['pmf_end_status']->inputTypeDefault = 'text';
$dbo->cols['pmf_end_status']->searchMode = 'exact';
$dbo->cols['pmf_end_status']->capContClassDefault = array();
$dbo->cols['pmf_end_status']->valContClassDefault = array();
$dbo->cols['pmf_end_status']->option->defaultMethod = 'text';
$dbo->cols['pmf_end_status']->option->searchMethod = 'text';
$dbo->cols['pmf_end_status']->option->listMethod = 'text';
$dbo->cols['pmf_end_status']->option->detailMethod = 'text';
$dbo->cols['pmf_end_status']->option->newMethod = 'text';
$dbo->cols['pmf_end_status']->option->editMethod = 'text';
$dbo->cols['pmf_due_date'] = new DBO_COL('pmf_due_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_due_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_due_date']->searchMode = 'exact';
$dbo->cols['pmf_due_date']->capContClassDefault = array();
$dbo->cols['pmf_due_date']->valContClassDefault = array();
$dbo->cols['pmf_due_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_due_date']->option->searchMethod = 'text';
$dbo->cols['pmf_due_date']->option->listMethod = 'text';
$dbo->cols['pmf_due_date']->option->detailMethod = 'text';
$dbo->cols['pmf_due_date']->option->newMethod = 'text';
$dbo->cols['pmf_due_date']->option->editMethod = 'text';
$dbo->cols['pmf_last_perform_date'] = new DBO_COL('pmf_last_perform_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_last_perform_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_last_perform_date']->searchMode = 'exact';
$dbo->cols['pmf_last_perform_date']->capContClassDefault = array();
$dbo->cols['pmf_last_perform_date']->valContClassDefault = array();
$dbo->cols['pmf_last_perform_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->searchMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->listMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->detailMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->newMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->editMethod = 'text';
$dbo->cols['pmf_token_pmgwid'] = new DBO_COL('pmf_token_pmgwid', 'int4', '4', '-1');
$dbo->cols['pmf_token_pmgwid']->inputTypeDefault = 'text';
$dbo->cols['pmf_token_pmgwid']->searchMode = 'exact';
$dbo->cols['pmf_token_pmgwid']->capContClassDefault = array();
$dbo->cols['pmf_token_pmgwid']->valContClassDefault = array();
$dbo->cols['pmf_token_pmgwid']->option->defaultMethod = 'text';
$dbo->cols['pmf_token_pmgwid']->option->searchMethod = 'text';
$dbo->cols['pmf_token_pmgwid']->option->listMethod = 'text';
$dbo->cols['pmf_token_pmgwid']->option->detailMethod = 'text';
$dbo->cols['pmf_token_pmgwid']->option->newMethod = 'text';
$dbo->cols['pmf_token_pmgwid']->option->editMethod = 'text';
$dbo->cols['pmf_token_return_pmgwid'] = new DBO_COL('pmf_token_return_pmgwid', 'int4', '4', '-1');
$dbo->cols['pmf_token_return_pmgwid']->inputTypeDefault = 'text';
$dbo->cols['pmf_token_return_pmgwid']->searchMode = 'exact';
$dbo->cols['pmf_token_return_pmgwid']->capContClassDefault = array();
$dbo->cols['pmf_token_return_pmgwid']->valContClassDefault = array();
$dbo->cols['pmf_token_return_pmgwid']->option->defaultMethod = 'text';
$dbo->cols['pmf_token_return_pmgwid']->option->searchMethod = 'text';
$dbo->cols['pmf_token_return_pmgwid']->option->listMethod = 'text';
$dbo->cols['pmf_token_return_pmgwid']->option->detailMethod = 'text';
$dbo->cols['pmf_token_return_pmgwid']->option->newMethod = 'text';
$dbo->cols['pmf_token_return_pmgwid']->option->editMethod = 'text';
$dbo->cols['urgency'] = new DBO_COL('urgency', 'unknown', '-2', '-1');
$dbo->cols['urgency']->displayListModifierMethod = 'phpfunc';
$dbo->cols['urgency']->displayListModifier = 'showurgency';
$dbo->cols['urgency']->inputTypeDefault = 'text';
$dbo->cols['urgency']->searchMode = 'exact';
$dbo->cols['urgency']->capContClassDefault = array();
$dbo->cols['urgency']->valContClassDefault = array();
$dbo->cols['urgency']->option->defaultMethod = 'text';
$dbo->cols['urgency']->option->searchMethod = 'text';
$dbo->cols['urgency']->option->listMethod = 'text';
$dbo->cols['urgency']->option->detailMethod = 'text';
$dbo->cols['urgency']->option->newMethod = 'text';
$dbo->cols['urgency']->option->editMethod = 'text';
$dbo->cols['actions'] = new DBO_COL('actions', 'unknown', '-2', '-1');
$dbo->cols['actions']->displayListModifierMethod = 'phpfunc';
$dbo->cols['actions']->displayListModifier = 'showactions';
$dbo->cols['actions']->inputTypeDefault = 'text';
$dbo->cols['actions']->searchMode = 'exact';
$dbo->cols['actions']->capContClassDefault = array();
$dbo->cols['actions']->valContClassDefault = array();
$dbo->cols['actions']->option->defaultMethod = 'text';
$dbo->cols['actions']->option->searchMethod = 'text';
$dbo->cols['actions']->option->listMethod = 'text';
$dbo->cols['actions']->option->detailMethod = 'text';
$dbo->cols['actions']->option->newMethod = 'text';
$dbo->cols['actions']->option->editMethod = 'text';
$dbo->cols['pmf_specific_userid'] = new DBO_COL('pmf_specific_userid', 'varchar', '-1', '104');
$dbo->cols['pmf_specific_userid']->capContClassDefault = array();
$dbo->cols['pmf_specific_userid']->valContClassDefault = array();
$dbo->cols['pmf_end_by'] = new DBO_COL('pmf_end_by', 'varchar', '-1', '104');
$dbo->cols['pmf_end_by']->capContClassDefault = array();
$dbo->cols['pmf_end_by']->valContClassDefault = array();
$dbo->cols['pmf_end_pmfid'] = new DBO_COL('pmf_end_pmfid', 'int4', '4', '-1');
$dbo->cols['pmf_end_pmfid']->capContClassDefault = array();
$dbo->cols['pmf_end_pmfid']->valContClassDefault = array();
$dbo->cols['pmf_from_event_gateway'] = new DBO_COL('pmf_from_event_gateway', 'varchar', '-1', '5');
$dbo->cols['pmf_from_event_gateway']->capContClassDefault = array();
$dbo->cols['pmf_from_event_gateway']->valContClassDefault = array();

// support multiple language. only caption
global $LANG;
if(file_exists(dirname(__FILE__).DIRECTORY_SEPARATOR.$dbo->id.'.conf.lang.'.$LANG.'.php')){
	require(dirname(__FILE__).DIRECTORY_SEPARATOR.$dbo->id.'.conf.lang.'.$LANG.'.php');
}else if($availang = glob(dirname(__FILE__).DIRECTORY_SEPARATOR.$dboID.'.conf.lang.*')){
	require($availang[0]);
}

// for DBO Builder
$dbo->saveDir = dirname(dirname(__FILE__));

$dbo->run();

/*
$dbo->newModifier = 'dbo_pmtask_caseflow_list_event_custom_new';
function dbo_pmtask_caseflow_list_event_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_pmtask_caseflow_list_event_custom_edit';
function dbo_pmtask_caseflow_list_event_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_pmtask_caseflow_list_event_custom_search';
function dbo_pmtask_caseflow_list_event_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_pmtask_caseflow_list_event_custom_delete';
function dbo_pmtask_caseflow_list_event_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_pmtask_caseflow_list_event_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>