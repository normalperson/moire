<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'udv';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'FCUDV';
$dbo->key = array('udv_code');
$dbo->sql = 'select a.*, \'\' as udv_test from fcudv a';
$dbo->col = array('udv_code', 'udv_name', 'udv_query_type', 'udv_query', 'udv_return_type', 'udv_result_type', 'udv_result_lookup_type', 'udv_result_lookup', 'udv_cat', 'udv_test');
$dbo->colList = array('udv_code', 'udv_name', 'udv_query_type', 'udv_query', 'udv_result_type', 'udv_result_lookup', 'udv_test');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('udv_code', 'udv_name', 'udv_query_type', 'udv_query', 'udv_result_type', 'udv_result_lookup');
$dbo->colNew = array('udv_code', 'udv_cat', 'udv_name', 'udv_query_type', 'udv_query', 'udv_return_type', 'udv_result_type', 'udv_result_lookup_type', 'udv_result_lookup');
$dbo->colEdit = array('udv_code', 'udv_cat', 'udv_name', 'udv_query_type', 'udv_query', 'udv_return_type', 'udv_result_type', 'udv_result_lookup_type', 'udv_result_lookup');
$dbo->colSearch = array();
$dbo->colExport = array();
$dbo->colSort = array();
$dbo->canSearch = false;
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
$dbo->titleList = 'List UDV';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New UDV';
$dbo->titleEdit = 'Edit UDV';
$dbo->titleSearch = 'Search UDV';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();

