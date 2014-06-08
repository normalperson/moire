<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'tmp_jobstatusreport';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'tmp_jobstatusreport';
$dbo->key = array('tmp_jsid');
$dbo->sql = 'select * from tmp_jobstatusreport';
$dbo->col = array('tmp_jsid', 'tmp_submissiondate', 'tmp_customername', 'tmp_completiondate', 'tmp_status', 'tmp_category', 'tmp_invoice');
$dbo->colList = array('tmp_jsid', 'tmp_submissiondate', 'tmp_customername', 'tmp_completiondate', 'tmp_status', 'tmp_category', 'tmp_invoice');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('tmp_jsid', 'tmp_submissiondate', 'tmp_customername', 'tmp_completiondate', 'tmp_status', 'tmp_category', 'tmp_invoice');
$dbo->colNew = array('tmp_jsid', 'tmp_submissiondate', 'tmp_customername', 'tmp_completiondate', 'tmp_status', 'tmp_category', 'tmp_invoice');
$dbo->colEdit = array('tmp_jsid', 'tmp_submissiondate', 'tmp_customername', 'tmp_completiondate', 'tmp_status', 'tmp_category', 'tmp_invoice');
$dbo->colSearch = array('tmp_jsid', 'tmp_submissiondate', 'tmp_customername', 'tmp_completiondate', 'tmp_status', 'tmp_category', 'tmp_invoice');
$dbo->colExport = array('tmp_jsid', 'tmp_submissiondate', 'tmp_customername', 'tmp_completiondate', 'tmp_status', 'tmp_category', 'tmp_invoice');
$dbo->colSort = array();
$dbo->canSearch = true;
$dbo->canNew = true;
$dbo->canEdit = true;
$dbo->canDelete = true;
$dbo->canDetail = false;
$dbo->canListEdit = false;
$dbo->canListNew = false;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->exportFormat = array('excel', 'pdf');
$dbo->titleList = 'Job status report';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->layoutSearch = '1|1';
$dbo->theme = 'metro';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

