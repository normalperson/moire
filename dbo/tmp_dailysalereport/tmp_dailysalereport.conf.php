<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'tmp_dailysalereport';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'tmp_dailysalereport';
$dbo->key = array('tmp_date');
$dbo->sql = 'select * from tmp_dailysalereport';
$dbo->col = array('tmp_date', 'tmp_typing', 'tmp_drawing', 'tmp_mastercard', 'tmp_colorseperation', 'tmp_barcode', 'tmp_tapping', 'tmp_total');
$dbo->colList = array('tmp_date', 'tmp_typing', 'tmp_drawing', 'tmp_mastercard', 'tmp_colorseperation', 'tmp_barcode', 'tmp_tapping', 'tmp_total');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('tmp_date', 'tmp_typing', 'tmp_drawing', 'tmp_mastercard', 'tmp_colorseperation', 'tmp_barcode', 'tmp_tapping', 'tmp_total');
$dbo->colNew = array('tmp_date', 'tmp_typing', 'tmp_drawing', 'tmp_mastercard', 'tmp_colorseperation', 'tmp_barcode', 'tmp_tapping', 'tmp_total');
$dbo->colEdit = array('tmp_date', 'tmp_typing', 'tmp_drawing', 'tmp_mastercard', 'tmp_colorseperation', 'tmp_barcode', 'tmp_tapping', 'tmp_total');
$dbo->colSearch = array('tmp_date', 'tmp_typing', 'tmp_drawing', 'tmp_mastercard', 'tmp_colorseperation', 'tmp_barcode', 'tmp_tapping', 'tmp_total');
$dbo->colExport = array('tmp_date', 'tmp_typing', 'tmp_drawing', 'tmp_mastercard', 'tmp_colorseperation', 'tmp_barcode', 'tmp_tapping', 'tmp_total');
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
$dbo->titleList = 'Daily sale report';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
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

