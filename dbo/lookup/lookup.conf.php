<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'lookup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fclookup';
$dbo->key = array('lu_id');
$dbo->sql = 'select * from fclookup';
$dbo->col = array('lu_cat', 'lu_code', 'lu_parentcode', 'lu_title', 'lu_status', 'lu_id');
$dbo->colList = array('lu_cat', 'lu_code', 'lu_parentcode', 'lu_title', 'lu_status');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('lu_cat', 'lu_code', 'lu_parentcode', 'lu_title', 'lu_status', 'lu_id');
$dbo->colNew = array('lu_cat', 'lu_code', 'lu_title');
$dbo->colEdit = array('lu_cat', 'lu_code', 'lu_parentcode', 'lu_title', 'lu_status', 'lu_id');
$dbo->colSearch = array('lu_cat', 'lu_code', 'lu_parentcode', 'lu_title', 'lu_status', 'lu_id');
$dbo->colExport = array('lu_cat', 'lu_code', 'lu_parentcode', 'lu_title', 'lu_status', 'lu_id');
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
$dbo->layoutNew = '1|1';
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
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

$dbo->cols['lu_cat'] = new DBO_COL('lu_cat', 'varchar', '-1', '16');
$dbo->cols['lu_cat']->inputTypeDefault = 'text';
$dbo->cols['lu_cat']->inputTypeSearch = 'select';
$dbo->cols['lu_cat']->exportUseLookup = true;
$dbo->cols['lu_cat']->searchMode = 'exact';
$dbo->cols['lu_cat']->capContClassDefault = array();
$dbo->cols['lu_cat']->valContClassDefault = array();
$dbo->cols['lu_cat']->option->default = 'select lu_cat, lu_cat from fclookup
group by lu_cat';
$dbo->cols['lu_cat']->option->defaultMethod = 'sql';
$dbo->cols['lu_cat']->option->searchMethod = 'text';
$dbo->cols['lu_cat']->option->listMethod = 'text';
$dbo->cols['lu_cat']->option->detailMethod = 'text';
$dbo->cols['lu_cat']->option->newMethod = 'text';
$dbo->cols['lu_cat']->option->editMethod = 'text';
$dbo->cols['lu_code'] = new DBO_COL('lu_code', 'varchar', '-1', '54');
$dbo->cols['lu_code']->inputTypeDefault = 'text';
$dbo->cols['lu_code']->exportUseLookup = true;
$dbo->cols['lu_code']->searchMode = 'exact';
$dbo->cols['lu_code']->capContClassDefault = array();
$dbo->cols['lu_code']->valContClassDefault = array();
$dbo->cols['lu_code']->option->defaultMethod = 'text';
$dbo->cols['lu_code']->option->searchMethod = 'text';
$dbo->cols['lu_code']->option->listMethod = 'text';
$dbo->cols['lu_code']->option->detailMethod = 'text';
$dbo->cols['lu_code']->option->newMethod = 'text';
$dbo->cols['lu_code']->option->editMethod = 'text';
$dbo->cols['lu_parentcode'] = new DBO_COL('lu_parentcode', 'varchar', '-1', '16');
$dbo->cols['lu_parentcode']->inputTypeDefault = 'text';
$dbo->cols['lu_parentcode']->exportUseLookup = true;
$dbo->cols['lu_parentcode']->searchMode = 'exact';
$dbo->cols['lu_parentcode']->capContClassDefault = array();
$dbo->cols['lu_parentcode']->valContClassDefault = array();
$dbo->cols['lu_parentcode']->option->defaultMethod = 'text';
$dbo->cols['lu_parentcode']->option->searchMethod = 'text';
$dbo->cols['lu_parentcode']->option->listMethod = 'text';
$dbo->cols['lu_parentcode']->option->detailMethod = 'text';
$dbo->cols['lu_parentcode']->option->newMethod = 'text';
$dbo->cols['lu_parentcode']->option->editMethod = 'text';
$dbo->cols['lu_title'] = new DBO_COL('lu_title', 'varchar', '-1', '204');
$dbo->cols['lu_title']->inputTypeDefault = 'text';
$dbo->cols['lu_title']->exportUseLookup = true;
$dbo->cols['lu_title']->searchMode = 'exact';
$dbo->cols['lu_title']->capContClassDefault = array();
$dbo->cols['lu_title']->valContClassDefault = array();
$dbo->cols['lu_title']->option->defaultMethod = 'text';
$dbo->cols['lu_title']->option->searchMethod = 'text';
$dbo->cols['lu_title']->option->listMethod = 'text';
$dbo->cols['lu_title']->option->detailMethod = 'text';
$dbo->cols['lu_title']->option->newMethod = 'text';
$dbo->cols['lu_title']->option->editMethod = 'text';
$dbo->cols['lu_status'] = new DBO_COL('lu_status', 'varchar', '-1', '16');
$dbo->cols['lu_status']->inputTypeDefault = 'radio';
$dbo->cols['lu_status']->exportUseLookup = true;
$dbo->cols['lu_status']->searchMode = 'exact';
$dbo->cols['lu_status']->capContClassDefault = array();
$dbo->cols['lu_status']->valContClassDefault = array();
$dbo->cols['lu_status']->option->default = 'ACTIVE
INACTIVE';
$dbo->cols['lu_status']->option->defaultMethod = 'text';
$dbo->cols['lu_status']->option->searchMethod = 'text';
$dbo->cols['lu_status']->option->listMethod = 'text';
$dbo->cols['lu_status']->option->detailMethod = 'text';
$dbo->cols['lu_status']->option->newMethod = 'text';
$dbo->cols['lu_status']->option->editMethod = 'text';
$dbo->cols['lu_id'] = new DBO_COL('lu_id', 'int4', '4', '-1');
$dbo->cols['lu_id']->inputTypeDefault = 'text';
$dbo->cols['lu_id']->exportUseLookup = true;
$dbo->cols['lu_id']->searchMode = 'exact';
$dbo->cols['lu_id']->capContClassDefault = array();
$dbo->cols['lu_id']->valContClassDefault = array();
$dbo->cols['lu_id']->option->defaultMethod = 'text';
$dbo->cols['lu_id']->option->searchMethod = 'text';
$dbo->cols['lu_id']->option->listMethod = 'text';
$dbo->cols['lu_id']->option->detailMethod = 'text';
$dbo->cols['lu_id']->option->newMethod = 'text';
$dbo->cols['lu_id']->option->editMethod = 'text';

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
class DBO_custom_lookup extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_lookup_custom_new';
function dbo_lookup_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_lookup_custom_edit';
function dbo_lookup_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_lookup_custom_search';
function dbo_lookup_custom_search(&$search, $dbo){
}

$dbo->deleteModifier = 'dbo_lookup_custom_delete';
function dbo_lookup_custom_delete($table, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_lookup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>