$dbo->cols['tmp_jsid'] = new DBO_COL('tmp_jsid', 'varchar', '-1', '54');
$dbo->cols['tmp_jsid']->inputTypeDefault = 'text';
$dbo->cols['tmp_jsid']->searchMode = 'exact';
$dbo->cols['tmp_jsid']->capContClassDefault = array();
$dbo->cols['tmp_jsid']->valContClassDefault = array();
$dbo->cols['tmp_jsid']->option->defaultMethod = 'text';
$dbo->cols['tmp_jsid']->option->searchMethod = 'text';
$dbo->cols['tmp_jsid']->option->listMethod = 'text';
$dbo->cols['tmp_jsid']->option->detailMethod = 'text';
$dbo->cols['tmp_jsid']->option->newMethod = 'text';
$dbo->cols['tmp_jsid']->option->editMethod = 'text';
$dbo->cols['tmp_submissiondate'] = new DBO_COL('tmp_submissiondate', 'varchar', '-1', '104');
$dbo->cols['tmp_submissiondate']->displayDataType = 'date';
$dbo->cols['tmp_submissiondate']->inputTypeDefault = 'text';
$dbo->cols['tmp_submissiondate']->searchMode = 'exact';
$dbo->cols['tmp_submissiondate']->capContClassDefault = array();
$dbo->cols['tmp_submissiondate']->valContClassDefault = array();
$dbo->cols['tmp_submissiondate']->option->defaultMethod = 'text';
$dbo->cols['tmp_submissiondate']->option->searchMethod = 'text';
$dbo->cols['tmp_submissiondate']->option->listMethod = 'text';
$dbo->cols['tmp_submissiondate']->option->detailMethod = 'text';
$dbo->cols['tmp_submissiondate']->option->newMethod = 'text';
$dbo->cols['tmp_submissiondate']->option->editMethod = 'text';
$dbo->cols['tmp_customername'] = new DBO_COL('tmp_customername', 'varchar', '-1', '104');
$dbo->cols['tmp_customername']->inputTypeDefault = 'text';
$dbo->cols['tmp_customername']->searchMode = 'exact';
$dbo->cols['tmp_customername']->capContClassDefault = array();
$dbo->cols['tmp_customername']->valContClassDefault = array();
$dbo->cols['tmp_customername']->option->defaultMethod = 'text';
$dbo->cols['tmp_customername']->option->searchMethod = 'text';
$dbo->cols['tmp_customername']->option->listMethod = 'text';
$dbo->cols['tmp_customername']->option->detailMethod = 'text';
$dbo->cols['tmp_customername']->option->newMethod = 'text';
$dbo->cols['tmp_customername']->option->editMethod = 'text';
$dbo->cols['tmp_completiondate'] = new DBO_COL('tmp_completiondate', 'varchar', '-1', '104');
$dbo->cols['tmp_completiondate']->displayDataType = 'date';
$dbo->cols['tmp_completiondate']->inputTypeDefault = 'text';
$dbo->cols['tmp_completiondate']->searchMode = 'exact';
$dbo->cols['tmp_completiondate']->capContClassDefault = array();
$dbo->cols['tmp_completiondate']->valContClassDefault = array();
$dbo->cols['tmp_completiondate']->option->defaultMethod = 'text';
$dbo->cols['tmp_completiondate']->option->searchMethod = 'text';
$dbo->cols['tmp_completiondate']->option->listMethod = 'text';
$dbo->cols['tmp_completiondate']->option->detailMethod = 'text';
$dbo->cols['tmp_completiondate']->option->newMethod = 'text';
$dbo->cols['tmp_completiondate']->option->editMethod = 'text';
$dbo->cols['tmp_status'] = new DBO_COL('tmp_status', 'varchar', '-1', '54');
$dbo->cols['tmp_status']->inputTypeDefault = 'text';
$dbo->cols['tmp_status']->searchMode = 'exact';
$dbo->cols['tmp_status']->capContClassDefault = array();
$dbo->cols['tmp_status']->valContClassDefault = array();
$dbo->cols['tmp_status']->option->defaultMethod = 'text';
$dbo->cols['tmp_status']->option->searchMethod = 'text';
$dbo->cols['tmp_status']->option->listMethod = 'text';
$dbo->cols['tmp_status']->option->detailMethod = 'text';
$dbo->cols['tmp_status']->option->newMethod = 'text';
$dbo->cols['tmp_status']->option->editMethod = 'text';
$dbo->cols['tmp_category'] = new DBO_COL('tmp_category', 'varchar', '-1', '104');
$dbo->cols['tmp_category']->inputTypeDefault = 'text';
$dbo->cols['tmp_category']->searchMode = 'exact';
$dbo->cols['tmp_category']->capContClassDefault = array();
$dbo->cols['tmp_category']->valContClassDefault = array();
$dbo->cols['tmp_category']->option->defaultMethod = 'text';
$dbo->cols['tmp_category']->option->searchMethod = 'text';
$dbo->cols['tmp_category']->option->listMethod = 'text';
$dbo->cols['tmp_category']->option->detailMethod = 'text';
$dbo->cols['tmp_category']->option->newMethod = 'text';
$dbo->cols['tmp_category']->option->editMethod = 'text';
$dbo->cols['tmp_invoice'] = new DBO_COL('tmp_invoice', 'varchar', '-1', '104');
$dbo->cols['tmp_invoice']->inputTypeDefault = 'text';
$dbo->cols['tmp_invoice']->searchMode = 'exact';
$dbo->cols['tmp_invoice']->capContClassDefault = array();
$dbo->cols['tmp_invoice']->valContClassDefault = array();
$dbo->cols['tmp_invoice']->option->defaultMethod = 'text';
$dbo->cols['tmp_invoice']->option->searchMethod = 'text';
$dbo->cols['tmp_invoice']->option->listMethod = 'text';
$dbo->cols['tmp_invoice']->option->detailMethod = 'text';
$dbo->cols['tmp_invoice']->option->newMethod = 'text';
$dbo->cols['tmp_invoice']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_tmp_jobstatusreport_custom_new';
function dbo_tmp_jobstatusreport_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_tmp_jobstatusreport_custom_edit';
function dbo_tmp_jobstatusreport_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_tmp_jobstatusreport_custom_search';
function dbo_tmp_jobstatusreport_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_tmp_jobstatusreport_custom_delete';
function dbo_tmp_jobstatusreport_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_tmp_jobstatusreport_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>