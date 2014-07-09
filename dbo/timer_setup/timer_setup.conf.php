<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'timer_setup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'fcpmevent';
$dbo->key = array('pmev_id');
$dbo->sql = 'select * from fcpmevent where pmev_type =\'TIMER\' or (pmev_type = \'INTERMEDIATE\' and pmev_intermediate_show_task = \'Y\') order by pmev_name';
$dbo->col = array('pmev_id', 'pmev_pmwfid', 'pmev_pmslid', 'pmev_name', 'pmev_type', 'pmev_type_cat', 'pmev_intermediate_function', 'pmev_timer_interval', 'pmev_timer_workinghours_only', 'pmev_intermediate_show_task', 'pmev_attach_pmatid', 'pmev_timer_non_interrupt_once', 'pmev_start_function', 'pmev_performed_message');
$dbo->colList = array('pmev_name', 'pmev_timer_interval', 'pmev_timer_workinghours_only');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('pmev_id', 'pmev_pmwfid', 'pmev_pmslid', 'pmev_name', 'pmev_type', 'pmev_type_cat', 'pmev_intermediate_function', 'pmev_timer_interval', 'pmev_timer_workinghours_only', 'pmev_intermediate_show_task', 'pmev_attach_pmatid', 'pmev_timer_non_interrupt_once', 'pmev_start_function');
$dbo->colNew = array('pmev_id', 'pmev_pmwfid', 'pmev_pmslid', 'pmev_name', 'pmev_type', 'pmev_type_cat', 'pmev_intermediate_function', 'pmev_timer_interval', 'pmev_timer_workinghours_only', 'pmev_intermediate_show_task', 'pmev_attach_pmatid', 'pmev_timer_non_interrupt_once', 'pmev_start_function');
$dbo->colEdit = array('pmev_name', 'pmev_timer_interval', 'pmev_timer_workinghours_only');
$dbo->colSearch = array('pmev_id', 'pmev_pmwfid', 'pmev_pmslid', 'pmev_name', 'pmev_type', 'pmev_type_cat', 'pmev_intermediate_function', 'pmev_timer_interval', 'pmev_timer_workinghours_only', 'pmev_intermediate_show_task', 'pmev_attach_pmatid', 'pmev_timer_non_interrupt_once', 'pmev_start_function');
$dbo->colExport = array('pmev_id', 'pmev_pmwfid', 'pmev_pmslid', 'pmev_name', 'pmev_type', 'pmev_type_cat', 'pmev_intermediate_function', 'pmev_timer_interval', 'pmev_timer_workinghours_only', 'pmev_intermediate_show_task', 'pmev_attach_pmatid', 'pmev_timer_non_interrupt_once', 'pmev_start_function');
$dbo->colSort = array();
$dbo->canSearch = false;
$dbo->canNew = false;
$dbo->canEdit = true;
$dbo->canDelete = false;
$dbo->canDetail = false;
$dbo->canListEdit = false;
$dbo->canListNew = false;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->titleList = 'List Timer';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Timer';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->detailBack = 'Back';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['pmev_id'] = new DBO_COL('pmev_id', 'int4', '4', '-1');
$dbo->cols['pmev_id']->inputTypeDefault = 'text';
$dbo->cols['pmev_id']->searchMode = 'exact';
$dbo->cols['pmev_id']->capContClassDefault = array();
$dbo->cols['pmev_id']->valContClassDefault = array();
$dbo->cols['pmev_id']->option->defaultMethod = 'text';
$dbo->cols['pmev_id']->option->searchMethod = 'text';
$dbo->cols['pmev_id']->option->listMethod = 'text';
$dbo->cols['pmev_id']->option->detailMethod = 'text';
$dbo->cols['pmev_id']->option->newMethod = 'text';
$dbo->cols['pmev_id']->option->editMethod = 'text';
$dbo->cols['pmev_pmwfid'] = new DBO_COL('pmev_pmwfid', 'int4', '4', '-1');
$dbo->cols['pmev_pmwfid']->inputTypeDefault = 'text';
$dbo->cols['pmev_pmwfid']->searchMode = 'exact';
$dbo->cols['pmev_pmwfid']->capContClassDefault = array();
$dbo->cols['pmev_pmwfid']->valContClassDefault = array();
$dbo->cols['pmev_pmwfid']->option->defaultMethod = 'text';
$dbo->cols['pmev_pmwfid']->option->searchMethod = 'text';
$dbo->cols['pmev_pmwfid']->option->listMethod = 'text';
$dbo->cols['pmev_pmwfid']->option->detailMethod = 'text';
$dbo->cols['pmev_pmwfid']->option->newMethod = 'text';
$dbo->cols['pmev_pmwfid']->option->editMethod = 'text';
$dbo->cols['pmev_pmslid'] = new DBO_COL('pmev_pmslid', 'int4', '4', '-1');
$dbo->cols['pmev_pmslid']->inputTypeDefault = 'text';
$dbo->cols['pmev_pmslid']->searchMode = 'exact';
$dbo->cols['pmev_pmslid']->capContClassDefault = array();
$dbo->cols['pmev_pmslid']->valContClassDefault = array();
$dbo->cols['pmev_pmslid']->option->defaultMethod = 'text';
$dbo->cols['pmev_pmslid']->option->searchMethod = 'text';
$dbo->cols['pmev_pmslid']->option->listMethod = 'text';
$dbo->cols['pmev_pmslid']->option->detailMethod = 'text';
$dbo->cols['pmev_pmslid']->option->newMethod = 'text';
$dbo->cols['pmev_pmslid']->option->editMethod = 'text';
$dbo->cols['pmev_name'] = new DBO_COL('pmev_name', 'varchar', '-1', '104');
$dbo->cols['pmev_name']->inputTypeDefault = 'text';
$dbo->cols['pmev_name']->attributeEdit = array('readonly'=>array('readonly'));
$dbo->cols['pmev_name']->searchMode = 'exact';
$dbo->cols['pmev_name']->capContClassDefault = array();
$dbo->cols['pmev_name']->valContClassDefault = array();
$dbo->cols['pmev_name']->option->defaultMethod = 'text';
$dbo->cols['pmev_name']->option->searchMethod = 'text';
$dbo->cols['pmev_name']->option->listMethod = 'text';
$dbo->cols['pmev_name']->option->detailMethod = 'text';
$dbo->cols['pmev_name']->option->newMethod = 'text';
$dbo->cols['pmev_name']->option->editMethod = 'text';
$dbo->cols['pmev_type'] = new DBO_COL('pmev_type', 'varchar', '-1', '36');
$dbo->cols['pmev_type']->inputTypeDefault = 'text';
$dbo->cols['pmev_type']->searchMode = 'exact';
$dbo->cols['pmev_type']->capContClassDefault = array();
$dbo->cols['pmev_type']->valContClassDefault = array();
$dbo->cols['pmev_type']->option->defaultMethod = 'text';
$dbo->cols['pmev_type']->option->searchMethod = 'text';
$dbo->cols['pmev_type']->option->listMethod = 'text';
$dbo->cols['pmev_type']->option->detailMethod = 'text';
$dbo->cols['pmev_type']->option->newMethod = 'text';
$dbo->cols['pmev_type']->option->editMethod = 'text';
$dbo->cols['pmev_type_cat'] = new DBO_COL('pmev_type_cat', 'varchar', '-1', '36');
$dbo->cols['pmev_type_cat']->inputTypeDefault = 'text';
$dbo->cols['pmev_type_cat']->searchMode = 'exact';
$dbo->cols['pmev_type_cat']->capContClassDefault = array();
$dbo->cols['pmev_type_cat']->valContClassDefault = array();
$dbo->cols['pmev_type_cat']->option->defaultMethod = 'text';
$dbo->cols['pmev_type_cat']->option->searchMethod = 'text';
$dbo->cols['pmev_type_cat']->option->listMethod = 'text';
$dbo->cols['pmev_type_cat']->option->detailMethod = 'text';
$dbo->cols['pmev_type_cat']->option->newMethod = 'text';
$dbo->cols['pmev_type_cat']->option->editMethod = 'text';
$dbo->cols['pmev_intermediate_function'] = new DBO_COL('pmev_intermediate_function', 'varchar', '-1', '104');
$dbo->cols['pmev_intermediate_function']->inputTypeDefault = 'text';
$dbo->cols['pmev_intermediate_function']->searchMode = 'exact';
$dbo->cols['pmev_intermediate_function']->capContClassDefault = array();
$dbo->cols['pmev_intermediate_function']->valContClassDefault = array();
$dbo->cols['pmev_intermediate_function']->option->defaultMethod = 'text';
$dbo->cols['pmev_intermediate_function']->option->searchMethod = 'text';
$dbo->cols['pmev_intermediate_function']->option->listMethod = 'text';
$dbo->cols['pmev_intermediate_function']->option->detailMethod = 'text';
$dbo->cols['pmev_intermediate_function']->option->newMethod = 'text';
$dbo->cols['pmev_intermediate_function']->option->editMethod = 'text';
$dbo->cols['pmev_timer_interval'] = new DBO_COL('pmev_timer_interval', 'varchar', '-1', '54');
$dbo->cols['pmev_timer_interval']->inputTypeDefault = 'text';
$dbo->cols['pmev_timer_interval']->searchMode = 'exact';
$dbo->cols['pmev_timer_interval']->capContClassDefault = array();
$dbo->cols['pmev_timer_interval']->valContClassDefault = array();
$dbo->cols['pmev_timer_interval']->option->defaultMethod = 'text';
$dbo->cols['pmev_timer_interval']->option->searchMethod = 'text';
$dbo->cols['pmev_timer_interval']->option->listMethod = 'text';
$dbo->cols['pmev_timer_interval']->option->detailMethod = 'text';
$dbo->cols['pmev_timer_interval']->option->newMethod = 'text';
$dbo->cols['pmev_timer_interval']->option->editMethod = 'text';
$dbo->cols['pmev_timer_workinghours_only'] = new DBO_COL('pmev_timer_workinghours_only', 'varchar', '-1', '5');
$dbo->cols['pmev_timer_workinghours_only']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['pmev_timer_workinghours_only']->searchMode = 'exact';
$dbo->cols['pmev_timer_workinghours_only']->capContClassDefault = array();
$dbo->cols['pmev_timer_workinghours_only']->valContClassDefault = array();
$dbo->cols['pmev_timer_workinghours_only']->option->default = 'Y/Yes
N/No';
$dbo->cols['pmev_timer_workinghours_only']->option->defaultMethod = 'text';
$dbo->cols['pmev_timer_workinghours_only']->option->searchMethod = 'text';
$dbo->cols['pmev_timer_workinghours_only']->option->listMethod = 'text';
$dbo->cols['pmev_timer_workinghours_only']->option->detailMethod = 'text';
$dbo->cols['pmev_timer_workinghours_only']->option->newMethod = 'text';
$dbo->cols['pmev_timer_workinghours_only']->option->editMethod = 'text';
$dbo->cols['pmev_intermediate_show_task'] = new DBO_COL('pmev_intermediate_show_task', 'varchar', '-1', '5');
$dbo->cols['pmev_intermediate_show_task']->inputTypeDefault = 'text';
$dbo->cols['pmev_intermediate_show_task']->searchMode = 'exact';
$dbo->cols['pmev_intermediate_show_task']->capContClassDefault = array();
$dbo->cols['pmev_intermediate_show_task']->valContClassDefault = array();
$dbo->cols['pmev_intermediate_show_task']->option->defaultMethod = 'text';
$dbo->cols['pmev_intermediate_show_task']->option->searchMethod = 'text';
$dbo->cols['pmev_intermediate_show_task']->option->listMethod = 'text';
$dbo->cols['pmev_intermediate_show_task']->option->detailMethod = 'text';
$dbo->cols['pmev_intermediate_show_task']->option->newMethod = 'text';
$dbo->cols['pmev_intermediate_show_task']->option->editMethod = 'text';
$dbo->cols['pmev_attach_pmatid'] = new DBO_COL('pmev_attach_pmatid', 'int4', '4', '-1');
$dbo->cols['pmev_attach_pmatid']->inputTypeDefault = 'text';
$dbo->cols['pmev_attach_pmatid']->searchMode = 'exact';
$dbo->cols['pmev_attach_pmatid']->capContClassDefault = array();
$dbo->cols['pmev_attach_pmatid']->valContClassDefault = array();
$dbo->cols['pmev_attach_pmatid']->option->defaultMethod = 'text';
$dbo->cols['pmev_attach_pmatid']->option->searchMethod = 'text';
$dbo->cols['pmev_attach_pmatid']->option->listMethod = 'text';
$dbo->cols['pmev_attach_pmatid']->option->detailMethod = 'text';
$dbo->cols['pmev_attach_pmatid']->option->newMethod = 'text';
$dbo->cols['pmev_attach_pmatid']->option->editMethod = 'text';
$dbo->cols['pmev_timer_non_interrupt_once'] = new DBO_COL('pmev_timer_non_interrupt_once', 'varchar', '-1', '5');
$dbo->cols['pmev_timer_non_interrupt_once']->inputTypeDefault = 'text';
$dbo->cols['pmev_timer_non_interrupt_once']->searchMode = 'exact';
$dbo->cols['pmev_timer_non_interrupt_once']->capContClassDefault = array();
$dbo->cols['pmev_timer_non_interrupt_once']->valContClassDefault = array();
$dbo->cols['pmev_timer_non_interrupt_once']->option->defaultMethod = 'text';
$dbo->cols['pmev_timer_non_interrupt_once']->option->searchMethod = 'text';
$dbo->cols['pmev_timer_non_interrupt_once']->option->listMethod = 'text';
$dbo->cols['pmev_timer_non_interrupt_once']->option->detailMethod = 'text';
$dbo->cols['pmev_timer_non_interrupt_once']->option->newMethod = 'text';
$dbo->cols['pmev_timer_non_interrupt_once']->option->editMethod = 'text';
$dbo->cols['pmev_start_function'] = new DBO_COL('pmev_start_function', 'varchar', '-1', '104');
$dbo->cols['pmev_start_function']->inputTypeDefault = 'text';
$dbo->cols['pmev_start_function']->searchMode = 'exact';
$dbo->cols['pmev_start_function']->capContClassDefault = array();
$dbo->cols['pmev_start_function']->valContClassDefault = array();
$dbo->cols['pmev_start_function']->option->defaultMethod = 'text';
$dbo->cols['pmev_start_function']->option->searchMethod = 'text';
$dbo->cols['pmev_start_function']->option->listMethod = 'text';
$dbo->cols['pmev_start_function']->option->detailMethod = 'text';
$dbo->cols['pmev_start_function']->option->newMethod = 'text';
$dbo->cols['pmev_start_function']->option->editMethod = 'text';
$dbo->cols['pmev_performed_message'] = new DBO_COL('pmev_performed_message', 'varchar', '-1', '2004');
$dbo->cols['pmev_performed_message']->inputTypeDefault = 'text';
$dbo->cols['pmev_performed_message']->capContClassDefault = array();
$dbo->cols['pmev_performed_message']->valContClassDefault = array();

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
$dbo->newModifier = 'dbo_timer_setup_custom_new';
function dbo_timer_setup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_timer_setup_custom_edit';
function dbo_timer_setup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_timer_setup_custom_search';
function dbo_timer_setup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_timer_setup_custom_delete';
function dbo_timer_setup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_timer_setup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>