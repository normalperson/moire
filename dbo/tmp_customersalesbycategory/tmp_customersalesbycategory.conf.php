<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'tmp_customersalesbycategory';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'tmp_customersalesbycategory';
$dbo->key = array('tmp_customername');
$dbo->sql = 'select * from tmp_customersalesbycategory';
$dbo->col = array('tmp_customername', 'tmp_mastercard', 'tmp_colourseperation', 'tmp_barcode', 'tmp_trapping', 'tmp_monotone', 'tmp_total', 'tmp_date');
$dbo->colList = array('tmp_date', 'tmp_customername', 'tmp_mastercard', 'tmp_colourseperation', 'tmp_barcode', 'tmp_monotone', 'tmp_trapping', 'tmp_total');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('tmp_customername', 'tmp_mastercard', 'tmp_colourseperation', 'tmp_barcode', 'tmp_trapping', 'tmp_monotone', 'tmp_total');
$dbo->colNew = array('tmp_date', 'tmp_customername', 'tmp_mastercard', 'tmp_colourseperation', 'tmp_barcode', 'tmp_trapping', 'tmp_monotone', 'tmp_total');
$dbo->colEdit = array('tmp_customername', 'tmp_mastercard', 'tmp_colourseperation', 'tmp_barcode', 'tmp_trapping', 'tmp_monotone', 'tmp_total');
$dbo->colSearch = array('tmp_date', 'tmp_customername', 'tmp_mastercard', 'tmp_colourseperation', 'tmp_barcode', 'tmp_trapping', 'tmp_monotone');
$dbo->colExport = array('tmp_customername', 'tmp_mastercard', 'tmp_colourseperation', 'tmp_barcode', 'tmp_trapping', 'tmp_monotone', 'tmp_total');
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
$dbo->titleList = 'Customer sale by category report';
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
$dbo->cols['tmp_colourseperation'] = new DBO_COL('tmp_colourseperation', 'varchar', '-1', '104');
$dbo->cols['tmp_colourseperation']->inputTypeDefault = 'text';
$dbo->cols['tmp_colourseperation']->searchMode = 'exact';
$dbo->cols['tmp_colourseperation']->capContClassDefault = array();
$dbo->cols['tmp_colourseperation']->valContClassDefault = array();
$dbo->cols['tmp_colourseperation']->option->defaultMethod = 'text';
$dbo->cols['tmp_colourseperation']->option->searchMethod = 'text';
$dbo->cols['tmp_colourseperation']->option->listMethod = 'text';
$dbo->cols['tmp_colourseperation']->option->detailMethod = 'text';
$dbo->cols['tmp_colourseperation']->option->newMethod = 'text';
$dbo->cols['tmp_colourseperation']->option->editMethod = 'text';
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
$dbo->cols['tmp_trapping'] = new DBO_COL('tmp_trapping', 'varchar', '-1', '104');
$dbo->cols['tmp_trapping']->inputTypeDefault = 'text';
$dbo->cols['tmp_trapping']->searchMode = 'exact';
$dbo->cols['tmp_trapping']->capContClassDefault = array();
$dbo->cols['tmp_trapping']->valContClassDefault = array();
$dbo->cols['tmp_trapping']->option->defaultMethod = 'text';
$dbo->cols['tmp_trapping']->option->searchMethod = 'text';
$dbo->cols['tmp_trapping']->option->listMethod = 'text';
$dbo->cols['tmp_trapping']->option->detailMethod = 'text';
$dbo->cols['tmp_trapping']->option->newMethod = 'text';
$dbo->cols['tmp_trapping']->option->editMethod = 'text';
$dbo->cols['tmp_monotone'] = new DBO_COL('tmp_monotone', 'varchar', '-1', '104');
$dbo->cols['tmp_monotone']->inputTypeDefault = 'text';
$dbo->cols['tmp_monotone']->searchMode = 'exact';
$dbo->cols['tmp_monotone']->capContClassDefault = array();
$dbo->cols['tmp_monotone']->valContClassDefault = array();
$dbo->cols['tmp_monotone']->option->defaultMethod = 'text';
$dbo->cols['tmp_monotone']->option->searchMethod = 'text';
$dbo->cols['tmp_monotone']->option->listMethod = 'text';
$dbo->cols['tmp_monotone']->option->detailMethod = 'text';
$dbo->cols['tmp_monotone']->option->newMethod = 'text';
$dbo->cols['tmp_monotone']->option->editMethod = 'text';
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
$dbo->newModifier = 'dbo_tmp_customersalesbycategory_custom_new';
function dbo_tmp_customersalesbycategory_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_tmp_customersalesbycategory_custom_edit';
function dbo_tmp_customersalesbycategory_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_tmp_customersalesbycategory_custom_search';
function dbo_tmp_customersalesbycategory_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_tmp_customersalesbycategory_custom_delete';
function dbo_tmp_customersalesbycategory_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_tmp_customersalesbycategory_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>