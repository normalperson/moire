<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'sla_setup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'fcpmactivity';
$dbo->key = array('pmat_id');
$dbo->sql = 'select * from fcpmactivity where pmat_type =\'USER\' order by pmat_name';
$dbo->col = array('pmat_id', 'pmat_pmwfid', 'pmat_pmslid', 'pmat_name', 'pmat_type', 'pmat_function', 'pmat_sla_interval', 'pmat_sla_workinghours_only', 'pmat_show_caseinfo');
$dbo->colList = array('pmat_name', 'pmat_sla_interval', 'pmat_sla_workinghours_only');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('pmat_id', 'pmat_pmwfid', 'pmat_pmslid', 'pmat_name', 'pmat_type', 'pmat_function', 'pmat_sla_interval', 'pmat_sla_workinghours_only', 'pmat_show_caseinfo');
$dbo->colNew = array('pmat_id', 'pmat_pmwfid', 'pmat_pmslid', 'pmat_name', 'pmat_type', 'pmat_function', 'pmat_sla_interval', 'pmat_sla_workinghours_only', 'pmat_show_caseinfo');
$dbo->colEdit = array('pmat_name', 'pmat_sla_interval', 'pmat_sla_workinghours_only');
$dbo->colSearch = array('pmat_id', 'pmat_pmwfid', 'pmat_pmslid', 'pmat_name', 'pmat_type', 'pmat_function', 'pmat_sla_interval', 'pmat_sla_workinghours_only', 'pmat_show_caseinfo');
$dbo->colExport = array('pmat_id', 'pmat_pmwfid', 'pmat_pmslid', 'pmat_name', 'pmat_type', 'pmat_function', 'pmat_sla_interval', 'pmat_sla_workinghours_only', 'pmat_show_caseinfo');
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
$dbo->titleList = 'List SLA Activity';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit SLA';
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

