<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'currencysetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fccurrency';
$dbo->key = array('curr_code');
$dbo->sql = 'select * from fccurrency';
$dbo->col = array('curr_code', 'curr_name', 'curr_symbol', 'curr_decimal', 'curr_thousand', 'curr_precision', 'curr_format', 'curr_rate', 'curr_status');
$dbo->colList = array('curr_name', 'curr_symbol', 'curr_rate');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array();
$dbo->colNew = array('curr_name', 'curr_code', 'curr_format', 'curr_precision', 'curr_rate', 'curr_symbol', 'curr_status');
$dbo->colEdit = array('curr_name', 'curr_code', 'curr_format', 'curr_precision', 'curr_rate', 'curr_symbol', 'curr_status');
$dbo->colSearch = array();
$dbo->colExport = array();
$dbo->colSort = array();
$dbo->colSum = array();
$dbo->colSumPage = array();
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array();
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
$dbo->listEditToggle = false;
$dbo->showSearch = true;
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = '7';
$dbo->recordPerPage = '10';
$dbo->showRecordNo = '1';
$dbo->defaultState = 'list';
$dbo->maxSortCount = '9';
$dbo->defaultDateFormat = 'yyyy-mm-dd';
$dbo->defaultDateTimeFormat = 'yyyy-mm-dd hh24:min:ss';
$dbo->defaultTimeFormat = 'hh24:min:ss';
$dbo->lang = 'EN-US';
$dbo->pdfEngine = 'dompdf';
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
$dbo->cols['cr_code']->exportUseLookup = true;
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
$dbo->cols['cr_name']->exportUseLookup = true;
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
$dbo->cols['cr_rate']->exportUseLookup = true;
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
$dbo->cols['cr_symbol']->exportUseLookup = true;
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
$dbo->cols['cr_format']->exportUseLookup = true;
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
$dbo->cols['cr_decimalsep']->exportUseLookup = true;
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
$dbo->cols['cr_thousandsep']->exportUseLookup = true;
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
$dbo->cols['cr_precision']->exportUseLookup = true;
$dbo->cols['cr_precision']->searchMode = 'exact';
$dbo->cols['cr_precision']->capContClassDefault = array();
$dbo->cols['cr_precision']->valContClassDefault = array();
$dbo->cols['cr_precision']->option->defaultMethod = 'text';
$dbo->cols['cr_precision']->option->searchMethod = 'text';
$dbo->cols['cr_precision']->option->listMethod = 'text';
$dbo->cols['cr_precision']->option->detailMethod = 'text';
$dbo->cols['cr_precision']->option->newMethod = 'text';
$dbo->cols['cr_precision']->option->editMethod = 'text';
$dbo->cols['curr_code'] = new DBO_COL('curr_code', 'varchar', '-1', '16');
$dbo->cols['curr_code']->inputTypeDefault = 'text';
$dbo->cols['curr_code']->exportUseLookup = true;
$dbo->cols['curr_code']->searchMode = 'exact';
$dbo->cols['curr_code']->capContClassDefault = array();
$dbo->cols['curr_code']->valContClassDefault = array();
$dbo->cols['curr_code']->option->defaultMethod = 'text';
$dbo->cols['curr_code']->option->searchMethod = 'text';
$dbo->cols['curr_code']->option->listMethod = 'text';
$dbo->cols['curr_code']->option->detailMethod = 'text';
$dbo->cols['curr_code']->option->newMethod = 'text';
$dbo->cols['curr_code']->option->editMethod = 'text';
$dbo->cols['curr_name'] = new DBO_COL('curr_name', 'varchar', '-1', '104');
$dbo->cols['curr_name']->inputTypeDefault = 'text';
$dbo->cols['curr_name']->exportUseLookup = true;
$dbo->cols['curr_name']->searchMode = 'exact';
$dbo->cols['curr_name']->capContClassDefault = array();
$dbo->cols['curr_name']->valContClassDefault = array();
$dbo->cols['curr_name']->option->defaultMethod = 'text';
$dbo->cols['curr_name']->option->searchMethod = 'text';
$dbo->cols['curr_name']->option->listMethod = 'text';
$dbo->cols['curr_name']->option->detailMethod = 'text';
$dbo->cols['curr_name']->option->newMethod = 'text';
$dbo->cols['curr_name']->option->editMethod = 'text';
$dbo->cols['curr_symbol'] = new DBO_COL('curr_symbol', 'varchar', '-1', '9');
$dbo->cols['curr_symbol']->inputTypeDefault = 'text';
$dbo->cols['curr_symbol']->exportUseLookup = true;
$dbo->cols['curr_symbol']->searchMode = 'exact';
$dbo->cols['curr_symbol']->capContClassDefault = array();
$dbo->cols['curr_symbol']->valContClassDefault = array();
$dbo->cols['curr_symbol']->option->defaultMethod = 'text';
$dbo->cols['curr_symbol']->option->searchMethod = 'text';
$dbo->cols['curr_symbol']->option->listMethod = 'text';
$dbo->cols['curr_symbol']->option->detailMethod = 'text';
$dbo->cols['curr_symbol']->option->newMethod = 'text';
$dbo->cols['curr_symbol']->option->editMethod = 'text';
$dbo->cols['curr_decimal'] = new DBO_COL('curr_decimal', 'varchar', '-1', '5');
$dbo->cols['curr_decimal']->inputTypeDefault = 'text';
$dbo->cols['curr_decimal']->exportUseLookup = true;
$dbo->cols['curr_decimal']->searchMode = 'exact';
$dbo->cols['curr_decimal']->capContClassDefault = array();
$dbo->cols['curr_decimal']->valContClassDefault = array();
$dbo->cols['curr_decimal']->option->defaultMethod = 'text';
$dbo->cols['curr_decimal']->option->searchMethod = 'text';
$dbo->cols['curr_decimal']->option->listMethod = 'text';
$dbo->cols['curr_decimal']->option->detailMethod = 'text';
$dbo->cols['curr_decimal']->option->newMethod = 'text';
$dbo->cols['curr_decimal']->option->editMethod = 'text';
$dbo->cols['curr_thousand'] = new DBO_COL('curr_thousand', 'varchar', '-1', '5');
$dbo->cols['curr_thousand']->inputTypeDefault = 'text';
$dbo->cols['curr_thousand']->exportUseLookup = true;
$dbo->cols['curr_thousand']->searchMode = 'exact';
$dbo->cols['curr_thousand']->capContClassDefault = array();
$dbo->cols['curr_thousand']->valContClassDefault = array();
$dbo->cols['curr_thousand']->option->defaultMethod = 'text';
$dbo->cols['curr_thousand']->option->searchMethod = 'text';
$dbo->cols['curr_thousand']->option->listMethod = 'text';
$dbo->cols['curr_thousand']->option->detailMethod = 'text';
$dbo->cols['curr_thousand']->option->newMethod = 'text';
$dbo->cols['curr_thousand']->option->editMethod = 'text';
$dbo->cols['curr_precision'] = new DBO_COL('curr_precision', 'int4', '4', '-1');
$dbo->cols['curr_precision']->inputTypeDefault = 'text';
$dbo->cols['curr_precision']->exportUseLookup = true;
$dbo->cols['curr_precision']->searchMode = 'exact';
$dbo->cols['curr_precision']->capContClassDefault = array();
$dbo->cols['curr_precision']->valContClassDefault = array();
$dbo->cols['curr_precision']->option->defaultMethod = 'text';
$dbo->cols['curr_precision']->option->searchMethod = 'text';
$dbo->cols['curr_precision']->option->listMethod = 'text';
$dbo->cols['curr_precision']->option->detailMethod = 'text';
$dbo->cols['curr_precision']->option->newMethod = 'text';
$dbo->cols['curr_precision']->option->editMethod = 'text';
$dbo->cols['curr_format'] = new DBO_COL('curr_format', 'varchar', '-1', '36');
$dbo->cols['curr_format']->inputTypeDefault = 'text';
$dbo->cols['curr_format']->exportUseLookup = true;
$dbo->cols['curr_format']->searchMode = 'exact';
$dbo->cols['curr_format']->capContClassDefault = array();
$dbo->cols['curr_format']->valContClassDefault = array();
$dbo->cols['curr_format']->option->defaultMethod = 'text';
$dbo->cols['curr_format']->option->searchMethod = 'text';
$dbo->cols['curr_format']->option->listMethod = 'text';
$dbo->cols['curr_format']->option->detailMethod = 'text';
$dbo->cols['curr_format']->option->newMethod = 'text';
$dbo->cols['curr_format']->option->editMethod = 'text';
$dbo->cols['curr_rate'] = new DBO_COL('curr_rate', 'numeric', '-1', '-1');
$dbo->cols['curr_rate']->inputTypeDefault = 'text';
$dbo->cols['curr_rate']->exportUseLookup = true;
$dbo->cols['curr_rate']->searchMode = 'exact';
$dbo->cols['curr_rate']->capContClassDefault = array();
$dbo->cols['curr_rate']->valContClassDefault = array();
$dbo->cols['curr_rate']->option->defaultMethod = 'text';
$dbo->cols['curr_rate']->option->searchMethod = 'text';
$dbo->cols['curr_rate']->option->listMethod = 'text';
$dbo->cols['curr_rate']->option->detailMethod = 'text';
$dbo->cols['curr_rate']->option->newMethod = 'text';
$dbo->cols['curr_rate']->option->editMethod = 'text';
$dbo->cols['curr_status'] = new DBO_COL('curr_status', 'varchar', '-1', '36');
$dbo->cols['curr_status']->inputTypeDefault = 'text';
$dbo->cols['curr_status']->exportUseLookup = true;
$dbo->cols['curr_status']->searchMode = 'exact';
$dbo->cols['curr_status']->capContClassDefault = array();
$dbo->cols['curr_status']->valContClassDefault = array();
$dbo->cols['curr_status']->option->defaultMethod = 'text';
$dbo->cols['curr_status']->option->searchMethod = 'text';
$dbo->cols['curr_status']->option->listMethod = 'text';
$dbo->cols['curr_status']->option->detailMethod = 'text';
$dbo->cols['curr_status']->option->newMethod = 'text';
$dbo->cols['curr_status']->option->editMethod = 'text';

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
# enable overwriting DBO class
class DBO_custom_currencysetup extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_currencysetup_custom_new';
function dbo_currencysetup_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_currencysetup_custom_edit';
function dbo_currencysetup_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_currencysetup_custom_search';
function dbo_currencysetup_custom_search(&$search, $dbo){
}

$dbo->deleteModifier = 'dbo_currencysetup_custom_delete';
function dbo_currencysetup_custom_delete($table, $wheres, $dbo){
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