<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'rpt_dailysalesummary_2';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjobsheet';
$dbo->key = array();
$dbo->sql = 'select trimdatetime(js_completiondate) as completiondate,js_orgid, org_name, rg_code,
js_currency,
count(*) as totaljob,sum(js_finalprice) as totalprice,sum(js_totalinch) as inch ,
sum( myrtousd(js_finalprice,js_rate,js_currency) ) as amtinUSD,
sum( usdtomyr(js_finalprice,js_rate,js_currency) ) as amtinMYR
from mjobsheet 
join fcorg on js_orgid = org_id
join mregion on org_region = rg_code
where js_status = \'COMPLETED\'
and org_external = \'Y\'
group by rg_code,trimdatetime(js_completiondate),js_currency,js_orgid, org_name 
order by trimdatetime(js_completiondate)';
$dbo->col = array('completiondate', 'js_orgid', 'org_name', 'rg_code', 'js_currency', 'totaljob', 'totalprice', 'inch', 'amtinusd', 'amtinmyr');
$dbo->colList = array('completiondate', 'js_orgid', 'rg_code', 'js_currency', 'totaljob', 'totalprice', 'inch', 'amtinmyr', 'amtinusd');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('js_orgid', 'rg_code', 'js_currency', 'totaljob', 'totalprice', 'inch', 'amtinusd', 'amtinmyr');
$dbo->colNew = array('js_orgid', 'rg_code', 'js_currency', 'totaljob', 'totalprice', 'inch', 'amtinusd', 'amtinmyr');
$dbo->colEdit = array('js_orgid', 'rg_code', 'js_currency', 'totaljob', 'totalprice', 'inch', 'amtinusd', 'amtinmyr');
$dbo->colSearch = array('completiondate', 'js_orgid', 'rg_code');
$dbo->colExport = array('completiondate', 'js_orgid', 'rg_code', 'js_currency', 'totaljob', 'totalprice', 'inch', 'amtinmyr', 'amtinusd');
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
$dbo->exportFormat = array('excel');
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = '5';
$dbo->recordPerPage = '50';
$dbo->showRecordNo = '1';
$dbo->defaultState = 'search';
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
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'qstr', 'check_ip_online', 'implode_multi', 'array_column', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_54041d8f3bae13_93533903', 'customerlink', 'dbo_rpt_dailysalesummary_2_customize');