$dbo->cols['tmp_date'] = new DBO_COL('tmp_date', 'varchar', '-1', '104');
$dbo->cols['tmp_date']->inputTypeDefault = 'text';
$dbo->cols['tmp_date']->searchMode = 'exact';
$dbo->cols['tmp_date']->capContClassDefault = array();
$dbo->cols['tmp_date']->valContClassDefault = array();
$dbo->cols['tmp_date']->option->defaultMethod = 'text';
$dbo->cols['tmp_date']->option->searchMethod = 'text';
$dbo->cols['tmp_date']->option->listMethod = 'text';
$dbo->cols['tmp_date']->option->detailMethod = 'text';
$dbo->cols['tmp_date']->option->newMethod = 'text';
$dbo->cols['tmp_date']->option->editMethod = 'text';
$dbo->cols['tmp_typing'] = new DBO_COL('tmp_typing', 'varchar', '-1', '104');
$dbo->cols['tmp_typing']->inputTypeDefault = 'text';
$dbo->cols['tmp_typing']->searchMode = 'exact';
$dbo->cols['tmp_typing']->capContClassDefault = array();
$dbo->cols['tmp_typing']->valContClassDefault = array();
$dbo->cols['tmp_typing']->option->defaultMethod = 'text';
$dbo->cols['tmp_typing']->option->searchMethod = 'text';
$dbo->cols['tmp_typing']->option->listMethod = 'text';
$dbo->cols['tmp_typing']->option->detailMethod = 'text';
$dbo->cols['tmp_typing']->option->newMethod = 'text';
$dbo->cols['tmp_typing']->option->editMethod = 'text';
$dbo->cols['tmp_drawing'] = new DBO_COL('tmp_drawing', 'varchar', '-1', '104');
$dbo->cols['tmp_drawing']->inputTypeDefault = 'text';
$dbo->cols['tmp_drawing']->searchMode = 'exact';
$dbo->cols['tmp_drawing']->capContClassDefault = array();
$dbo->cols['tmp_drawing']->valContClassDefault = array();
$dbo->cols['tmp_drawing']->option->defaultMethod = 'text';
$dbo->cols['tmp_drawing']->option->searchMethod = 'text';
$dbo->cols['tmp_drawing']->option->listMethod = 'text';
$dbo->cols['tmp_drawing']->option->detailMethod = 'text';
$dbo->cols['tmp_drawing']->option->newMethod = 'text';
$dbo->cols['tmp_drawing']->option->editMethod = 'text';
$dbo->cols['tmp_mastercard'] = new DBO_COL('tmp_mastercard', 'varchar', '-1', '104');
$dbo->cols['tmp_mastercard']->inputTypeDefault = 'text';
$dbo->cols['tmp_mastercard']->searchMode = 'exact';
$dbo->cols['tmp_mastercard']->capContClassDefault = array();
$dbo->cols['tmp_mastercard']->valContClassDefault = array();
$dbo->cols['tmp_mastercard']->option->defaultMethod = 'text';
$dbo->cols['tmp_mastercard']->option->searchMethod = 'text';
$dbo->cols['tmp_mastercard']->option->listMethod = 'text';
$dbo->cols['tmp_mastercard']->option->detailMethod = 'text';
$dbo->cols['tmp_mastercard']->option->newMethod = 'text';
$dbo->cols['tmp_mastercard']->option->editMethod = 'text';
$dbo->cols['tmp_colorseperation'] = new DBO_COL('tmp_colorseperation', 'varchar', '-1', '104');
$dbo->cols['tmp_colorseperation']->inputTypeDefault = 'text';
$dbo->cols['tmp_colorseperation']->searchMode = 'exact';
$dbo->cols['tmp_colorseperation']->capContClassDefault = array();
$dbo->cols['tmp_colorseperation']->valContClassDefault = array();
$dbo->cols['tmp_colorseperation']->option->defaultMethod = 'text';
$dbo->cols['tmp_colorseperation']->option->searchMethod = 'text';
$dbo->cols['tmp_colorseperation']->option->listMethod = 'text';
$dbo->cols['tmp_colorseperation']->option->detailMethod = 'text';
$dbo->cols['tmp_colorseperation']->option->newMethod = 'text';
$dbo->cols['tmp_colorseperation']->option->editMethod = 'text';
$dbo->cols['tmp_barcode'] = new DBO_COL('tmp_barcode', 'varchar', '-1', '104');
$dbo->cols['tmp_barcode']->inputTypeDefault = 'text';
$dbo->cols['tmp_barcode']->searchMode = 'exact';
$dbo->cols['tmp_barcode']->capContClassDefault = array();
$dbo->cols['tmp_barcode']->valContClassDefault = array();
$dbo->cols['tmp_barcode']->option->defaultMethod = 'text';
$dbo->cols['tmp_barcode']->option->searchMethod = 'text';
$dbo->cols['tmp_barcode']->option->listMethod = 'text';
$dbo->cols['tmp_barcode']->option->detailMethod = 'text';
$dbo->cols['tmp_barcode']->option->newMethod = 'text';
$dbo->cols['tmp_barcode']->option->editMethod = 'text';
$dbo->cols['tmp_tapping'] = new DBO_COL('tmp_tapping', 'varchar', '-1', '104');
$dbo->cols['tmp_tapping']->inputTypeDefault = 'text';
$dbo->cols['tmp_tapping']->searchMode = 'exact';
$dbo->cols['tmp_tapping']->capContClassDefault = array();
$dbo->cols['tmp_tapping']->valContClassDefault = array();
$dbo->cols['tmp_tapping']->option->defaultMethod = 'text';
$dbo->cols['tmp_tapping']->option->searchMethod = 'text';
$dbo->cols['tmp_tapping']->option->listMethod = 'text';
$dbo->cols['tmp_tapping']->option->detailMethod = 'text';
$dbo->cols['tmp_tapping']->option->newMethod = 'text';
$dbo->cols['tmp_tapping']->option->editMethod = 'text';
$dbo->cols['tmp_total'] = new DBO_COL('tmp_total', 'varchar', '-1', '104');
$dbo->cols['tmp_total']->inputTypeDefault = 'text';
$dbo->cols['tmp_total']->searchMode = 'exact';
$dbo->cols['tmp_total']->capContClassDefault = array();
$dbo->cols['tmp_total']->valContClassDefault = array();
$dbo->cols['tmp_total']->option->defaultMethod = 'text';
$dbo->cols['tmp_total']->option->searchMethod = 'text';
$dbo->cols['tmp_total']->option->listMethod = 'text';
$dbo->cols['tmp_total']->option->detailMethod = 'text';
$dbo->cols['tmp_total']->option->newMethod = 'text';
$dbo->cols['tmp_total']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_tmp_dailysalereport_custom_new';
function dbo_tmp_dailysalereport_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_tmp_dailysalereport_custom_edit';
function dbo_tmp_dailysalereport_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_tmp_dailysalereport_custom_search';
function dbo_tmp_dailysalereport_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_tmp_dailysalereport_custom_delete';
function dbo_tmp_dailysalereport_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_tmp_dailysalereport_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>