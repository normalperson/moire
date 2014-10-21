<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'rpt_dailyjobsummary';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjobsheet';
$dbo->key = array();
$dbo->sql = 'select cast(js_request_date as date),count(*) totalRequest, 
sum(case when js_Status = \'COMPLETED\' then 1 else 0 end) as totalcomplete,
sum(case when js_status = \'CANCELLED\' then 1 else 0 end) as totalcancel,
sum(case when js_status != \'COMPLETED\' and js_status != \'CANCELLED\' then 1 else 0 end) as totalinprogress,
sum( revertedjob(js_id) ) as revertedjob
from mjobsheet
group by cast(js_request_date as date)
order by cast(js_request_date as date)';
$dbo->col = array('js_request_date', 'totalrequest', 'totalcomplete', 'totalcancel', 'totalinprogress', 'revertedjob');
$dbo->colList = array('js_request_date', 'totalrequest', 'totalcomplete', 'totalcancel', 'totalinprogress', 'revertedjob');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('js_request_date', 'totalrequest', 'totalcomplete', 'totalcancel', 'totalinprogress');
$dbo->colNew = array('js_request_date', 'totalrequest', 'totalcomplete', 'totalcancel', 'totalinprogress');
$dbo->colEdit = array('js_request_date', 'totalrequest', 'totalcomplete', 'totalcancel', 'totalinprogress');
$dbo->colSearch = array('js_request_date');
$dbo->colExport = array('js_request_date', 'totalrequest', 'totalcomplete', 'totalcancel', 'totalinprogress');
$dbo->colSort = array();
$dbo->colSum = array('totalrequest', 'totalcomplete', 'totalcancel', 'totalinprogress');
$dbo->colSumPage = array('totalrequest', 'totalcomplete', 'totalcancel', 'totalinprogress');
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
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'qstr', 'check_ip_online', 'implode_multi', 'array_column', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_54041d8f3bae13_93533903', 'jobsummarylink', 'dbo_rpt_dailyjobsummary_customize');

$dbo->cols['js_request_date'] = new DBO_COL('js_request_date', 'date', '4', '-1');
$dbo->cols['js_request_date']->inputTypeDefault = 'BootstrapDateRange';
$dbo->cols['js_request_date']->searchMode = 'exact';
$dbo->cols['js_request_date']->capContClassDefault = array();
$dbo->cols['js_request_date']->valContClassDefault = array();
$dbo->cols['js_request_date']->option->defaultMethod = 'text';
$dbo->cols['js_request_date']->option->searchMethod = 'text';
$dbo->cols['js_request_date']->option->listMethod = 'text';
$dbo->cols['js_request_date']->option->detailMethod = 'text';
$dbo->cols['js_request_date']->option->newMethod = 'text';
$dbo->cols['js_request_date']->option->editMethod = 'text';
$dbo->cols['totalrequest'] = new DBO_COL('totalrequest', 'int8', '8', '-1');
$dbo->cols['totalrequest']->displayDataType = 'int';
$dbo->cols['totalrequest']->inputTypeDefault = 'text';
$dbo->cols['totalrequest']->searchMode = 'exact';
$dbo->cols['totalrequest']->capContClassDefault = array();
$dbo->cols['totalrequest']->valContClassDefault = array();
$dbo->cols['totalrequest']->option->defaultMethod = 'text';
$dbo->cols['totalrequest']->option->searchMethod = 'text';
$dbo->cols['totalrequest']->option->listMethod = 'text';
$dbo->cols['totalrequest']->option->detailMethod = 'text';
$dbo->cols['totalrequest']->option->newMethod = 'text';
$dbo->cols['totalrequest']->option->editMethod = 'text';
$dbo->cols['totalcomplete'] = new DBO_COL('totalcomplete', 'int8', '8', '-1');
$dbo->cols['totalcomplete']->displayDataType = 'int';
$dbo->cols['totalcomplete']->displayListModifierMethod = 'phpfunc';
$dbo->cols['totalcomplete']->displayListModifier = 'jobsummarylink';
$dbo->cols['totalcomplete']->inputTypeDefault = 'text';
$dbo->cols['totalcomplete']->searchMode = 'exact';
$dbo->cols['totalcomplete']->capContClassDefault = array();
$dbo->cols['totalcomplete']->valContClassDefault = array();
$dbo->cols['totalcomplete']->option->defaultMethod = 'text';
$dbo->cols['totalcomplete']->option->searchMethod = 'text';
$dbo->cols['totalcomplete']->option->listMethod = 'text';
$dbo->cols['totalcomplete']->option->detailMethod = 'text';
$dbo->cols['totalcomplete']->option->newMethod = 'text';
$dbo->cols['totalcomplete']->option->editMethod = 'text';
$dbo->cols['totalcancel'] = new DBO_COL('totalcancel', 'int8', '8', '-1');
$dbo->cols['totalcancel']->displayDataType = 'int';
$dbo->cols['totalcancel']->displayListModifierMethod = 'phpfunc';
$dbo->cols['totalcancel']->displayListModifier = 'jobsummarylink';
$dbo->cols['totalcancel']->inputTypeDefault = 'text';
$dbo->cols['totalcancel']->searchMode = 'exact';
$dbo->cols['totalcancel']->capContClassDefault = array();
$dbo->cols['totalcancel']->valContClassDefault = array();
$dbo->cols['totalcancel']->option->defaultMethod = 'text';
$dbo->cols['totalcancel']->option->searchMethod = 'text';
$dbo->cols['totalcancel']->option->listMethod = 'text';
$dbo->cols['totalcancel']->option->detailMethod = 'text';
$dbo->cols['totalcancel']->option->newMethod = 'text';
$dbo->cols['totalcancel']->option->editMethod = 'text';
$dbo->cols['totalinprogress'] = new DBO_COL('totalinprogress', 'int8', '8', '-1');
$dbo->cols['totalinprogress']->displayDataType = 'int';
$dbo->cols['totalinprogress']->displayListModifierMethod = 'phpfunc';
$dbo->cols['totalinprogress']->displayListModifier = 'jobsummarylink';
$dbo->cols['totalinprogress']->inputTypeDefault = 'text';
$dbo->cols['totalinprogress']->searchMode = 'exact';
$dbo->cols['totalinprogress']->capContClassDefault = array();
$dbo->cols['totalinprogress']->valContClassDefault = array();
$dbo->cols['totalinprogress']->option->defaultMethod = 'text';
$dbo->cols['totalinprogress']->option->searchMethod = 'text';
$dbo->cols['totalinprogress']->option->listMethod = 'text';
$dbo->cols['totalinprogress']->option->detailMethod = 'text';
$dbo->cols['totalinprogress']->option->newMethod = 'text';
$dbo->cols['totalinprogress']->option->editMethod = 'text';
$dbo->cols['revertedjob'] = new DBO_COL('revertedjob', 'int8', '8', '-1');
$dbo->cols['revertedjob']->inputTypeDefault = 'text';
$dbo->cols['revertedjob']->searchMode = 'exact';
$dbo->cols['revertedjob']->capContClassDefault = array();
$dbo->cols['revertedjob']->valContClassDefault = array();
$dbo->cols['revertedjob']->option->defaultMethod = 'text';
$dbo->cols['revertedjob']->option->searchMethod = 'text';
$dbo->cols['revertedjob']->option->listMethod = 'text';
$dbo->cols['revertedjob']->option->detailMethod = 'text';
$dbo->cols['revertedjob']->option->newMethod = 'text';
$dbo->cols['revertedjob']->option->editMethod = 'text';

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
class DBO_custom_rpt_dailyjobsummary extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_rpt_dailyjobsummary_custom_new';
function dbo_rpt_dailyjobsummary_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_rpt_dailyjobsummary_custom_edit';
function dbo_rpt_dailyjobsummary_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_rpt_dailyjobsummary_custom_search';
function dbo_rpt_dailyjobsummary_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_rpt_dailyjobsummary_custom_delete';
function dbo_rpt_dailyjobsummary_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_rpt_dailyjobsummary_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>