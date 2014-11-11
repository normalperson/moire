<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'joboutputsetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjoboutputlookup';
$dbo->key = array('jol_id');
$dbo->sql = 'select * from mjoboutputlookup order by jol_seq';
$dbo->col = array('jol_id', 'jol_title', 'jol_requiredtime', 'jol_status', 'jol_price_color_1', 'jol_price_color_2', 'jol_price_color_3', 'jol_price_color_4', 'jol_pricingtype', 'jol_price', 'jol_seq');
$dbo->colList = array('jol_title', 'jol_requiredtime', 'jol_status', 'jol_seq');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('jol_id', 'jol_title', 'jol_requiredtime', 'jol_status');
$dbo->colNew = array('jol_title', 'jol_requiredtime', 'jol_status', 'jol_pricingtype', 'jol_price', 'jol_seq');
$dbo->colEdit = array('jol_title', 'jol_requiredtime', 'jol_status', 'jol_pricingtype', 'jol_price', 'jol_seq');
$dbo->colSearch = array('jol_id', 'jol_title', 'jol_requiredtime', 'jol_status');
$dbo->colExport = array('jol_id', 'jol_title', 'jol_requiredtime', 'jol_status');
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
$dbo->titleList = 'List Job Output';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Job Output';
$dbo->titleEdit = 'Edit Job Output';
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
$dbo->editSubmit = 'Save';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'qstr', 'check_ip_online', 'implode_multi', 'array_column', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_54041d8f3bae13_93533903', 'dbo_joboutputsetup_customize');

