<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'barcodetypesetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'mbarcodetype';
$dbo->key = array('bt_code');
$dbo->sql = 'select * from mbarcodetype';
$dbo->col = array('bt_code', 'bt_name', 'bt_format');
$dbo->colList = array('bt_code', 'bt_name', 'bt_format');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('bt_code', 'bt_name', 'bt_format');
$dbo->colNew = array('bt_code', 'bt_name', 'bt_format');
$dbo->colEdit = array('bt_code', 'bt_name', 'bt_format');
$dbo->colSearch = array('bt_code', 'bt_name', 'bt_format');
$dbo->colExport = array('bt_code', 'bt_name', 'bt_format');
$dbo->colSort = array();
$dbo->canSearch = false;
$dbo->canNew = true;
$dbo->canEdit = true;
$dbo->canDelete = false;
$dbo->canDetail = false;
$dbo->canListEdit = false;
$dbo->canListNew = false;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
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

$dbo->cols['bt_code'] = new DBO_COL('bt_code', 'varchar', '-1', '54');
$dbo->cols['bt_code']->inputTypeDefault = 'text';
$dbo->cols['bt_code']->searchMode = 'exact';
$dbo->cols['bt_code']->capContClassDefault = array();
$dbo->cols['bt_code']->valContClassDefault = array();
$dbo->cols['bt_code']->option->defaultMethod = 'text';
$dbo->cols['bt_code']->option->searchMethod = 'text';
$dbo->cols['bt_code']->option->listMethod = 'text';
$dbo->cols['bt_code']->option->detailMethod = 'text';
$dbo->cols['bt_code']->option->newMethod = 'text';
$dbo->cols['bt_code']->option->editMethod = 'text';
$dbo->cols['bt_name'] = new DBO_COL('bt_name', 'varchar', '-1', '204');
$dbo->cols['bt_name']->inputTypeDefault = 'text';
$dbo->cols['bt_name']->searchMode = 'exact';
$dbo->cols['bt_name']->capContClassDefault = array();
$dbo->cols['bt_name']->valContClassDefault = array();
$dbo->cols['bt_name']->option->defaultMethod = 'text';
$dbo->cols['bt_name']->option->searchMethod = 'text';
$dbo->cols['bt_name']->option->listMethod = 'text';
$dbo->cols['bt_name']->option->detailMethod = 'text';
$dbo->cols['bt_name']->option->newMethod = 'text';
$dbo->cols['bt_name']->option->editMethod = 'text';
$dbo->cols['bt_format'] = new DBO_COL('bt_format', 'varchar', '-1', '54');
$dbo->cols['bt_format']->inputTypeDefault = 'text';
$dbo->cols['bt_format']->searchMode = 'exact';
$dbo->cols['bt_format']->capContClassDefault = array();
$dbo->cols['bt_format']->valContClassDefault = array();
$dbo->cols['bt_format']->option->defaultMethod = 'text';
$dbo->cols['bt_format']->option->searchMethod = 'text';
$dbo->cols['bt_format']->option->listMethod = 'text';
$dbo->cols['bt_format']->option->detailMethod = 'text';
$dbo->cols['bt_format']->option->newMethod = 'text';
$dbo->cols['bt_format']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_barcodetypesetup_custom_new';
function dbo_barcodetypesetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_barcodetypesetup_custom_edit';
function dbo_barcodetypesetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_barcodetypesetup_custom_search';
function dbo_barcodetypesetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_barcodetypesetup_custom_delete';
function dbo_barcodetypesetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_barcodetypesetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>