<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'soaorg';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcorg';
$dbo->key = array('org_id');
$dbo->sql = 'select org_id, org_name, minvoicemonth.*, coalesce(to_char(im_invoicedate, \'YYYY Mon\'), \'No Invoice *\') as invoicedate, \'\' as button from fcorg left join minvoicemonth on org_id = im_orgid where org_external = \'Y\'';
$dbo->col = array('org_id', 'org_name', 'im_id', 'im_invoicedate', 'im_created', 'im_orgid', 'invoicedate', 'button');
$dbo->colList = array('org_name', 'button');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('org_name');
$dbo->colNew = array('org_id', 'org_name');
$dbo->colEdit = array('org_id', 'org_name');
$dbo->colSearch = array('org_name', 'invoicedate');
$dbo->colExport = array('org_id', 'org_name');
$dbo->colSort = array();
$dbo->colSum = array();
$dbo->colSumPage = array();
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array('invoicedate');
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
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->detailBack = 'Back';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'qstr', 'check_ip_online', 'implode_multi', 'array_column', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_54041d8f3bae13_93533903', 'dbo_soaorg_customize', 'statementbutton');

$dbo->cols['org_id'] = new DBO_COL('org_id', 'int4', '4', '-1');
$dbo->cols['org_id']->inputTypeDefault = 'text';
$dbo->cols['org_id']->searchMode = 'exact';
$dbo->cols['org_id']->capContClassDefault = array();
$dbo->cols['org_id']->valContClassDefault = array();
$dbo->cols['org_id']->option->defaultMethod = 'text';
$dbo->cols['org_id']->option->searchMethod = 'text';
$dbo->cols['org_id']->option->listMethod = 'text';
$dbo->cols['org_id']->option->detailMethod = 'text';
$dbo->cols['org_id']->option->newMethod = 'text';
$dbo->cols['org_id']->option->editMethod = 'text';
$dbo->cols['org_name'] = new DBO_COL('org_name', 'varchar', '-1', '2004');
$dbo->cols['org_name']->inputTypeDefault = 'text';
$dbo->cols['org_name']->searchMode = 'matchfront';
$dbo->cols['org_name']->capContClassDefault = array();
$dbo->cols['org_name']->valContClassDefault = array();
$dbo->cols['org_name']->option->defaultMethod = 'text';
$dbo->cols['org_name']->option->searchMethod = 'text';
$dbo->cols['org_name']->option->listMethod = 'text';
$dbo->cols['org_name']->option->detailMethod = 'text';
$dbo->cols['org_name']->option->newMethod = 'text';
$dbo->cols['org_name']->option->editMethod = 'text';
$dbo->cols['button'] = new DBO_COL('button', 'unknown', '-2', '-1');
$dbo->cols['button']->displayListModifierMethod = 'phpscr';
$dbo->cols['button']->displayListModifier = 'statementButton({org_id}, {im_id})';
$dbo->cols['button']->inputTypeDefault = 'text';
$dbo->cols['button']->searchMode = 'exact';
$dbo->cols['button']->capContClassDefault = array();
$dbo->cols['button']->valContClassDefault = array();
$dbo->cols['button']->option->defaultMethod = 'text';
$dbo->cols['button']->option->searchMethod = 'text';
$dbo->cols['button']->option->listMethod = 'text';
$dbo->cols['button']->option->detailMethod = 'text';
$dbo->cols['button']->option->newMethod = 'text';
$dbo->cols['button']->option->editMethod = 'text';
$dbo->cols['im_id'] = new DBO_COL('im_id', 'int4', '4', '-1');
$dbo->cols['im_id']->inputTypeDefault = 'text';
$dbo->cols['im_id']->searchMode = 'exact';
$dbo->cols['im_id']->capContClassDefault = array();
$dbo->cols['im_id']->valContClassDefault = array();
$dbo->cols['im_id']->option->defaultMethod = 'text';
$dbo->cols['im_id']->option->searchMethod = 'text';
$dbo->cols['im_id']->option->listMethod = 'text';
$dbo->cols['im_id']->option->detailMethod = 'text';
$dbo->cols['im_id']->option->newMethod = 'text';
$dbo->cols['im_id']->option->editMethod = 'text';
$dbo->cols['im_invoicedate'] = new DBO_COL('im_invoicedate', 'timestamptz', '8', '-1');
$dbo->cols['im_invoicedate']->inputTypeDefault = 'text';
$dbo->cols['im_invoicedate']->searchMode = 'exact';
$dbo->cols['im_invoicedate']->capContClassDefault = array();
$dbo->cols['im_invoicedate']->valContClassDefault = array();
$dbo->cols['im_invoicedate']->option->defaultMethod = 'text';
$dbo->cols['im_invoicedate']->option->searchMethod = 'text';
$dbo->cols['im_invoicedate']->option->listMethod = 'text';
$dbo->cols['im_invoicedate']->option->detailMethod = 'text';
$dbo->cols['im_invoicedate']->option->newMethod = 'text';
$dbo->cols['im_invoicedate']->option->editMethod = 'text';
$dbo->cols['im_created'] = new DBO_COL('im_created', 'timestamptz', '8', '-1');
$dbo->cols['im_created']->inputTypeDefault = 'text';
$dbo->cols['im_created']->searchMode = 'exact';
$dbo->cols['im_created']->capContClassDefault = array();
$dbo->cols['im_created']->valContClassDefault = array();
$dbo->cols['im_created']->option->defaultMethod = 'text';
$dbo->cols['im_created']->option->searchMethod = 'text';
$dbo->cols['im_created']->option->listMethod = 'text';
$dbo->cols['im_created']->option->detailMethod = 'text';
$dbo->cols['im_created']->option->newMethod = 'text';
$dbo->cols['im_created']->option->editMethod = 'text';
$dbo->cols['im_orgid'] = new DBO_COL('im_orgid', 'int4', '4', '-1');
$dbo->cols['im_orgid']->inputTypeDefault = 'text';
$dbo->cols['im_orgid']->searchMode = 'exact';
$dbo->cols['im_orgid']->capContClassDefault = array();
$dbo->cols['im_orgid']->valContClassDefault = array();
$dbo->cols['im_orgid']->option->defaultMethod = 'text';
$dbo->cols['im_orgid']->option->searchMethod = 'text';
$dbo->cols['im_orgid']->option->listMethod = 'text';
$dbo->cols['im_orgid']->option->detailMethod = 'text';
$dbo->cols['im_orgid']->option->newMethod = 'text';
$dbo->cols['im_orgid']->option->editMethod = 'text';
$dbo->cols['invoicedate'] = new DBO_COL('invoicedate', 'text', '-1', '-1');
$dbo->cols['invoicedate']->inputTypeDefault = 'select';
$dbo->cols['invoicedate']->searchMode = 'exact';
$dbo->cols['invoicedate']->capContClassDefault = array();
$dbo->cols['invoicedate']->valContClassDefault = array();
$dbo->cols['invoicedate']->option->default = 'select distinct coalesce(to_char(im_invoicedate, \'YYYY Mon\'), \'No Invoice *\') as invoicedate, to_char(im_invoicedate, \'YYYY Mon\') from minvoicemonth order by 2 desc;';
$dbo->cols['invoicedate']->option->defaultMethod = 'sql';
$dbo->cols['invoicedate']->option->searchMethod = 'text';
$dbo->cols['invoicedate']->option->listMethod = 'text';
$dbo->cols['invoicedate']->option->detailMethod = 'text';
$dbo->cols['invoicedate']->option->newMethod = 'text';
$dbo->cols['invoicedate']->option->editMethod = 'text';

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
class DBO_custom_soaorg extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_soaorg_custom_new';
function dbo_soaorg_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_soaorg_custom_edit';
function dbo_soaorg_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_soaorg_custom_search';
function dbo_soaorg_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_soaorg_custom_delete';
function dbo_soaorg_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_soaorg_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>