$dbo->cols['jol_id'] = new DBO_COL('jol_id', 'int4', '4', '-1');
$dbo->cols['jol_id']->inputTypeDefault = 'text';
$dbo->cols['jol_id']->searchMode = 'exact';
$dbo->cols['jol_id']->capContClassDefault = array();
$dbo->cols['jol_id']->valContClassDefault = array();
$dbo->cols['jol_id']->option->defaultMethod = 'text';
$dbo->cols['jol_id']->option->searchMethod = 'text';
$dbo->cols['jol_id']->option->listMethod = 'text';
$dbo->cols['jol_id']->option->detailMethod = 'text';
$dbo->cols['jol_id']->option->newMethod = 'text';
$dbo->cols['jol_id']->option->editMethod = 'text';
$dbo->cols['jol_title'] = new DBO_COL('jol_title', 'varchar', '-1', '204');
$dbo->cols['jol_title']->inputTypeDefault = 'text';
$dbo->cols['jol_title']->mandatoryNew = '1';
$dbo->cols['jol_title']->mandatoryEdit = '1';
$dbo->cols['jol_title']->searchMode = 'exact';
$dbo->cols['jol_title']->capContClassDefault = array();
$dbo->cols['jol_title']->valContClassDefault = array();
$dbo->cols['jol_title']->option->defaultMethod = 'text';
$dbo->cols['jol_title']->option->searchMethod = 'text';
$dbo->cols['jol_title']->option->listMethod = 'text';
$dbo->cols['jol_title']->option->detailMethod = 'text';
$dbo->cols['jol_title']->option->newMethod = 'text';
$dbo->cols['jol_title']->option->editMethod = 'text';
$dbo->cols['jol_requiredtime'] = new DBO_COL('jol_requiredtime', 'int4', '4', '-1');
$dbo->cols['jol_requiredtime']->inputTypeDefault = 'text';
$dbo->cols['jol_requiredtime']->mandatoryNew = '1';
$dbo->cols['jol_requiredtime']->mandatoryEdit = '1';
$dbo->cols['jol_requiredtime']->searchMode = 'exact';
$dbo->cols['jol_requiredtime']->capContClassDefault = array();
$dbo->cols['jol_requiredtime']->valContClassDefault = array();
$dbo->cols['jol_requiredtime']->option->defaultMethod = 'text';
$dbo->cols['jol_requiredtime']->option->searchMethod = 'text';
$dbo->cols['jol_requiredtime']->option->listMethod = 'text';
$dbo->cols['jol_requiredtime']->option->detailMethod = 'text';
$dbo->cols['jol_requiredtime']->option->newMethod = 'text';
$dbo->cols['jol_requiredtime']->option->editMethod = 'text';
$dbo->cols['jol_status'] = new DBO_COL('jol_status', 'varchar', '-1', '36');
$dbo->cols['jol_status']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['jol_status']->mandatoryNew = '1';
$dbo->cols['jol_status']->mandatoryEdit = '1';
$dbo->cols['jol_status']->searchMode = 'exact';
$dbo->cols['jol_status']->capContClassDefault = array();
$dbo->cols['jol_status']->valContClassDefault = array();
$dbo->cols['jol_status']->option->default = 'ACTIVE/Active
INACTIVE/Inactive';
$dbo->cols['jol_status']->option->defaultMethod = 'text';
$dbo->cols['jol_status']->option->searchMethod = 'text';
$dbo->cols['jol_status']->option->listMethod = 'text';
$dbo->cols['jol_status']->option->detailMethod = 'text';
$dbo->cols['jol_status']->option->newMethod = 'text';
$dbo->cols['jol_status']->option->editMethod = 'text';
$dbo->cols['jol_price_color_1'] = new DBO_COL('jol_price_color_1', 'numeric', '-1', '1310728');
$dbo->cols['jol_price_color_1']->inputTypeDefault = 'text';
$dbo->cols['jol_price_color_1']->mandatoryNew = '1';
$dbo->cols['jol_price_color_1']->mandatoryEdit = '1';
$dbo->cols['jol_price_color_1']->searchMode = 'exact';
$dbo->cols['jol_price_color_1']->capContClassDefault = array();
$dbo->cols['jol_price_color_1']->valContClassDefault = array();
$dbo->cols['jol_price_color_1']->option->defaultMethod = 'text';
$dbo->cols['jol_price_color_1']->option->searchMethod = 'text';
$dbo->cols['jol_price_color_1']->option->listMethod = 'text';
$dbo->cols['jol_price_color_1']->option->detailMethod = 'text';
$dbo->cols['jol_price_color_1']->option->newMethod = 'text';
$dbo->cols['jol_price_color_1']->option->editMethod = 'text';
$dbo->cols['jol_price_color_2'] = new DBO_COL('jol_price_color_2', 'numeric', '-1', '1310728');
$dbo->cols['jol_price_color_2']->inputTypeDefault = 'text';
$dbo->cols['jol_price_color_2']->mandatoryNew = '1';
$dbo->cols['jol_price_color_2']->mandatoryEdit = '1';
$dbo->cols['jol_price_color_2']->searchMode = 'exact';
$dbo->cols['jol_price_color_2']->capContClassDefault = array();
$dbo->cols['jol_price_color_2']->valContClassDefault = array();
$dbo->cols['jol_price_color_2']->option->defaultMethod = 'text';
$dbo->cols['jol_price_color_2']->option->searchMethod = 'text';
$dbo->cols['jol_price_color_2']->option->listMethod = 'text';
$dbo->cols['jol_price_color_2']->option->detailMethod = 'text';
$dbo->cols['jol_price_color_2']->option->newMethod = 'text';
$dbo->cols['jol_price_color_2']->option->editMethod = 'text';
$dbo->cols['jol_price_color_3'] = new DBO_COL('jol_price_color_3', 'numeric', '-1', '1310728');
$dbo->cols['jol_price_color_3']->inputTypeDefault = 'text';
$dbo->cols['jol_price_color_3']->mandatoryNew = '1';
$dbo->cols['jol_price_color_3']->mandatoryEdit = '1';
$dbo->cols['jol_price_color_3']->searchMode = 'exact';
$dbo->cols['jol_price_color_3']->capContClassDefault = array();
$dbo->cols['jol_price_color_3']->valContClassDefault = array();
$dbo->cols['jol_price_color_3']->option->defaultMethod = 'text';
$dbo->cols['jol_price_color_3']->option->searchMethod = 'text';
$dbo->cols['jol_price_color_3']->option->listMethod = 'text';
$dbo->cols['jol_price_color_3']->option->detailMethod = 'text';
$dbo->cols['jol_price_color_3']->option->newMethod = 'text';
$dbo->cols['jol_price_color_3']->option->editMethod = 'text';
$dbo->cols['jol_price_color_4'] = new DBO_COL('jol_price_color_4', 'numeric', '-1', '1310728');
$dbo->cols['jol_price_color_4']->inputTypeDefault = 'text';
$dbo->cols['jol_price_color_4']->mandatoryNew = '1';
$dbo->cols['jol_price_color_4']->mandatoryEdit = '1';
$dbo->cols['jol_price_color_4']->searchMode = 'exact';
$dbo->cols['jol_price_color_4']->capContClassDefault = array();
$dbo->cols['jol_price_color_4']->valContClassDefault = array();
$dbo->cols['jol_price_color_4']->option->defaultMethod = 'text';
$dbo->cols['jol_price_color_4']->option->searchMethod = 'text';
$dbo->cols['jol_price_color_4']->option->listMethod = 'text';
$dbo->cols['jol_price_color_4']->option->detailMethod = 'text';
$dbo->cols['jol_price_color_4']->option->newMethod = 'text';
$dbo->cols['jol_price_color_4']->option->editMethod = 'text';
$dbo->cols['jol_pricingtype'] = new DBO_COL('jol_pricingtype', 'varchar', '-1', '16');
$dbo->cols['jol_pricingtype']->inputTypeDefault = 'radio';
$dbo->cols['jol_pricingtype']->mandatoryNew = '1';
$dbo->cols['jol_pricingtype']->mandatoryEdit = '1';
$dbo->cols['jol_pricingtype']->searchMode = 'exact';
$dbo->cols['jol_pricingtype']->capContClassDefault = array();
$dbo->cols['jol_pricingtype']->valContClassDefault = array();
$dbo->cols['jol_pricingtype']->option->default = 'FIXED
UNIT';
$dbo->cols['jol_pricingtype']->option->defaultMethod = 'text';
$dbo->cols['jol_pricingtype']->option->searchMethod = 'text';
$dbo->cols['jol_pricingtype']->option->listMethod = 'text';
$dbo->cols['jol_pricingtype']->option->detailMethod = 'text';
$dbo->cols['jol_pricingtype']->option->newMethod = 'text';
$dbo->cols['jol_pricingtype']->option->editMethod = 'text';
$dbo->cols['jol_price'] = new DBO_COL('jol_price', 'numeric', '-1', '1310728');
$dbo->cols['jol_price']->inputTypeDefault = 'text';
$dbo->cols['jol_price']->mandatoryNew = '1';
$dbo->cols['jol_price']->mandatoryEdit = '1';
$dbo->cols['jol_price']->searchMode = 'exact';
$dbo->cols['jol_price']->capContClassDefault = array();
$dbo->cols['jol_price']->valContClassDefault = array();
$dbo->cols['jol_price']->option->defaultMethod = 'text';
$dbo->cols['jol_price']->option->searchMethod = 'text';
$dbo->cols['jol_price']->option->listMethod = 'text';
$dbo->cols['jol_price']->option->detailMethod = 'text';
$dbo->cols['jol_price']->option->newMethod = 'text';
$dbo->cols['jol_price']->option->editMethod = 'text';
$dbo->cols['jol_seq'] = new DBO_COL('jol_seq', 'int4', '4', '-1');
$dbo->cols['jol_seq']->inputTypeDefault = 'text';
$dbo->cols['jol_seq']->mandatoryNew = '1';
$dbo->cols['jol_seq']->mandatoryEdit = '1';
$dbo->cols['jol_seq']->searchMode = 'exact';
$dbo->cols['jol_seq']->capContClassDefault = array();
$dbo->cols['jol_seq']->valContClassDefault = array();
$dbo->cols['jol_seq']->option->defaultMethod = 'text';
$dbo->cols['jol_seq']->option->searchMethod = 'text';
$dbo->cols['jol_seq']->option->listMethod = 'text';
$dbo->cols['jol_seq']->option->detailMethod = 'text';
$dbo->cols['jol_seq']->option->newMethod = 'text';
$dbo->cols['jol_seq']->option->editMethod = 'text';

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
class DBO_custom_joboutputsetup extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_joboutputsetup_custom_new';
function dbo_joboutputsetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_joboutputsetup_custom_edit';
function dbo_joboutputsetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_joboutputsetup_custom_search';
function dbo_joboutputsetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_joboutputsetup_custom_delete';
function dbo_joboutputsetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_joboutputsetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>