<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'cartontypesetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mcarton';
$dbo->key = array('car_id');
$dbo->sql = 'select * from mcarton
order by car_seq';
$dbo->col = array('car_id', 'car_name', 'car_status', 'car_seq');
$dbo->colList = array('car_id', 'car_name', 'car_status');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('car_id', 'car_name', 'car_status');
$dbo->colNew = array('car_name', 'car_status', 'car_seq');
$dbo->colEdit = array('car_name', 'car_status', 'car_seq');
$dbo->colSearch = array('car_name');
$dbo->colExport = array('car_id', 'car_name', 'car_status');
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
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'qstr', 'check_ip_online', 'implode_multi', 'array_column', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_54041d8f3bae13_93533903', 'dbo_cartontypesetup_customize');
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['car_id'] = new DBO_COL('car_id', 'int4', '4', '-1');
$dbo->cols['car_id']->inputTypeDefault = 'text';
$dbo->cols['car_id']->searchMode = 'exact';
$dbo->cols['car_id']->capContClassDefault = array();
$dbo->cols['car_id']->valContClassDefault = array();
$dbo->cols['car_id']->option->defaultMethod = 'text';
$dbo->cols['car_id']->option->searchMethod = 'text';
$dbo->cols['car_id']->option->listMethod = 'text';
$dbo->cols['car_id']->option->detailMethod = 'text';
$dbo->cols['car_id']->option->newMethod = 'text';
$dbo->cols['car_id']->option->editMethod = 'text';
$dbo->cols['car_name'] = new DBO_COL('car_name', 'varchar', '-1', '204');
$dbo->cols['car_name']->inputTypeDefault = 'text';
$dbo->cols['car_name']->mandatoryDefault = '1';
$dbo->cols['car_name']->searchMode = 'exact';
$dbo->cols['car_name']->capContClassDefault = array();
$dbo->cols['car_name']->valContClassDefault = array();
$dbo->cols['car_name']->option->defaultMethod = 'text';
$dbo->cols['car_name']->option->searchMethod = 'text';
$dbo->cols['car_name']->option->listMethod = 'text';
$dbo->cols['car_name']->option->detailMethod = 'text';
$dbo->cols['car_name']->option->newMethod = 'text';
$dbo->cols['car_name']->option->editMethod = 'text';
$dbo->cols['car_status'] = new DBO_COL('car_status', 'varchar', '-1', '36');
$dbo->cols['car_status']->defaultNewValue = 'ACTIVE';
$dbo->cols['car_status']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['car_status']->mandatoryDefault = '1';
$dbo->cols['car_status']->searchMode = 'exact';
$dbo->cols['car_status']->capContClassDefault = array();
$dbo->cols['car_status']->valContClassDefault = array();
$dbo->cols['car_status']->option->default = 'ACTIVE/Active
INACTIVE/Inactive';
$dbo->cols['car_status']->option->defaultMethod = 'text';
$dbo->cols['car_status']->option->searchMethod = 'text';
$dbo->cols['car_status']->option->listMethod = 'text';
$dbo->cols['car_status']->option->detailMethod = 'text';
$dbo->cols['car_status']->option->newMethod = 'text';
$dbo->cols['car_status']->option->editMethod = 'text';
$dbo->cols['car_seq'] = new DBO_COL('car_seq', 'int4', '4', '-1');
$dbo->cols['car_seq']->inputTypeDefault = 'text';
$dbo->cols['car_seq']->searchMode = 'exact';
$dbo->cols['car_seq']->capContClassDefault = array();
$dbo->cols['car_seq']->valContClassDefault = array();
$dbo->cols['car_seq']->option->defaultMethod = 'text';
$dbo->cols['car_seq']->option->searchMethod = 'text';
$dbo->cols['car_seq']->option->listMethod = 'text';
$dbo->cols['car_seq']->option->detailMethod = 'text';
$dbo->cols['car_seq']->option->newMethod = 'text';
$dbo->cols['car_seq']->option->editMethod = 'text';

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
class DBO_custom_cartontypesetup extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_cartontypesetup_custom_new';
function dbo_cartontypesetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_cartontypesetup_custom_edit';
function dbo_cartontypesetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_cartontypesetup_custom_search';
function dbo_cartontypesetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_cartontypesetup_custom_delete';
function dbo_cartontypesetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_cartontypesetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>