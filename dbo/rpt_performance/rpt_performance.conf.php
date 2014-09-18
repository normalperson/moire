<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'rpt_performance';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcpmcaseflow';
$dbo->key = array();
$dbo->sql = 'select count(*),pmf_end_by, cast(pmf_start_date as date) as actvdate,usr_name,
sum ( case when ( ( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) / timediffinmin(pmf_start_date, pmf_due_date) ) * 100 ) < 0 then 1 else 0 end ) as complysla,
sum ( case when ( ( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) / timediffinmin(pmf_start_date, pmf_due_date) ) * 100 ) > 0 
	and ( ( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) / timediffinmin(pmf_start_date, pmf_due_date) ) * 100 ) <= 50  then 1 else 0 end ) as within50,
sum ( case when ( ( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) / timediffinmin(pmf_start_date, pmf_due_date) ) * 100 ) > 50 
	and ( ( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) / timediffinmin(pmf_start_date, pmf_due_date) ) * 100 ) <= 100  then 1 else 0 end ) as within100,
sum ( case when ( ( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) / timediffinmin(pmf_start_date, pmf_due_date) ) * 100 ) > 100 then 1 else 0 end ) as morethan100	
from fcpmcaseflow
left join fcuser on pmf_end_by = usr_userid
where pmf_due_Date is not null
and pmf_end_status != \'INTERRUPT\'
group by pmf_end_by,cast(pmf_start_date as date),usr_name
order by cast(pmf_start_date as date)';
$dbo->col = array('count', 'pmf_end_by', 'actvdate', 'usr_name', 'complysla', 'within50', 'within100', 'morethan100');
$dbo->colList = array('actvdate', 'usr_name', 'count', 'complysla', 'within50', 'within100', 'morethan100');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('count', 'pmf_end_by', 'actvdate', 'usr_name', 'complysla', 'within50', 'within100', 'morethan100');
$dbo->colNew = array('count', 'pmf_end_by', 'actvdate', 'usr_name', 'complysla', 'within50', 'within100', 'morethan100');
$dbo->colEdit = array('count', 'pmf_end_by', 'actvdate', 'usr_name', 'complysla', 'within50', 'within100', 'morethan100');
$dbo->colSearch = array('actvdate', 'usr_name');
$dbo->colExport = array('count', 'pmf_end_by', 'actvdate', 'usr_name', 'complysla', 'within50', 'within100', 'morethan100');
$dbo->colSort = array();
$dbo->colSum = array();
$dbo->colSumPage = array();
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
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'qstr', 'check_ip_online', 'implode_multi', 'array_column', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_5418feb308eb64_01401584', 'sladrilldown', 'dbo_rpt_performance_customize');
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

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
$dbo->cols['pmf_end_by'] = new DBO_COL('pmf_end_by', 'varchar', '-1', '104');
$dbo->cols['pmf_end_by']->inputTypeDefault = 'text';
$dbo->cols['pmf_end_by']->searchMode = 'exact';
$dbo->cols['pmf_end_by']->capContClassDefault = array();
$dbo->cols['pmf_end_by']->valContClassDefault = array();
$dbo->cols['pmf_end_by']->option->defaultMethod = 'text';
$dbo->cols['pmf_end_by']->option->searchMethod = 'text';
$dbo->cols['pmf_end_by']->option->listMethod = 'text';
$dbo->cols['pmf_end_by']->option->detailMethod = 'text';
$dbo->cols['pmf_end_by']->option->newMethod = 'text';
$dbo->cols['pmf_end_by']->option->editMethod = 'text';
$dbo->cols['actvdate'] = new DBO_COL('actvdate', 'date', '4', '-1');
$dbo->cols['actvdate']->inputTypeDefault = 'BootstrapDateRange';
$dbo->cols['actvdate']->searchMode = 'exact';
$dbo->cols['actvdate']->capContClassDefault = array();
$dbo->cols['actvdate']->valContClassDefault = array();
$dbo->cols['actvdate']->option->defaultMethod = 'text';
$dbo->cols['actvdate']->option->searchMethod = 'text';
$dbo->cols['actvdate']->option->listMethod = 'text';
$dbo->cols['actvdate']->option->detailMethod = 'text';
$dbo->cols['actvdate']->option->newMethod = 'text';
$dbo->cols['actvdate']->option->editMethod = 'text';
$dbo->cols['usr_name'] = new DBO_COL('usr_name', 'varchar', '-1', '104');
$dbo->cols['usr_name']->inputTypeDefault = 'text';
$dbo->cols['usr_name']->searchMode = 'matchany';
$dbo->cols['usr_name']->capContClassDefault = array();
$dbo->cols['usr_name']->valContClassDefault = array();
$dbo->cols['usr_name']->option->defaultMethod = 'text';
$dbo->cols['usr_name']->option->searchMethod = 'text';
$dbo->cols['usr_name']->option->listMethod = 'text';
$dbo->cols['usr_name']->option->detailMethod = 'text';
$dbo->cols['usr_name']->option->newMethod = 'text';
$dbo->cols['usr_name']->option->editMethod = 'text';
$dbo->cols['complysla'] = new DBO_COL('complysla', 'int8', '8', '-1');
$dbo->cols['complysla']->displayListModifierMethod = 'phpfunc';
$dbo->cols['complysla']->displayListModifier = 'sladrilldown';
$dbo->cols['complysla']->inputTypeDefault = 'text';
$dbo->cols['complysla']->searchMode = 'exact';
$dbo->cols['complysla']->capContClassDefault = array();
$dbo->cols['complysla']->valContClassDefault = array();
$dbo->cols['complysla']->option->defaultMethod = 'text';
$dbo->cols['complysla']->option->searchMethod = 'text';
$dbo->cols['complysla']->option->listMethod = 'text';
$dbo->cols['complysla']->option->detailMethod = 'text';
$dbo->cols['complysla']->option->newMethod = 'text';
$dbo->cols['complysla']->option->editMethod = 'text';
$dbo->cols['within50'] = new DBO_COL('within50', 'int8', '8', '-1');
$dbo->cols['within50']->displayListModifierMethod = 'phpfunc';
$dbo->cols['within50']->displayListModifier = 'sladrilldown';
$dbo->cols['within50']->inputTypeDefault = 'text';
$dbo->cols['within50']->searchMode = 'exact';
$dbo->cols['within50']->capContClassDefault = array();
$dbo->cols['within50']->valContClassDefault = array();
$dbo->cols['within50']->option->defaultMethod = 'text';
$dbo->cols['within50']->option->searchMethod = 'text';
$dbo->cols['within50']->option->listMethod = 'text';
$dbo->cols['within50']->option->detailMethod = 'text';
$dbo->cols['within50']->option->newMethod = 'text';
$dbo->cols['within50']->option->editMethod = 'text';
$dbo->cols['within100'] = new DBO_COL('within100', 'int8', '8', '-1');
$dbo->cols['within100']->displayListModifierMethod = 'phpfunc';
$dbo->cols['within100']->displayListModifier = 'sladrilldown';
$dbo->cols['within100']->inputTypeDefault = 'text';
$dbo->cols['within100']->searchMode = 'exact';
$dbo->cols['within100']->capContClassDefault = array();
$dbo->cols['within100']->valContClassDefault = array();
$dbo->cols['within100']->option->defaultMethod = 'text';
$dbo->cols['within100']->option->searchMethod = 'text';
$dbo->cols['within100']->option->listMethod = 'text';
$dbo->cols['within100']->option->detailMethod = 'text';
$dbo->cols['within100']->option->newMethod = 'text';
$dbo->cols['within100']->option->editMethod = 'text';
$dbo->cols['morethan100'] = new DBO_COL('morethan100', 'int8', '8', '-1');
$dbo->cols['morethan100']->displayListModifierMethod = 'phpfunc';
$dbo->cols['morethan100']->displayListModifier = 'sladrilldown';
$dbo->cols['morethan100']->inputTypeDefault = 'text';
$dbo->cols['morethan100']->searchMode = 'exact';
$dbo->cols['morethan100']->capContClassDefault = array();
$dbo->cols['morethan100']->valContClassDefault = array();
$dbo->cols['morethan100']->option->defaultMethod = 'text';
$dbo->cols['morethan100']->option->searchMethod = 'text';
$dbo->cols['morethan100']->option->listMethod = 'text';
$dbo->cols['morethan100']->option->detailMethod = 'text';
$dbo->cols['morethan100']->option->newMethod = 'text';
$dbo->cols['morethan100']->option->editMethod = 'text';

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
class DBO_custom_rpt_performance extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_rpt_performance_custom_new';
function dbo_rpt_performance_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_rpt_performance_custom_edit';
function dbo_rpt_performance_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_rpt_performance_custom_search';
function dbo_rpt_performance_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_rpt_performance_custom_delete';
function dbo_rpt_performance_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_rpt_performance_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>