$dbo->cols['udv_id'] = new DBO_COL('udv_id', 'int4', '4', '-1');
$dbo->cols['udv_id']->inputTypeDefault = 'text';
$dbo->cols['udv_id']->searchMode = 'exact';
$dbo->cols['udv_id']->capContClassDefault = array();
$dbo->cols['udv_id']->valContClassDefault = array();
$dbo->cols['udv_id']->option->defaultMethod = 'text';
$dbo->cols['udv_id']->option->searchMethod = 'text';
$dbo->cols['udv_id']->option->listMethod = 'text';
$dbo->cols['udv_id']->option->detailMethod = 'text';
$dbo->cols['udv_id']->option->newMethod = 'text';
$dbo->cols['udv_id']->option->editMethod = 'text';
$dbo->cols['udv_code'] = new DBO_COL('udv_code', 'varchar', '-1', '36');
$dbo->cols['udv_code']->inputTypeDefault = 'text';
$dbo->cols['udv_code']->searchMode = 'exact';
$dbo->cols['udv_code']->capContClassDefault = array();
$dbo->cols['udv_code']->valContClassDefault = array();
$dbo->cols['udv_code']->option->defaultMethod = 'text';
$dbo->cols['udv_code']->option->searchMethod = 'text';
$dbo->cols['udv_code']->option->listMethod = 'text';
$dbo->cols['udv_code']->option->detailMethod = 'text';
$dbo->cols['udv_code']->option->newMethod = 'text';
$dbo->cols['udv_code']->option->editMethod = 'text';
$dbo->cols['udv_name'] = new DBO_COL('udv_name', 'varchar', '-1', '104');
$dbo->cols['udv_name']->inputTypeDefault = 'text';
$dbo->cols['udv_name']->searchMode = 'exact';
$dbo->cols['udv_name']->capContClassDefault = array();
$dbo->cols['udv_name']->valContClassDefault = array();
$dbo->cols['udv_name']->option->defaultMethod = 'text';
$dbo->cols['udv_name']->option->searchMethod = 'text';
$dbo->cols['udv_name']->option->listMethod = 'text';
$dbo->cols['udv_name']->option->detailMethod = 'text';
$dbo->cols['udv_name']->option->newMethod = 'text';
$dbo->cols['udv_name']->option->editMethod = 'text';
$dbo->cols['udv_query_type'] = new DBO_COL('udv_query_type', 'varchar', '-1', '16');
$dbo->cols['udv_query_type']->inputTypeDefault = 'select';
$dbo->cols['udv_query_type']->searchMode = 'exact';
$dbo->cols['udv_query_type']->capContClassDefault = array();
$dbo->cols['udv_query_type']->valContClassDefault = array();
$dbo->cols['udv_query_type']->option->default = 'php/php
sql/sql';
$dbo->cols['udv_query_type']->option->defaultMethod = 'text';
$dbo->cols['udv_query_type']->option->searchMethod = 'text';
$dbo->cols['udv_query_type']->option->listMethod = 'text';
$dbo->cols['udv_query_type']->option->detailMethod = 'text';
$dbo->cols['udv_query_type']->option->newMethod = 'text';
$dbo->cols['udv_query_type']->option->editMethod = 'text';
$dbo->cols['udv_query'] = new DBO_COL('udv_query', 'varchar', '-1', '4004');
$dbo->cols['udv_query']->inputTypeDefault = 'textarea';
$dbo->cols['udv_query']->searchMode = 'exact';
$dbo->cols['udv_query']->capContClassDefault = array();
$dbo->cols['udv_query']->valContClassDefault = array();
$dbo->cols['udv_query']->option->defaultMethod = 'text';
$dbo->cols['udv_query']->option->searchMethod = 'text';
$dbo->cols['udv_query']->option->listMethod = 'text';
$dbo->cols['udv_query']->option->detailMethod = 'text';
$dbo->cols['udv_query']->option->newMethod = 'text';
$dbo->cols['udv_query']->option->editMethod = 'text';
$dbo->cols['udv_result_type'] = new DBO_COL('udv_result_type', 'varchar', '-1', '16');
$dbo->cols['udv_result_type']->inputTypeDefault = 'select';
$dbo->cols['udv_result_type']->searchMode = 'exact';
$dbo->cols['udv_result_type']->capContClassDefault = array();
$dbo->cols['udv_result_type']->valContClassDefault = array();
$dbo->cols['udv_result_type']->option->default = 'char/char
lookup/lookup
number/number
date/date';
$dbo->cols['udv_result_type']->option->defaultMethod = 'text';
$dbo->cols['udv_result_type']->option->searchMethod = 'text';
$dbo->cols['udv_result_type']->option->listMethod = 'text';
$dbo->cols['udv_result_type']->option->detailMethod = 'text';
$dbo->cols['udv_result_type']->option->newMethod = 'text';
$dbo->cols['udv_result_type']->option->editMethod = 'text';
$dbo->cols['udv_result_lookup'] = new DBO_COL('udv_result_lookup', 'varchar', '-1', '4004');
$dbo->cols['udv_result_lookup']->inputTypeDefault = 'textarea';
$dbo->cols['udv_result_lookup']->searchMode = 'exact';
$dbo->cols['udv_result_lookup']->capContClassDefault = array();
$dbo->cols['udv_result_lookup']->valContClassDefault = array();
$dbo->cols['udv_result_lookup']->option->defaultMethod = 'text';
$dbo->cols['udv_result_lookup']->option->searchMethod = 'text';
$dbo->cols['udv_result_lookup']->option->listMethod = 'text';
$dbo->cols['udv_result_lookup']->option->detailMethod = 'text';
$dbo->cols['udv_result_lookup']->option->newMethod = 'text';
$dbo->cols['udv_result_lookup']->option->editMethod = 'text';
$dbo->cols['udv_result_lookup_type'] = new DBO_COL('udv_result_lookup_type', 'varchar', '-1', '16');
$dbo->cols['udv_result_lookup_type']->inputTypeDefault = 'select';
$dbo->cols['udv_result_lookup_type']->searchMode = 'exact';
$dbo->cols['udv_result_lookup_type']->capContClassDefault = array();
$dbo->cols['udv_result_lookup_type']->valContClassDefault = array();
$dbo->cols['udv_result_lookup_type']->option->default = 'text/text
php/php
sql/sql';
$dbo->cols['udv_result_lookup_type']->option->defaultMethod = 'text';
$dbo->cols['udv_result_lookup_type']->option->searchMethod = 'text';
$dbo->cols['udv_result_lookup_type']->option->listMethod = 'text';
$dbo->cols['udv_result_lookup_type']->option->detailMethod = 'text';
$dbo->cols['udv_result_lookup_type']->option->newMethod = 'text';
$dbo->cols['udv_result_lookup_type']->option->editMethod = 'text';
$dbo->cols['udv_test'] = new DBO_COL('udv_test', 'unknown', '-2', '-1');
$dbo->cols['udv_test']->inputTypeDefault = 'text';
$dbo->cols['udv_test']->searchMode = 'exact';
$dbo->cols['udv_test']->capContClassDefault = array();
$dbo->cols['udv_test']->valContClassDefault = array();
$dbo->cols['udv_test']->option->defaultMethod = 'text';
$dbo->cols['udv_test']->option->searchMethod = 'text';
$dbo->cols['udv_test']->option->listMethod = 'text';
$dbo->cols['udv_test']->option->detailMethod = 'text';
$dbo->cols['udv_test']->option->newMethod = 'text';
$dbo->cols['udv_test']->option->editMethod = 'text';
$dbo->cols['udv_return_type'] = new DBO_COL('udv_return_type', 'varchar', '-1', '16');
$dbo->cols['udv_return_type']->inputTypeDefault = 'select';
$dbo->cols['udv_return_type']->searchMode = 'exact';
$dbo->cols['udv_return_type']->capContClassDefault = array();
$dbo->cols['udv_return_type']->valContClassDefault = array();
$dbo->cols['udv_return_type']->option->default = 'CELL/CELL
TABLE/TABLE';
$dbo->cols['udv_return_type']->option->defaultMethod = 'text';
$dbo->cols['udv_return_type']->option->searchMethod = 'text';
$dbo->cols['udv_return_type']->option->listMethod = 'text';
$dbo->cols['udv_return_type']->option->detailMethod = 'text';
$dbo->cols['udv_return_type']->option->newMethod = 'text';
$dbo->cols['udv_return_type']->option->editMethod = 'text';
$dbo->cols['udv_cat'] = new DBO_COL('udv_cat', 'varchar', '-1', '36');
$dbo->cols['udv_cat']->inputTypeDefault = 'text';
$dbo->cols['udv_cat']->searchMode = 'exact';
$dbo->cols['udv_cat']->capContClassDefault = array();
$dbo->cols['udv_cat']->valContClassDefault = array();
$dbo->cols['udv_cat']->option->defaultMethod = 'text';
$dbo->cols['udv_cat']->option->searchMethod = 'text';
$dbo->cols['udv_cat']->option->listMethod = 'text';
$dbo->cols['udv_cat']->option->detailMethod = 'text';
$dbo->cols['udv_cat']->option->newMethod = 'text';
$dbo->cols['udv_cat']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_udv_custom_new';
function dbo_udv_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_udv_custom_edit';
function dbo_udv_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_udv_custom_search';
function dbo_udv_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_udv_custom_delete';
function dbo_udv_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_udv_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>