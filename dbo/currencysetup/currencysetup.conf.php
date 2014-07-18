<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'currencysetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'fccurrency';
$dbo->key = array('cr_code');
$dbo->sql = 'select * from fccurrency';
$dbo->col = array('cr_code', 'cr_name', 'cr_rate', 'cr_symbol', 'cr_format', 'cr_decimalsep', 'cr_thousandsep', 'cr_precision');
$dbo->colList = array('cr_code', 'cr_name', 'cr_rate', 'cr_symbol', 'cr_format');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('cr_code', 'cr_name', 'cr_rate', 'cr_symbol', 'cr_format', 'cr_decimalsep', 'cr_thousandsep', 'cr_precision');
$dbo->colNew = array('cr_code', 'cr_name', 'cr_rate', 'cr_symbol', 'cr_format', 'cr_decimalsep', 'cr_thousandsep', 'cr_precision');
$dbo->colEdit = array('cr_code', 'cr_name', 'cr_rate', 'cr_symbol', 'cr_format', 'cr_decimalsep', 'cr_thousandsep', 'cr_precision');
$dbo->colSearch = array('cr_code', 'cr_name');
$dbo->colExport = array('cr_code', 'cr_name', 'cr_rate', 'cr_symbol', 'cr_format', 'cr_decimalsep', 'cr_thousandsep', 'cr_precision');
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
$dbo->layout = 'One';
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

