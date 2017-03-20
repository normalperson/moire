<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'rpt_dailyoutput';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjoboutput';
$dbo->key = array();
$dbo->sql = 'select date_trunc(\'day\',js_request_date) as rpt_date,js_orgid,
sum (case when jo_outputcode in (\'27\',\'34\',\'41\',\'48\') then js_totalinch else 0 end) normal_output,
sum (case when jo_outputcode in (\'28\',\'35\',\'42\',\'49\') then js_totalinch else 0 end) advance_output
from mjoboutput
join mjobsheet on jo_jsid = js_id
group by date_trunc(\'day\',js_request_date),js_orgid
order by  date_trunc(\'day\',js_request_date) desc';
$dbo->col = array('rpt_date', 'js_orgid', 'normal_output', 'advance_output');
$dbo->colList = array('rpt_date', 'js_orgid', 'normal_output', 'advance_output');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('js_orgid', 'normal_output', 'advance_output');
$dbo->colNew = array('js_orgid', 'normal_output', 'advance_output');
$dbo->colEdit = array('js_orgid', 'normal_output', 'advance_output');
$dbo->colSearch = array('rpt_date', 'js_orgid');
$dbo->colExport = array('rpt_date', 'js_orgid', 'normal_output', 'advance_output');
$dbo->colSort = array();
$dbo->colSum = array('normal_output', 'advance_output');
$dbo->colSumPage = array('normal_output', 'advance_output');
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array();
$dbo->canSearch = true;
$dbo->canNew = false;
$dbo->canEdit = false;
$dbo->canDelete = false;
$dbo->canDetail = false;
$dbo->canListEdit = false;
$dbo->canListNew = false;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->exportFormat = array('excel');
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'AlwaysList';
$dbo->pageLinkCount = '7';
$dbo->recordPerPage = '100';
$dbo->showRecordNo = '1';
$dbo->defaultState = 'list';
$dbo->maxSortCount = '9';
$dbo->defaultDateFormat = 'yyyy-mm-dd';
$dbo->defaultDateTimeFormat = 'yyyy-mm-dd hh24:min:ss';
$dbo->defaultTimeFormat = 'hh24:min:ss';
$dbo->lang = 'EN-US';
$dbo->pdfEngine = 'dompdf';
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'array_count_value', 'qstr', 'check_ip_online', 'implode_multi', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'displaysearchdate', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_552a66a6af7718_55672847', 'dbo_rpt_dailyoutput_customize');
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['date_trunc'] = new DBO_COL('date_trunc', 'timestamptz', '8', '-1');
$dbo->cols['date_trunc']->inputTypeDefault = 'text';
$dbo->cols['date_trunc']->searchMode = 'exact';
$dbo->cols['date_trunc']->capContClassDefault = array();
$dbo->cols['date_trunc']->valContClassDefault = array();
$dbo->cols['date_trunc']->option->defaultMethod = 'text';
$dbo->cols['date_trunc']->option->searchMethod = 'text';
$dbo->cols['date_trunc']->option->listMethod = 'text';
$dbo->cols['date_trunc']->option->detailMethod = 'text';
$dbo->cols['date_trunc']->option->newMethod = 'text';
$dbo->cols['date_trunc']->option->editMethod = 'text';
$dbo->cols['js_orgid'] = new DBO_COL('js_orgid', 'int4', '4', '-1');
$dbo->cols['js_orgid']->inputTypeDefault = 'select';
$dbo->cols['js_orgid']->searchMode = 'exact';
$dbo->cols['js_orgid']->capContClassDefault = array();
$dbo->cols['js_orgid']->valContClassDefault = array();
$dbo->cols['js_orgid']->option->default = 'select org_id,org_name from fcorg
where org_external = \'Y\'
order by 2';
$dbo->cols['js_orgid']->option->defaultMethod = 'sql';
$dbo->cols['js_orgid']->option->searchMethod = 'text';
$dbo->cols['js_orgid']->option->listMethod = 'text';
$dbo->cols['js_orgid']->option->detailMethod = 'text';
$dbo->cols['js_orgid']->option->newMethod = 'text';
$dbo->cols['js_orgid']->option->editMethod = 'text';
$dbo->cols['normal_output'] = new DBO_COL('normal_output', 'numeric', '-1', '-1');
$dbo->cols['normal_output']->displayDataType = 'currency';
$dbo->cols['normal_output']->inputTypeDefault = 'text';
$dbo->cols['normal_output']->searchMode = 'exact';
$dbo->cols['normal_output']->capContClassDefault = array();
$dbo->cols['normal_output']->valContClassDefault = array();
$dbo->cols['normal_output']->option->defaultMethod = 'text';
$dbo->cols['normal_output']->option->searchMethod = 'text';
$dbo->cols['normal_output']->option->listMethod = 'text';
$dbo->cols['normal_output']->option->detailMethod = 'text';
$dbo->cols['normal_output']->option->newMethod = 'text';
$dbo->cols['normal_output']->option->editMethod = 'text';
$dbo->cols['advance_output'] = new DBO_COL('advance_output', 'numeric', '-1', '-1');
$dbo->cols['advance_output']->displayDataType = 'currency';
$dbo->cols['advance_output']->inputTypeDefault = 'text';
$dbo->cols['advance_output']->searchMode = 'exact';
$dbo->cols['advance_output']->capContClassDefault = array();
$dbo->cols['advance_output']->valContClassDefault = array();
$dbo->cols['advance_output']->option->defaultMethod = 'text';
$dbo->cols['advance_output']->option->searchMethod = 'text';
$dbo->cols['advance_output']->option->listMethod = 'text';
$dbo->cols['advance_output']->option->detailMethod = 'text';
$dbo->cols['advance_output']->option->newMethod = 'text';
$dbo->cols['advance_output']->option->editMethod = 'text';
$dbo->cols['rpt_date'] = new DBO_COL('rpt_date', 'timestamptz', '8', '-1');
$dbo->cols['rpt_date']->displayDataType = 'date';
$dbo->cols['rpt_date']->inputTypeDefault = 'text';
$dbo->cols['rpt_date']->inputTypeSearch = 'BootstrapDateRange';
$dbo->cols['rpt_date']->searchMode = 'exact';
$dbo->cols['rpt_date']->capContClassDefault = array();
$dbo->cols['rpt_date']->valContClassDefault = array();
$dbo->cols['rpt_date']->option->defaultMethod = 'text';
$dbo->cols['rpt_date']->option->searchMethod = 'text';
$dbo->cols['rpt_date']->option->listMethod = 'text';
$dbo->cols['rpt_date']->option->detailMethod = 'text';
$dbo->cols['rpt_date']->option->newMethod = 'text';
$dbo->cols['rpt_date']->option->editMethod = 'text';

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
class DBO_custom_rpt_dailyoutput extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_rpt_dailyoutput_custom_new';
function dbo_rpt_dailyoutput_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_rpt_dailyoutput_custom_edit';
function dbo_rpt_dailyoutput_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_rpt_dailyoutput_custom_search';
function dbo_rpt_dailyoutput_custom_search(&$search, $dbo){
}

$dbo->deleteModifier = 'dbo_rpt_dailyoutput_custom_delete';
function dbo_rpt_dailyoutput_custom_delete($table, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_rpt_dailyoutput_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>