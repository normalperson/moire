<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'fongoption';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fongoption';
$dbo->key = array('fo_id');
$dbo->sql = 'select * from fongoption';
$dbo->col = array('fo_id', 'fo_cat', 'fo_code', 'fo_desc');
$dbo->colList = array('fo_id', 'fo_cat', 'fo_code', 'fo_desc');
$dbo->colListEdit = array('fo_cat', 'fo_code', 'fo_desc');
$dbo->colListNew = array('fo_cat', 'fo_code', 'fo_desc');
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('fo_id', 'fo_cat', 'fo_code', 'fo_desc');
$dbo->colNew = array('fo_cat', 'fo_code', 'fo_desc');
$dbo->colEdit = array('fo_cat', 'fo_code', 'fo_desc');
$dbo->colSearch = array('fo_id', 'fo_cat', 'fo_code', 'fo_desc');
$dbo->colExport = array('fo_id', 'fo_cat', 'fo_code', 'fo_desc');
$dbo->colSort = array();
$dbo->canSearch = true;
$dbo->canNew = true;
$dbo->canEdit = true;
$dbo->canDelete = true;
$dbo->canDetail = true;
$dbo->canListEdit = true;
$dbo->canListNew = true;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'skyblue';
$dbo->layout = 'AlwaysList';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-GB';
$dbo->render = array();
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

$dbo->cols['fo_id'] = new DBO_COL('fo_id', 'LONG', '11', '0');
$dbo->cols['fo_id']->inputTypeDefault = 'text';
$dbo->cols['fo_id']->searchMode = 'exact';
$dbo->cols['fo_id']->capContClassDefault = array();
$dbo->cols['fo_id']->valContClassDefault = array();
$dbo->cols['fo_id']->option->defaultMethod = 'text';
$dbo->cols['fo_id']->option->searchMethod = 'text';
$dbo->cols['fo_id']->option->listMethod = 'text';
$dbo->cols['fo_id']->option->detailMethod = 'text';
$dbo->cols['fo_id']->option->newMethod = 'text';
$dbo->cols['fo_id']->option->editMethod = 'text';
$dbo->cols['fo_cat'] = new DBO_COL('fo_cat', 'VAR_STRING', '135', '0');
$dbo->cols['fo_cat']->inputTypeDefault = 'text';
$dbo->cols['fo_cat']->inputTypeSearch = 'select';
$dbo->cols['fo_cat']->searchMode = 'exact';
$dbo->cols['fo_cat']->capContClassDefault = array();
$dbo->cols['fo_cat']->valContClassDefault = array();
$dbo->cols['fo_cat']->option->default = 'select distinct fo_cat from fongoption';
$dbo->cols['fo_cat']->option->defaultMethod = 'sql';
$dbo->cols['fo_cat']->option->searchMethod = 'text';
$dbo->cols['fo_cat']->option->listMethod = 'text';
$dbo->cols['fo_cat']->option->detailMethod = 'text';
$dbo->cols['fo_cat']->option->newMethod = 'text';
$dbo->cols['fo_cat']->option->editMethod = 'text';
$dbo->cols['fo_code'] = new DBO_COL('fo_code', 'VAR_STRING', '135', '0');
$dbo->cols['fo_code']->inputTypeDefault = 'text';
$dbo->cols['fo_code']->inputTypeSearch = 'multiselect';
$dbo->cols['fo_code']->searchMode = 'exact';
$dbo->cols['fo_code']->capContClassDefault = array();
$dbo->cols['fo_code']->valContClassDefault = array();
$dbo->cols['fo_code']->option->default = 'select fo_code, concat(fo_desc, \' (\', fo_code, \')\') from fongoption where fo_cat = \'{fo_cat}\'';
$dbo->cols['fo_code']->option->defaultMethod = 'sql';
$dbo->cols['fo_code']->option->searchMethod = 'text';
$dbo->cols['fo_code']->option->listMethod = 'text';
$dbo->cols['fo_code']->option->detailMethod = 'text';
$dbo->cols['fo_code']->option->newMethod = 'text';
$dbo->cols['fo_code']->option->editMethod = 'text';
$dbo->cols['fo_desc'] = new DBO_COL('fo_desc', 'VAR_STRING', '135', '0');
$dbo->cols['fo_desc']->inputTypeDefault = 'textarea';
$dbo->cols['fo_desc']->searchMode = 'exact';
$dbo->cols['fo_desc']->capContClassDefault = array();
$dbo->cols['fo_desc']->valContClassDefault = array();
$dbo->cols['fo_desc']->option->defaultMethod = 'text';
$dbo->cols['fo_desc']->option->searchMethod = 'text';
$dbo->cols['fo_desc']->option->listMethod = 'text';
$dbo->cols['fo_desc']->option->detailMethod = 'text';
$dbo->cols['fo_desc']->option->newMethod = 'text';
$dbo->cols['fo_desc']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_fongoption_custom_new';
function dbo_fongoption_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_fongoption_custom_edit';
function dbo_fongoption_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_fongoption_custom_search';
function dbo_fongoption_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_fongoption_custom_delete';
function dbo_fongoption_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_fongoption_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>