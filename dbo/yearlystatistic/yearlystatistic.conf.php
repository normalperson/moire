<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'yearlystatistic';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjobsheet';
$dbo->key = array();
$dbo->sql = 'select joboutput,js_currency,js_price,count(*)
from mjobsheet 
left join (
select string_agg(jol_title,\', \' order by jo_id) joboutput,jo_jsid from mjoboutput
join mjoboutputlookup on jol_id = jo_outputcode::integer 
group by jo_jsid) b on js_id = b.jo_jsid
where js_request_date > \'2015-01-01\'
and js_request_date < \'2016-01-01\'
group by joboutput,js_currency,js_price
order by 1';
$dbo->col = array('joboutput', 'js_currency', 'js_price', 'count');
$dbo->colList = array('joboutput', 'js_currency', 'js_price', 'count');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('joboutput', 'js_currency', 'js_price', 'count');
$dbo->colNew = array('joboutput', 'js_currency', 'js_price', 'count');
$dbo->colEdit = array('joboutput', 'js_currency', 'js_price', 'count');
$dbo->colSearch = array('joboutput', 'js_currency', 'js_price', 'count');
$dbo->colExport = array('joboutput', 'js_currency', 'js_price', 'count');
$dbo->colSort = array();
$dbo->colSum = array();
$dbo->colSumPage = array();
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array();
$dbo->canSearch = false;
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
$dbo->theme = 'metro';
$dbo->layout = 'AlwaysList';
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
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'array_count_value', 'qstr', 'check_ip_online', 'implode_multi', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'displaysearchdate', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_55c592448c3fb5_73430725', 'dbo_yearlystatistic_customize');
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['joboutput'] = new DBO_COL('joboutput', 'text', '-1', '-1');
$dbo->cols['joboutput']->inputTypeDefault = 'text';
$dbo->cols['joboutput']->searchMode = 'exact';
$dbo->cols['joboutput']->capContClassDefault = array();
$dbo->cols['joboutput']->valContClassDefault = array();
$dbo->cols['joboutput']->option->defaultMethod = 'text';
$dbo->cols['joboutput']->option->searchMethod = 'text';
$dbo->cols['joboutput']->option->listMethod = 'text';
$dbo->cols['joboutput']->option->detailMethod = 'text';
$dbo->cols['joboutput']->option->newMethod = 'text';
$dbo->cols['joboutput']->option->editMethod = 'text';
$dbo->cols['js_currency'] = new DBO_COL('js_currency', 'varchar', '-1', '54');
$dbo->cols['js_currency']->inputTypeDefault = 'text';
$dbo->cols['js_currency']->searchMode = 'exact';
$dbo->cols['js_currency']->capContClassDefault = array();
$dbo->cols['js_currency']->valContClassDefault = array();
$dbo->cols['js_currency']->option->defaultMethod = 'text';
$dbo->cols['js_currency']->option->searchMethod = 'text';
$dbo->cols['js_currency']->option->listMethod = 'text';
$dbo->cols['js_currency']->option->detailMethod = 'text';
$dbo->cols['js_currency']->option->newMethod = 'text';
$dbo->cols['js_currency']->option->editMethod = 'text';
$dbo->cols['js_price'] = new DBO_COL('js_price', 'numeric', '-1', '1310728');
$dbo->cols['js_price']->inputTypeDefault = 'text';
$dbo->cols['js_price']->searchMode = 'exact';
$dbo->cols['js_price']->capContClassDefault = array();
$dbo->cols['js_price']->valContClassDefault = array();
$dbo->cols['js_price']->option->defaultMethod = 'text';
$dbo->cols['js_price']->option->searchMethod = 'text';
$dbo->cols['js_price']->option->listMethod = 'text';
$dbo->cols['js_price']->option->detailMethod = 'text';
$dbo->cols['js_price']->option->newMethod = 'text';
$dbo->cols['js_price']->option->editMethod = 'text';
$dbo->cols['count'] = new DBO_COL('count', 'int8', '8', '-1');
$dbo->cols['count']->inputTypeDefault = 'text';
$dbo->cols['count']->searchMode = 'exact';
$dbo->cols['count']->capContClassDefault = array();
$dbo->cols['count']->valContClassDefault = array();
$dbo->cols['count']->option->defaultMethod = 'text';
$dbo->cols['count']->option->searchMethod = 'text';
$dbo->cols['count']->option->listMethod = 'text';
$dbo->cols['count']->option->detailMethod = 'text';
$dbo->cols['count']->option->newMethod = 'text';
$dbo->cols['count']->option->editMethod = 'text';

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
class DBO_custom_yearlystatistic extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_yearlystatistic_custom_new';
function dbo_yearlystatistic_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_yearlystatistic_custom_edit';
function dbo_yearlystatistic_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_yearlystatistic_custom_search';
function dbo_yearlystatistic_custom_search(&$search, $dbo){
}

$dbo->deleteModifier = 'dbo_yearlystatistic_custom_delete';
function dbo_yearlystatistic_custom_delete($table, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_yearlystatistic_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>