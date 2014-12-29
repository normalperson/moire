<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'publicholiday';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fclocaleholiday';
$dbo->key = array('lch_id');
$dbo->sql = 'select * from fclocaleholiday';
$dbo->col = array('lch_id', 'lch_lccode', 'lch_date', 'lch_recurring', 'lch_description');
$dbo->colList = array('lch_lccode', 'lch_date', 'lch_recurring', 'lch_description');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('lch_id', 'lch_lccode', 'lch_date', 'lch_recurring', 'lch_description');
$dbo->colNew = array('lch_lccode', 'lch_date', 'lch_recurring', 'lch_description');
$dbo->colEdit = array('lch_lccode', 'lch_date', 'lch_recurring', 'lch_description');
$dbo->colSearch = array('lch_id', 'lch_lccode', 'lch_date', 'lch_recurring', 'lch_description');
$dbo->colExport = array('lch_id', 'lch_lccode', 'lch_date', 'lch_recurring', 'lch_description');
$dbo->colSort = array();
$dbo->colSum = array();
$dbo->colSumPage = array();
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array();
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
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'array_count_value', 'qstr', 'check_ip_online', 'implode_multi', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_5484fde85fe702_55291486', 'dbo_publicholiday_customize');
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['lch_id'] = new DBO_COL('lch_id', 'int4', '4', '-1');
$dbo->cols['lch_id']->inputTypeDefault = 'text';
$dbo->cols['lch_id']->searchMode = 'exact';
$dbo->cols['lch_id']->capContClassDefault = array();
$dbo->cols['lch_id']->valContClassDefault = array();
$dbo->cols['lch_id']->option->defaultMethod = 'text';
$dbo->cols['lch_id']->option->searchMethod = 'text';
$dbo->cols['lch_id']->option->listMethod = 'text';
$dbo->cols['lch_id']->option->detailMethod = 'text';
$dbo->cols['lch_id']->option->newMethod = 'text';
$dbo->cols['lch_id']->option->editMethod = 'text';
$dbo->cols['lch_lccode'] = new DBO_COL('lch_lccode', 'varchar', '-1', '36');
$dbo->cols['lch_lccode']->inputTypeDefault = 'select';
$dbo->cols['lch_lccode']->mandatoryNew = '1';
$dbo->cols['lch_lccode']->mandatoryEdit = '1';
$dbo->cols['lch_lccode']->searchMode = 'exact';
$dbo->cols['lch_lccode']->capContClassDefault = array();
$dbo->cols['lch_lccode']->valContClassDefault = array();
$dbo->cols['lch_lccode']->option->default = 'MYWP|Malaysia Wilayah Persekutuan';
$dbo->cols['lch_lccode']->option->defaultMethod = 'text';
$dbo->cols['lch_lccode']->option->searchMethod = 'text';
$dbo->cols['lch_lccode']->option->listMethod = 'text';
$dbo->cols['lch_lccode']->option->detailMethod = 'text';
$dbo->cols['lch_lccode']->option->newMethod = 'text';
$dbo->cols['lch_lccode']->option->editMethod = 'text';
$dbo->cols['lch_date'] = new DBO_COL('lch_date', 'date', '4', '-1');
$dbo->cols['lch_date']->displayDataType = 'date';
$dbo->cols['lch_date']->inputTypeDefault = 'BootstrapDate';
$dbo->cols['lch_date']->mandatoryNew = '1';
$dbo->cols['lch_date']->mandatoryEdit = '1';
$dbo->cols['lch_date']->searchMode = 'exact';
$dbo->cols['lch_date']->capContClassDefault = array();
$dbo->cols['lch_date']->valContClassDefault = array();
$dbo->cols['lch_date']->option->defaultMethod = 'text';
$dbo->cols['lch_date']->option->searchMethod = 'text';
$dbo->cols['lch_date']->option->listMethod = 'text';
$dbo->cols['lch_date']->option->detailMethod = 'text';
$dbo->cols['lch_date']->option->newMethod = 'text';
$dbo->cols['lch_date']->option->editMethod = 'text';
$dbo->cols['lch_recurring'] = new DBO_COL('lch_recurring', 'varchar', '-1', '5');
$dbo->cols['lch_recurring']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['lch_recurring']->mandatoryNew = '1';
$dbo->cols['lch_recurring']->mandatoryEdit = '1';
$dbo->cols['lch_recurring']->searchMode = 'exact';
$dbo->cols['lch_recurring']->capContClassDefault = array();
$dbo->cols['lch_recurring']->valContClassDefault = array();
$dbo->cols['lch_recurring']->option->default = 'Y|Yes
N|No';
$dbo->cols['lch_recurring']->option->defaultMethod = 'text';
$dbo->cols['lch_recurring']->option->searchMethod = 'text';
$dbo->cols['lch_recurring']->option->listMethod = 'text';
$dbo->cols['lch_recurring']->option->detailMethod = 'text';
$dbo->cols['lch_recurring']->option->newMethod = 'text';
$dbo->cols['lch_recurring']->option->editMethod = 'text';
$dbo->cols['lch_description'] = new DBO_COL('lch_description', 'varchar', '-1', '104');
$dbo->cols['lch_description']->inputTypeDefault = 'text';
$dbo->cols['lch_description']->mandatoryNew = '1';
$dbo->cols['lch_description']->mandatoryEdit = '1';
$dbo->cols['lch_description']->searchMode = 'exact';
$dbo->cols['lch_description']->capContClassDefault = array();
$dbo->cols['lch_description']->valContClassDefault = array();
$dbo->cols['lch_description']->option->defaultMethod = 'text';
$dbo->cols['lch_description']->option->searchMethod = 'text';
$dbo->cols['lch_description']->option->listMethod = 'text';
$dbo->cols['lch_description']->option->detailMethod = 'text';
$dbo->cols['lch_description']->option->newMethod = 'text';
$dbo->cols['lch_description']->option->editMethod = 'text';

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
class DBO_custom_publicholiday extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_publicholiday_custom_new';
function dbo_publicholiday_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_publicholiday_custom_edit';
function dbo_publicholiday_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_publicholiday_custom_search';
function dbo_publicholiday_custom_search(&$search, $dbo){
}

$dbo->deleteModifier = 'dbo_publicholiday_custom_delete';
function dbo_publicholiday_custom_delete($table, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_publicholiday_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>