$dbo->cols['trimdatetime'] = new DBO_COL('trimdatetime', 'date', '4', '-1');
$dbo->cols['trimdatetime']->inputTypeDefault = 'text';
$dbo->cols['trimdatetime']->searchMode = 'exact';
$dbo->cols['trimdatetime']->capContClassDefault = array();
$dbo->cols['trimdatetime']->valContClassDefault = array();
$dbo->cols['trimdatetime']->option->defaultMethod = 'text';
$dbo->cols['trimdatetime']->option->searchMethod = 'text';
$dbo->cols['trimdatetime']->option->listMethod = 'text';
$dbo->cols['trimdatetime']->option->detailMethod = 'text';
$dbo->cols['trimdatetime']->option->newMethod = 'text';
$dbo->cols['trimdatetime']->option->editMethod = 'text';
$dbo->cols['js_orgid'] = new DBO_COL('js_orgid', 'int4', '4', '-1');
$dbo->cols['js_orgid']->displayListModifierMethod = 'text';
$dbo->cols['js_orgid']->displayListModifier = '<a href="salecalldetail?customer={js_orgid}&completiondate={completiondate}" >{org_name}</a>';
$dbo->cols['js_orgid']->inputTypeDefault = 'select';
$dbo->cols['js_orgid']->searchMode = 'exact';
$dbo->cols['js_orgid']->capContClassDefault = array();
$dbo->cols['js_orgid']->valContClassDefault = array();
$dbo->cols['js_orgid']->option->default = 'select org_id,org_name from fcorg
order by org_name';
$dbo->cols['js_orgid']->option->defaultMethod = 'sql';
$dbo->cols['js_orgid']->option->searchMethod = 'text';
$dbo->cols['js_orgid']->option->listMethod = 'text';
$dbo->cols['js_orgid']->option->detailMethod = 'text';
$dbo->cols['js_orgid']->option->newMethod = 'text';
$dbo->cols['js_orgid']->option->editMethod = 'text';
$dbo->cols['rg_code'] = new DBO_COL('rg_code', 'varchar', '-1', '54');
$dbo->cols['rg_code']->inputTypeDefault = 'select';
$dbo->cols['rg_code']->searchMode = 'exact';
$dbo->cols['rg_code']->capContClassDefault = array();
$dbo->cols['rg_code']->valContClassDefault = array();
$dbo->cols['rg_code']->option->default = 'select rg_code,rg_code from mregion
order by rg_code';
$dbo->cols['rg_code']->option->defaultMethod = 'sql';
$dbo->cols['rg_code']->option->searchMethod = 'text';
$dbo->cols['rg_code']->option->listMethod = 'text';
$dbo->cols['rg_code']->option->detailMethod = 'text';
$dbo->cols['rg_code']->option->newMethod = 'text';
$dbo->cols['rg_code']->option->editMethod = 'text';
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
$dbo->cols['totaljob'] = new DBO_COL('totaljob', 'int8', '8', '-1');
$dbo->cols['totaljob']->displayDataType = 'int';
$dbo->cols['totaljob']->inputTypeDefault = 'text';
$dbo->cols['totaljob']->searchMode = 'exact';
$dbo->cols['totaljob']->capContClassDefault = array();
$dbo->cols['totaljob']->valContClassDefault = array();
$dbo->cols['totaljob']->option->defaultMethod = 'text';
$dbo->cols['totaljob']->option->searchMethod = 'text';
$dbo->cols['totaljob']->option->listMethod = 'text';
$dbo->cols['totaljob']->option->detailMethod = 'text';
$dbo->cols['totaljob']->option->newMethod = 'text';
$dbo->cols['totaljob']->option->editMethod = 'text';
$dbo->cols['totalprice'] = new DBO_COL('totalprice', 'numeric', '-1', '-1');
$dbo->cols['totalprice']->displayDataType = 'currency';
$dbo->cols['totalprice']->inputTypeDefault = 'text';
$dbo->cols['totalprice']->searchMode = 'exact';
$dbo->cols['totalprice']->capContClassDefault = array();
$dbo->cols['totalprice']->valContClassDefault = array();
$dbo->cols['totalprice']->option->defaultMethod = 'text';
$dbo->cols['totalprice']->option->searchMethod = 'text';
$dbo->cols['totalprice']->option->listMethod = 'text';
$dbo->cols['totalprice']->option->detailMethod = 'text';
$dbo->cols['totalprice']->option->newMethod = 'text';
$dbo->cols['totalprice']->option->editMethod = 'text';
$dbo->cols['inch'] = new DBO_COL('inch', 'numeric', '-1', '-1');
$dbo->cols['inch']->displayDataType = 'currency';
$dbo->cols['inch']->inputTypeDefault = 'text';
$dbo->cols['inch']->searchMode = 'exact';
$dbo->cols['inch']->capContClassDefault = array();
$dbo->cols['inch']->valContClassDefault = array();
$dbo->cols['inch']->option->defaultMethod = 'text';
$dbo->cols['inch']->option->searchMethod = 'text';
$dbo->cols['inch']->option->listMethod = 'text';
$dbo->cols['inch']->option->detailMethod = 'text';
$dbo->cols['inch']->option->newMethod = 'text';
$dbo->cols['inch']->option->editMethod = 'text';
$dbo->cols['amtinusd'] = new DBO_COL('amtinusd', 'numeric', '-1', '-1');
$dbo->cols['amtinusd']->displayDataType = 'currency';
$dbo->cols['amtinusd']->inputTypeDefault = 'text';
$dbo->cols['amtinusd']->searchMode = 'exact';
$dbo->cols['amtinusd']->capContClassDefault = array();
$dbo->cols['amtinusd']->valContClassDefault = array();
$dbo->cols['amtinusd']->option->defaultMethod = 'text';
$dbo->cols['amtinusd']->option->searchMethod = 'text';
$dbo->cols['amtinusd']->option->listMethod = 'text';
$dbo->cols['amtinusd']->option->detailMethod = 'text';
$dbo->cols['amtinusd']->option->newMethod = 'text';
$dbo->cols['amtinusd']->option->editMethod = 'text';
$dbo->cols['amtinmyr'] = new DBO_COL('amtinmyr', 'numeric', '-1', '-1');
$dbo->cols['amtinmyr']->displayDataType = 'currency';
$dbo->cols['amtinmyr']->inputTypeDefault = 'text';
$dbo->cols['amtinmyr']->searchMode = 'exact';
$dbo->cols['amtinmyr']->capContClassDefault = array();
$dbo->cols['amtinmyr']->valContClassDefault = array();
$dbo->cols['amtinmyr']->option->defaultMethod = 'text';
$dbo->cols['amtinmyr']->option->searchMethod = 'text';
$dbo->cols['amtinmyr']->option->listMethod = 'text';
$dbo->cols['amtinmyr']->option->detailMethod = 'text';
$dbo->cols['amtinmyr']->option->newMethod = 'text';
$dbo->cols['amtinmyr']->option->editMethod = 'text';
$dbo->cols['completiondate'] = new DBO_COL('completiondate', 'date', '4', '-1');
$dbo->cols['completiondate']->inputTypeDefault = 'BootstrapDateRange';
$dbo->cols['completiondate']->mandatorySearch = '1';
$dbo->cols['completiondate']->searchMode = 'exact';
$dbo->cols['completiondate']->capContClassDefault = array();
$dbo->cols['completiondate']->valContClassDefault = array();
$dbo->cols['completiondate']->option->defaultMethod = 'text';
$dbo->cols['completiondate']->option->searchMethod = 'text';
$dbo->cols['completiondate']->option->listMethod = 'text';
$dbo->cols['completiondate']->option->detailMethod = 'text';
$dbo->cols['completiondate']->option->newMethod = 'text';
$dbo->cols['completiondate']->option->editMethod = 'text';
$dbo->cols['org_name'] = new DBO_COL('org_name', 'varchar', '-1', '2004');
$dbo->cols['org_name']->inputTypeDefault = 'text';
$dbo->cols['org_name']->searchMode = 'exact';
$dbo->cols['org_name']->capContClassDefault = array();
$dbo->cols['org_name']->valContClassDefault = array();
$dbo->cols['org_name']->option->defaultMethod = 'text';
$dbo->cols['org_name']->option->searchMethod = 'text';
$dbo->cols['org_name']->option->listMethod = 'text';
$dbo->cols['org_name']->option->detailMethod = 'text';
$dbo->cols['org_name']->option->newMethod = 'text';
$dbo->cols['org_name']->option->editMethod = 'text';

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
class DBO_custom_rpt_dailysalesummary_2 extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_rpt_dailysalesummary_2_custom_new';
function dbo_rpt_dailysalesummary_2_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_rpt_dailysalesummary_2_custom_edit';
function dbo_rpt_dailysalesummary_2_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_rpt_dailysalesummary_2_custom_search';
function dbo_rpt_dailysalesummary_2_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_rpt_dailysalesummary_2_custom_delete';
function dbo_rpt_dailysalesummary_2_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_rpt_dailysalesummary_2_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>