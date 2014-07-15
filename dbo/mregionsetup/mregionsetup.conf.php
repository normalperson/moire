<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'mregionsetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'mregion';
$dbo->key = array('rg_code');
$dbo->sql = 'select * from mregion';
$dbo->col = array('rg_code', 'rg_currency', 'rg_convert');
$dbo->colList = array('rg_code', 'rg_currency', 'rg_convert');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('rg_code', 'rg_currency', 'rg_convert');
$dbo->colNew = array('rg_code', 'rg_currency', 'rg_convert');
$dbo->colEdit = array('rg_code', 'rg_currency', 'rg_convert');
$dbo->colSearch = array('rg_code', 'rg_currency');
$dbo->colExport = array('rg_code', 'rg_currency', 'rg_convert');
$dbo->colSort = array();
$dbo->canSearch = true;
$dbo->canNew = true;
$dbo->canEdit = true;
$dbo->canDelete = true;
$dbo->canDetail = true;
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
$dbo->layout = 'AlwaysList';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->defaultDateFormat = 'yyyy-mm-dd';
$dbo->defaultDateTimeFormat = 'yyyy-mm-dd hh24:min:ss';
$dbo->defaultTimeFormat = 'hh24:min:ss';
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

$dbo->cols['rg_code'] = new DBO_COL('rg_code', 'varchar', '-1', '54');
$dbo->cols['rg_code']->inputTypeDefault = 'text';
$dbo->cols['rg_code']->attributeEdit = array('readonly'=>array(''));
$dbo->cols['rg_code']->searchMode = 'exact';
$dbo->cols['rg_code']->capContClassDefault = array();
$dbo->cols['rg_code']->valContClassDefault = array();
$dbo->cols['rg_code']->option->defaultMethod = 'text';
$dbo->cols['rg_code']->option->searchMethod = 'text';
$dbo->cols['rg_code']->option->listMethod = 'text';
$dbo->cols['rg_code']->option->detailMethod = 'text';
$dbo->cols['rg_code']->option->newMethod = 'text';
$dbo->cols['rg_code']->option->editMethod = 'text';
$dbo->cols['rg_currency'] = new DBO_COL('rg_currency', 'varchar', '-1', '16');
$dbo->cols['rg_currency']->inputTypeDefault = 'select';
$dbo->cols['rg_currency']->searchMode = 'exact';
$dbo->cols['rg_currency']->capContClassDefault = array();
$dbo->cols['rg_currency']->valContClassDefault = array();
$dbo->cols['rg_currency']->option->default = 'select cr_code, cr_name || \' (\'||cr_code||\')\' from fccurrency order by 2';
$dbo->cols['rg_currency']->option->defaultMethod = 'sql';
$dbo->cols['rg_currency']->option->searchMethod = 'text';
$dbo->cols['rg_currency']->option->listMethod = 'text';
$dbo->cols['rg_currency']->option->detailMethod = 'text';
$dbo->cols['rg_currency']->option->newMethod = 'text';
$dbo->cols['rg_currency']->option->editMethod = 'text';
$dbo->cols['rg_convert'] = new DBO_COL('rg_convert', 'varchar', '-1', '8');
$dbo->cols['rg_convert']->defaultValueMethod = 'text';
$dbo->cols['rg_convert']->defaultValue = 'N';
$dbo->cols['rg_convert']->inputTypeDefault = 'radio';
$dbo->cols['rg_convert']->searchMode = 'exact';
$dbo->cols['rg_convert']->capContClassDefault = array();
$dbo->cols['rg_convert']->valContClassDefault = array();
$dbo->cols['rg_convert']->option->default = 'Y/Yes
N/No';
$dbo->cols['rg_convert']->option->defaultMethod = 'text';
$dbo->cols['rg_convert']->option->searchMethod = 'text';
$dbo->cols['rg_convert']->option->listMethod = 'text';
$dbo->cols['rg_convert']->option->detailMethod = 'text';
$dbo->cols['rg_convert']->option->newMethod = 'text';
$dbo->cols['rg_convert']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_mregionsetup_custom_new';
function dbo_mregionsetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_mregionsetup_custom_edit';
function dbo_mregionsetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_mregionsetup_custom_search';
function dbo_mregionsetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_mregionsetup_custom_delete';
function dbo_mregionsetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_mregionsetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>