<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'rpt_monthsalebycustomer';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjobsheet ';
$dbo->key = array();
$dbo->sql = 'select to_char(js_request_date, \'YYYYMM\') as dateinnum,to_char(js_request_date,\'MON-YYYY\') as js_request_dateinmth  ,org_name,count(*) totaljobrequested,org_id,
sum ( case when js_status != \'CANCELLED\' and js_status != \'COMPLETED\' then 1 else 0 end ) totalwip,
sum ( case when js_status = \'CANCELLED\' then 1 else 0 end ) totalcancelled,
sum ( case when js_status = \'COMPLETED\' then 1 else 0 end ) totalcompleted
from mjobsheet join fcorg on js_orgid = org_id and org_external = \'Y\'
group by to_char(js_request_date, \'YYYYMM\'),to_char(js_request_date,\'MON-YYYY\'),org_name,org_id
order by to_char(js_request_date, \'YYYYMM\')';
$dbo->col = array('dateinnum', 'js_request_dateinmth', 'org_name', 'totaljobrequested', 'org_id', 'totalwip', 'totalcancelled', 'totalcompleted');
$dbo->colList = array('org_name', 'totaljobrequested', 'totalwip', 'totalcancelled', 'totalcompleted');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array();
$dbo->colNew = array();
$dbo->colEdit = array();
$dbo->colSearch = array('js_request_dateinmth', 'org_name');
$dbo->colExport = array('js_request_dateinmth', 'org_name', 'totalcancelled', 'totalcompleted', 'totaljobrequested', 'totalwip');
$dbo->colSort = array();
$dbo->colSum = array('totalcancelled', 'totalcompleted', 'totaljobrequested', 'totalwip');
$dbo->colSumPage = array('totalcancelled', 'totalcompleted', 'totaljobrequested', 'totalwip');
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array('js_request_dateinmth');
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
$dbo->listEditToggle = false;
$dbo->showSearch = true;
$dbo->exportFormat = array('excel', 'pdf');
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
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['org_name'] = new DBO_COL('org_name', 'varchar', '-1', '2004');
$dbo->cols['org_name']->inputTypeDefault = 'text';
$dbo->cols['org_name']->exportUseLookup = true;
$dbo->cols['org_name']->searchMode = 'matchfront';
$dbo->cols['org_name']->capContClassDefault = array();
$dbo->cols['org_name']->valContClassDefault = array();
$dbo->cols['org_name']->option->defaultMethod = 'text';
$dbo->cols['org_name']->option->searchMethod = 'text';
$dbo->cols['org_name']->option->listMethod = 'text';
$dbo->cols['org_name']->option->detailMethod = 'text';
$dbo->cols['org_name']->option->newMethod = 'text';
$dbo->cols['org_name']->option->editMethod = 'text';
$dbo->cols['totaljobrequested'] = new DBO_COL('totaljobrequested', 'int8', '8', '-1');
$dbo->cols['totaljobrequested']->displayListModifierMethod = 'phpfunc';
$dbo->cols['totaljobrequested']->displayListModifier = 'jobsummarylink';
$dbo->cols['totaljobrequested']->inputTypeDefault = 'text';
$dbo->cols['totaljobrequested']->exportUseLookup = true;
$dbo->cols['totaljobrequested']->searchMode = 'exact';
$dbo->cols['totaljobrequested']->capContClassDefault = array();
$dbo->cols['totaljobrequested']->valContClassDefault = array();
$dbo->cols['totaljobrequested']->option->defaultMethod = 'text';
$dbo->cols['totaljobrequested']->option->searchMethod = 'text';
$dbo->cols['totaljobrequested']->option->listMethod = 'text';
$dbo->cols['totaljobrequested']->option->detailMethod = 'text';
$dbo->cols['totaljobrequested']->option->newMethod = 'text';
$dbo->cols['totaljobrequested']->option->editMethod = 'text';
$dbo->cols['totalwip'] = new DBO_COL('totalwip', 'int8', '8', '-1');
$dbo->cols['totalwip']->inputTypeDefault = 'text';
$dbo->cols['totalwip']->exportUseLookup = true;
$dbo->cols['totalwip']->searchMode = 'exact';
$dbo->cols['totalwip']->capContClassDefault = array();
$dbo->cols['totalwip']->valContClassDefault = array();
$dbo->cols['totalwip']->option->defaultMethod = 'text';
$dbo->cols['totalwip']->option->searchMethod = 'text';
$dbo->cols['totalwip']->option->listMethod = 'text';
$dbo->cols['totalwip']->option->detailMethod = 'text';
$dbo->cols['totalwip']->option->newMethod = 'text';
$dbo->cols['totalwip']->option->editMethod = 'text';
$dbo->cols['totalcancelled'] = new DBO_COL('totalcancelled', 'int8', '8', '-1');
$dbo->cols['totalcancelled']->inputTypeDefault = 'text';
$dbo->cols['totalcancelled']->exportUseLookup = true;
$dbo->cols['totalcancelled']->searchMode = 'exact';
$dbo->cols['totalcancelled']->capContClassDefault = array();
$dbo->cols['totalcancelled']->valContClassDefault = array();
$dbo->cols['totalcancelled']->option->defaultMethod = 'text';
$dbo->cols['totalcancelled']->option->searchMethod = 'text';
$dbo->cols['totalcancelled']->option->listMethod = 'text';
$dbo->cols['totalcancelled']->option->detailMethod = 'text';
$dbo->cols['totalcancelled']->option->newMethod = 'text';
$dbo->cols['totalcancelled']->option->editMethod = 'text';
$dbo->cols['totalcompleted'] = new DBO_COL('totalcompleted', 'int8', '8', '-1');
$dbo->cols['totalcompleted']->inputTypeDefault = 'text';
$dbo->cols['totalcompleted']->exportUseLookup = true;
$dbo->cols['totalcompleted']->searchMode = 'exact';
$dbo->cols['totalcompleted']->capContClassDefault = array();
$dbo->cols['totalcompleted']->valContClassDefault = array();
$dbo->cols['totalcompleted']->option->defaultMethod = 'text';
$dbo->cols['totalcompleted']->option->searchMethod = 'text';
$dbo->cols['totalcompleted']->option->listMethod = 'text';
$dbo->cols['totalcompleted']->option->detailMethod = 'text';
$dbo->cols['totalcompleted']->option->newMethod = 'text';
$dbo->cols['totalcompleted']->option->editMethod = 'text';
$dbo->cols['to_char'] = new DBO_COL('to_char', 'text', '-1', '-1');
$dbo->cols['to_char']->inputTypeDefault = 'text';
$dbo->cols['to_char']->exportUseLookup = true;
$dbo->cols['to_char']->searchMode = 'exact';
$dbo->cols['to_char']->capContClassDefault = array();
$dbo->cols['to_char']->valContClassDefault = array();
$dbo->cols['to_char']->option->defaultMethod = 'text';
$dbo->cols['to_char']->option->searchMethod = 'text';
$dbo->cols['to_char']->option->listMethod = 'text';
$dbo->cols['to_char']->option->detailMethod = 'text';
$dbo->cols['to_char']->option->newMethod = 'text';
$dbo->cols['to_char']->option->editMethod = 'text';
$dbo->cols['js_request_dateinmth'] = new DBO_COL('js_request_dateinmth', 'text', '-1', '-1');
$dbo->cols['js_request_dateinmth']->inputTypeDefault = 'select';
$dbo->cols['js_request_dateinmth']->exportUseLookup = true;
$dbo->cols['js_request_dateinmth']->searchMode = 'exact';
$dbo->cols['js_request_dateinmth']->capContClassDefault = array();
$dbo->cols['js_request_dateinmth']->valContClassDefault = array();
$dbo->cols['js_request_dateinmth']->option->search = 'displaySearchDate()';
$dbo->cols['js_request_dateinmth']->option->defaultMethod = 'text';
$dbo->cols['js_request_dateinmth']->option->searchMethod = 'php';
$dbo->cols['js_request_dateinmth']->option->listMethod = 'text';
$dbo->cols['js_request_dateinmth']->option->detailMethod = 'text';
$dbo->cols['js_request_dateinmth']->option->newMethod = 'text';
$dbo->cols['js_request_dateinmth']->option->editMethod = 'text';
$dbo->cols['dateinnum'] = new DBO_COL('dateinnum', 'text', '-1', '-1');
$dbo->cols['dateinnum']->inputTypeDefault = 'text';
$dbo->cols['dateinnum']->exportUseLookup = true;
$dbo->cols['dateinnum']->searchMode = 'exact';
$dbo->cols['dateinnum']->capContClassDefault = array();
$dbo->cols['dateinnum']->valContClassDefault = array();
$dbo->cols['dateinnum']->option->defaultMethod = 'text';
$dbo->cols['dateinnum']->option->searchMethod = 'text';
$dbo->cols['dateinnum']->option->listMethod = 'text';
$dbo->cols['dateinnum']->option->detailMethod = 'text';
$dbo->cols['dateinnum']->option->newMethod = 'text';
$dbo->cols['dateinnum']->option->editMethod = 'text';
$dbo->cols['org_id'] = new DBO_COL('org_id', 'int4', '4', '-1');
$dbo->cols['org_id']->inputTypeDefault = 'text';
$dbo->cols['org_id']->exportUseLookup = true;
$dbo->cols['org_id']->searchMode = 'exact';
$dbo->cols['org_id']->capContClassDefault = array();
$dbo->cols['org_id']->valContClassDefault = array();
$dbo->cols['org_id']->option->defaultMethod = 'text';
$dbo->cols['org_id']->option->searchMethod = 'text';
$dbo->cols['org_id']->option->listMethod = 'text';
$dbo->cols['org_id']->option->detailMethod = 'text';
$dbo->cols['org_id']->option->newMethod = 'text';
$dbo->cols['org_id']->option->editMethod = 'text';

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
class DBO_custom_rpt_monthsalebycustomer extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_rpt_monthsalebycustomer_custom_new';
function dbo_rpt_monthsalebycustomer_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_rpt_monthsalebycustomer_custom_edit';
function dbo_rpt_monthsalebycustomer_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_rpt_monthsalebycustomer_custom_search';
function dbo_rpt_monthsalebycustomer_custom_search(&$search, $dbo){
}

$dbo->deleteModifier = 'dbo_rpt_monthsalebycustomer_custom_delete';
function dbo_rpt_monthsalebycustomer_custom_delete($table, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_rpt_monthsalebycustomer_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>