$dbo->cols['cr_code'] = new DBO_COL('cr_code', 'varchar', '-1', '12');
$dbo->cols['cr_code']->inputTypeDefault = 'text';
$dbo->cols['cr_code']->attributeEdit = array('readonly'=>array(''));
$dbo->cols['cr_code']->searchMode = 'exact';
$dbo->cols['cr_code']->capContClassDefault = array();
$dbo->cols['cr_code']->valContClassDefault = array();
$dbo->cols['cr_code']->option->default = 'select cr_code, cr_name || \' (\'||cr_code||\')\' from fccurrency order by 2';
$dbo->cols['cr_code']->option->search = 'select cr_code, cr_name || \' (\'||cr_code||\')\' from fccurrency order by 2';
$dbo->cols['cr_code']->option->defaultMethod = 'sql';
$dbo->cols['cr_code']->option->searchMethod = 'sql';
$dbo->cols['cr_code']->option->listMethod = 'text';
$dbo->cols['cr_code']->option->detailMethod = 'text';
$dbo->cols['cr_code']->option->newMethod = 'text';
$dbo->cols['cr_code']->option->editMethod = 'text';
$dbo->cols['cr_name'] = new DBO_COL('cr_name', 'varchar', '-1', '54');
$dbo->cols['cr_name']->inputTypeDefault = 'text';
$dbo->cols['cr_name']->searchMode = 'exact';
$dbo->cols['cr_name']->capContClassDefault = array();
$dbo->cols['cr_name']->valContClassDefault = array();
$dbo->cols['cr_name']->option->defaultMethod = 'text';
$dbo->cols['cr_name']->option->searchMethod = 'text';
$dbo->cols['cr_name']->option->listMethod = 'text';
$dbo->cols['cr_name']->option->detailMethod = 'text';
$dbo->cols['cr_name']->option->newMethod = 'text';
$dbo->cols['cr_name']->option->editMethod = 'text';
$dbo->cols['cr_rate'] = new DBO_COL('cr_rate', 'numeric', '-1', '1310728');
$dbo->cols['cr_rate']->inputTypeDefault = 'text';
$dbo->cols['cr_rate']->searchMode = 'exact';
$dbo->cols['cr_rate']->capContClassDefault = array();
$dbo->cols['cr_rate']->valContClassDefault = array();
$dbo->cols['cr_rate']->option->defaultMethod = 'text';
$dbo->cols['cr_rate']->option->searchMethod = 'text';
$dbo->cols['cr_rate']->option->listMethod = 'text';
$dbo->cols['cr_rate']->option->detailMethod = 'text';
$dbo->cols['cr_rate']->option->newMethod = 'text';
$dbo->cols['cr_rate']->option->editMethod = 'text';
$dbo->cols['cr_symbol'] = new DBO_COL('cr_symbol', 'varchar', '-1', '54');
$dbo->cols['cr_symbol']->inputTypeDefault = 'text';
$dbo->cols['cr_symbol']->searchMode = 'exact';
$dbo->cols['cr_symbol']->capContClassDefault = array();
$dbo->cols['cr_symbol']->valContClassDefault = array();
$dbo->cols['cr_symbol']->option->defaultMethod = 'text';
$dbo->cols['cr_symbol']->option->searchMethod = 'text';
$dbo->cols['cr_symbol']->option->listMethod = 'text';
$dbo->cols['cr_symbol']->option->detailMethod = 'text';
$dbo->cols['cr_symbol']->option->newMethod = 'text';
$dbo->cols['cr_symbol']->option->editMethod = 'text';
$dbo->cols['cr_format'] = new DBO_COL('cr_format', 'varchar', '-1', '54');
$dbo->cols['cr_format']->inputTypeDefault = 'text';
$dbo->cols['cr_format']->searchMode = 'exact';
$dbo->cols['cr_format']->capContClassDefault = array();
$dbo->cols['cr_format']->valContClassDefault = array();
$dbo->cols['cr_format']->option->defaultMethod = 'text';
$dbo->cols['cr_format']->option->searchMethod = 'text';
$dbo->cols['cr_format']->option->listMethod = 'text';
$dbo->cols['cr_format']->option->detailMethod = 'text';
$dbo->cols['cr_format']->option->newMethod = 'text';
$dbo->cols['cr_format']->option->editMethod = 'text';
$dbo->cols['cr_decimalsep'] = new DBO_COL('cr_decimalsep', 'varchar', '-1', '12');
$dbo->cols['cr_decimalsep']->inputTypeDefault = 'text';
$dbo->cols['cr_decimalsep']->searchMode = 'exact';
$dbo->cols['cr_decimalsep']->capContClassDefault = array();
$dbo->cols['cr_decimalsep']->valContClassDefault = array();
$dbo->cols['cr_decimalsep']->option->defaultMethod = 'text';
$dbo->cols['cr_decimalsep']->option->searchMethod = 'text';
$dbo->cols['cr_decimalsep']->option->listMethod = 'text';
$dbo->cols['cr_decimalsep']->option->detailMethod = 'text';
$dbo->cols['cr_decimalsep']->option->newMethod = 'text';
$dbo->cols['cr_decimalsep']->option->editMethod = 'text';
$dbo->cols['cr_thousandsep'] = new DBO_COL('cr_thousandsep', 'varchar', '-1', '12');
$dbo->cols['cr_thousandsep']->inputTypeDefault = 'text';
$dbo->cols['cr_thousandsep']->searchMode = 'exact';
$dbo->cols['cr_thousandsep']->capContClassDefault = array();
$dbo->cols['cr_thousandsep']->valContClassDefault = array();
$dbo->cols['cr_thousandsep']->option->defaultMethod = 'text';
$dbo->cols['cr_thousandsep']->option->searchMethod = 'text';
$dbo->cols['cr_thousandsep']->option->listMethod = 'text';
$dbo->cols['cr_thousandsep']->option->detailMethod = 'text';
$dbo->cols['cr_thousandsep']->option->newMethod = 'text';
$dbo->cols['cr_thousandsep']->option->editMethod = 'text';
$dbo->cols['cr_precision'] = new DBO_COL('cr_precision', 'int4', '4', '-1');
$dbo->cols['cr_precision']->inputTypeDefault = 'text';
$dbo->cols['cr_precision']->searchMode = 'exact';
$dbo->cols['cr_precision']->capContClassDefault = array();
$dbo->cols['cr_precision']->valContClassDefault = array();
$dbo->cols['cr_precision']->option->defaultMethod = 'text';
$dbo->cols['cr_precision']->option->searchMethod = 'text';
$dbo->cols['cr_precision']->option->listMethod = 'text';
$dbo->cols['cr_precision']->option->detailMethod = 'text';
$dbo->cols['cr_precision']->option->newMethod = 'text';
$dbo->cols['cr_precision']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_currencysetup_custom_new';
function dbo_currencysetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_currencysetup_custom_edit';
function dbo_currencysetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_currencysetup_custom_search';
function dbo_currencysetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_currencysetup_custom_delete';
function dbo_currencysetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_currencysetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>