$dbo->cols['pmat_id'] = new DBO_COL('pmat_id', 'int4', '4', '-1');
$dbo->cols['pmat_id']->inputTypeDefault = 'text';
$dbo->cols['pmat_id']->searchMode = 'exact';
$dbo->cols['pmat_id']->capContClassDefault = array();
$dbo->cols['pmat_id']->valContClassDefault = array();
$dbo->cols['pmat_id']->option->defaultMethod = 'text';
$dbo->cols['pmat_id']->option->searchMethod = 'text';
$dbo->cols['pmat_id']->option->listMethod = 'text';
$dbo->cols['pmat_id']->option->detailMethod = 'text';
$dbo->cols['pmat_id']->option->newMethod = 'text';
$dbo->cols['pmat_id']->option->editMethod = 'text';
$dbo->cols['pmat_pmwfid'] = new DBO_COL('pmat_pmwfid', 'int4', '4', '-1');
$dbo->cols['pmat_pmwfid']->inputTypeDefault = 'text';
$dbo->cols['pmat_pmwfid']->searchMode = 'exact';
$dbo->cols['pmat_pmwfid']->capContClassDefault = array();
$dbo->cols['pmat_pmwfid']->valContClassDefault = array();
$dbo->cols['pmat_pmwfid']->option->defaultMethod = 'text';
$dbo->cols['pmat_pmwfid']->option->searchMethod = 'text';
$dbo->cols['pmat_pmwfid']->option->listMethod = 'text';
$dbo->cols['pmat_pmwfid']->option->detailMethod = 'text';
$dbo->cols['pmat_pmwfid']->option->newMethod = 'text';
$dbo->cols['pmat_pmwfid']->option->editMethod = 'text';
$dbo->cols['pmat_pmslid'] = new DBO_COL('pmat_pmslid', 'int4', '4', '-1');
$dbo->cols['pmat_pmslid']->inputTypeDefault = 'text';
$dbo->cols['pmat_pmslid']->searchMode = 'exact';
$dbo->cols['pmat_pmslid']->capContClassDefault = array();
$dbo->cols['pmat_pmslid']->valContClassDefault = array();
$dbo->cols['pmat_pmslid']->option->defaultMethod = 'text';
$dbo->cols['pmat_pmslid']->option->searchMethod = 'text';
$dbo->cols['pmat_pmslid']->option->listMethod = 'text';
$dbo->cols['pmat_pmslid']->option->detailMethod = 'text';
$dbo->cols['pmat_pmslid']->option->newMethod = 'text';
$dbo->cols['pmat_pmslid']->option->editMethod = 'text';
$dbo->cols['pmat_name'] = new DBO_COL('pmat_name', 'varchar', '-1', '104');
$dbo->cols['pmat_name']->inputTypeDefault = 'text';
$dbo->cols['pmat_name']->attributeDefault = array('readonly'=>array('readonly'));
$dbo->cols['pmat_name']->searchMode = 'exact';
$dbo->cols['pmat_name']->capContClassDefault = array();
$dbo->cols['pmat_name']->valContClassDefault = array();
$dbo->cols['pmat_name']->option->defaultMethod = 'text';
$dbo->cols['pmat_name']->option->searchMethod = 'text';
$dbo->cols['pmat_name']->option->listMethod = 'text';
$dbo->cols['pmat_name']->option->detailMethod = 'text';
$dbo->cols['pmat_name']->option->newMethod = 'text';
$dbo->cols['pmat_name']->option->editMethod = 'text';
$dbo->cols['pmat_type'] = new DBO_COL('pmat_type', 'varchar', '-1', '36');
$dbo->cols['pmat_type']->inputTypeDefault = 'text';
$dbo->cols['pmat_type']->searchMode = 'exact';
$dbo->cols['pmat_type']->capContClassDefault = array();
$dbo->cols['pmat_type']->valContClassDefault = array();
$dbo->cols['pmat_type']->option->defaultMethod = 'text';
$dbo->cols['pmat_type']->option->searchMethod = 'text';
$dbo->cols['pmat_type']->option->listMethod = 'text';
$dbo->cols['pmat_type']->option->detailMethod = 'text';
$dbo->cols['pmat_type']->option->newMethod = 'text';
$dbo->cols['pmat_type']->option->editMethod = 'text';
$dbo->cols['pmat_function'] = new DBO_COL('pmat_function', 'varchar', '-1', '104');
$dbo->cols['pmat_function']->inputTypeDefault = 'text';
$dbo->cols['pmat_function']->searchMode = 'exact';
$dbo->cols['pmat_function']->capContClassDefault = array();
$dbo->cols['pmat_function']->valContClassDefault = array();
$dbo->cols['pmat_function']->option->defaultMethod = 'text';
$dbo->cols['pmat_function']->option->searchMethod = 'text';
$dbo->cols['pmat_function']->option->listMethod = 'text';
$dbo->cols['pmat_function']->option->detailMethod = 'text';
$dbo->cols['pmat_function']->option->newMethod = 'text';
$dbo->cols['pmat_function']->option->editMethod = 'text';
$dbo->cols['pmat_sla_interval'] = new DBO_COL('pmat_sla_interval', 'varchar', '-1', '54');
$dbo->cols['pmat_sla_interval']->inputTypeDefault = 'text';
$dbo->cols['pmat_sla_interval']->searchMode = 'exact';
$dbo->cols['pmat_sla_interval']->capContClassDefault = array();
$dbo->cols['pmat_sla_interval']->valContClassDefault = array();
$dbo->cols['pmat_sla_interval']->option->defaultMethod = 'text';
$dbo->cols['pmat_sla_interval']->option->searchMethod = 'text';
$dbo->cols['pmat_sla_interval']->option->listMethod = 'text';
$dbo->cols['pmat_sla_interval']->option->detailMethod = 'text';
$dbo->cols['pmat_sla_interval']->option->newMethod = 'text';
$dbo->cols['pmat_sla_interval']->option->editMethod = 'text';
$dbo->cols['pmat_sla_workinghours_only'] = new DBO_COL('pmat_sla_workinghours_only', 'varchar', '-1', '5');
$dbo->cols['pmat_sla_workinghours_only']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['pmat_sla_workinghours_only']->searchMode = 'exact';
$dbo->cols['pmat_sla_workinghours_only']->capContClassDefault = array();
$dbo->cols['pmat_sla_workinghours_only']->valContClassDefault = array();
$dbo->cols['pmat_sla_workinghours_only']->option->default = 'Y/Yes
N/No';
$dbo->cols['pmat_sla_workinghours_only']->option->defaultMethod = 'text';
$dbo->cols['pmat_sla_workinghours_only']->option->searchMethod = 'text';
$dbo->cols['pmat_sla_workinghours_only']->option->listMethod = 'text';
$dbo->cols['pmat_sla_workinghours_only']->option->detailMethod = 'text';
$dbo->cols['pmat_sla_workinghours_only']->option->newMethod = 'text';
$dbo->cols['pmat_sla_workinghours_only']->option->editMethod = 'text';
$dbo->cols['pmat_show_caseinfo'] = new DBO_COL('pmat_show_caseinfo', 'varchar', '-1', '5');
$dbo->cols['pmat_show_caseinfo']->inputTypeDefault = 'text';
$dbo->cols['pmat_show_caseinfo']->searchMode = 'exact';
$dbo->cols['pmat_show_caseinfo']->capContClassDefault = array();
$dbo->cols['pmat_show_caseinfo']->valContClassDefault = array();
$dbo->cols['pmat_show_caseinfo']->option->defaultMethod = 'text';
$dbo->cols['pmat_show_caseinfo']->option->searchMethod = 'text';
$dbo->cols['pmat_show_caseinfo']->option->listMethod = 'text';
$dbo->cols['pmat_show_caseinfo']->option->detailMethod = 'text';
$dbo->cols['pmat_show_caseinfo']->option->newMethod = 'text';
$dbo->cols['pmat_show_caseinfo']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_sla_setup_custom_new';
function dbo_sla_setup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_sla_setup_custom_edit';
function dbo_sla_setup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_sla_setup_custom_search';
function dbo_sla_setup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_sla_setup_custom_delete';
function dbo_sla_setup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_sla_setup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>