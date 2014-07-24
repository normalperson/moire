<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'paymentall';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'mpayment';
$dbo->key = array('pay_id');
$dbo->sql = 'select pay_id, pay_created, pay_amount, pay_allocatedamount, pay_orgid, pay_status, 
string_agg(to_char(pi_ivid, \'999\'), \', \') as ivids 
from mpayment left join mpaymentinvoice on pay_id = pi_payid 
group by pay_id, pay_created, pay_amount, pay_allocatedamount, pay_orgid, pay_status';
$dbo->col = array('pay_id', 'pay_created', 'pay_amount', 'pay_allocatedamount', 'pay_orgid', 'pay_status', 'ivids');
$dbo->colList = array('pay_orgid', 'pay_amount', 'pay_allocatedamount', 'pay_created', 'pay_status');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('pay_id', 'pay_created', 'pay_amount', 'pay_allocatedamount', 'pay_orgid');
$dbo->colNew = array('pay_amount', 'pay_orgid');
$dbo->colEdit = array('pay_amount', 'pay_orgid');
$dbo->colSearch = array('pay_created', 'pay_amount', 'pay_orgid');
$dbo->colExport = array('pay_id', 'pay_created', 'pay_amount', 'pay_allocatedamount', 'pay_orgid');
$dbo->colSort = array();
$dbo->canSearch = true;
$dbo->canNew = true;
$dbo->canEdit = false;
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
$dbo->layout = 'AlwaysList';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->defaultDateFormat = 'yyyy-mm-dd';
$dbo->defaultDateTimeFormat = 'yyyy-mm-dd hh24:min:ss';
$dbo->defaultTimeFormat = 'hh24:min:ss';
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->detailBack = 'Back';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['pay_id'] = new DBO_COL('pay_id', 'int4', '4', '-1');
$dbo->cols['pay_id']->inputTypeDefault = 'text';
$dbo->cols['pay_id']->searchMode = 'exact';
$dbo->cols['pay_id']->capContClassDefault = array();
$dbo->cols['pay_id']->valContClassDefault = array();
$dbo->cols['pay_id']->option->defaultMethod = 'text';
$dbo->cols['pay_id']->option->searchMethod = 'text';
$dbo->cols['pay_id']->option->listMethod = 'text';
$dbo->cols['pay_id']->option->detailMethod = 'text';
$dbo->cols['pay_id']->option->newMethod = 'text';
$dbo->cols['pay_id']->option->editMethod = 'text';
$dbo->cols['pay_created'] = new DBO_COL('pay_created', 'timestamptz', '8', '-1');
$dbo->cols['pay_created']->inputTypeDefault = 'text';
$dbo->cols['pay_created']->searchMode = 'exact';
$dbo->cols['pay_created']->capContClassDefault = array();
$dbo->cols['pay_created']->valContClassDefault = array();
$dbo->cols['pay_created']->option->defaultMethod = 'text';
$dbo->cols['pay_created']->option->searchMethod = 'text';
$dbo->cols['pay_created']->option->listMethod = 'text';
$dbo->cols['pay_created']->option->detailMethod = 'text';
$dbo->cols['pay_created']->option->newMethod = 'text';
$dbo->cols['pay_created']->option->editMethod = 'text';
$dbo->cols['pay_amount'] = new DBO_COL('pay_amount', 'numeric', '-1', '1310728');
$dbo->cols['pay_amount']->defaultNewValueMethod = 'phps';
$dbo->cols['pay_amount']->defaultNewValue = 'isset($_GET[\'amount\'])?$_GET[\'amount\']:\'\'';
$dbo->cols['pay_amount']->inputTypeDefault = 'text';
$dbo->cols['pay_amount']->mandatoryNew = 1;
$dbo->cols['pay_amount']->searchMode = 'exact';
$dbo->cols['pay_amount']->capContClassDefault = array();
$dbo->cols['pay_amount']->valContClassDefault = array();
$dbo->cols['pay_amount']->option->defaultMethod = 'text';
$dbo->cols['pay_amount']->option->searchMethod = 'text';
$dbo->cols['pay_amount']->option->listMethod = 'text';
$dbo->cols['pay_amount']->option->detailMethod = 'text';
$dbo->cols['pay_amount']->option->newMethod = 'text';
$dbo->cols['pay_amount']->option->editMethod = 'text';
$dbo->cols['pay_allocatedamount'] = new DBO_COL('pay_allocatedamount', 'numeric', '-1', '1310728');
$dbo->cols['pay_allocatedamount']->inputTypeDefault = 'text';
$dbo->cols['pay_allocatedamount']->searchMode = 'exact';
$dbo->cols['pay_allocatedamount']->capContClassDefault = array();
$dbo->cols['pay_allocatedamount']->valContClassDefault = array();
$dbo->cols['pay_allocatedamount']->option->defaultMethod = 'text';
$dbo->cols['pay_allocatedamount']->option->searchMethod = 'text';
$dbo->cols['pay_allocatedamount']->option->listMethod = 'text';
$dbo->cols['pay_allocatedamount']->option->detailMethod = 'text';
$dbo->cols['pay_allocatedamount']->option->newMethod = 'text';
$dbo->cols['pay_allocatedamount']->option->editMethod = 'text';
$dbo->cols['pay_orgid'] = new DBO_COL('pay_orgid', 'int4', '4', '-1');
$dbo->cols['pay_orgid']->defaultNewValueMethod = 'phps';
$dbo->cols['pay_orgid']->defaultNewValue = 'isset($_GET[\'orgid\'])?$_GET[\'orgid\']:\'\'';
$dbo->cols['pay_orgid']->inputTypeDefault = 'select';
$dbo->cols['pay_orgid']->mandatoryNew = 1;
$dbo->cols['pay_orgid']->searchMode = 'exact';
$dbo->cols['pay_orgid']->capContClassDefault = array();
$dbo->cols['pay_orgid']->valContClassDefault = array();
$dbo->cols['pay_orgid']->option->default = 'lookup_org_with_amount()';
$dbo->cols['pay_orgid']->option->defaultMethod = 'php';
$dbo->cols['pay_orgid']->option->searchMethod = 'text';
$dbo->cols['pay_orgid']->option->listMethod = 'text';
$dbo->cols['pay_orgid']->option->detailMethod = 'text';
$dbo->cols['pay_orgid']->option->newMethod = 'text';
$dbo->cols['pay_orgid']->option->editMethod = 'text';
$dbo->cols['ivids'] = new DBO_COL('ivids', 'text', '-1', '-1');
$dbo->cols['ivids']->inputTypeDefault = 'text';
$dbo->cols['ivids']->searchMode = 'exact';
$dbo->cols['ivids']->capContClassDefault = array();
$dbo->cols['ivids']->valContClassDefault = array();
$dbo->cols['ivids']->option->defaultMethod = 'text';
$dbo->cols['ivids']->option->searchMethod = 'text';
$dbo->cols['ivids']->option->listMethod = 'text';
$dbo->cols['ivids']->option->detailMethod = 'text';
$dbo->cols['ivids']->option->newMethod = 'text';
$dbo->cols['ivids']->option->editMethod = 'text';
$dbo->cols['pay_status'] = new DBO_COL('pay_status', 'varchar', '-1', '8');
$dbo->cols['pay_status']->inputTypeDefault = 'text';
$dbo->cols['pay_status']->searchMode = 'exact';
$dbo->cols['pay_status']->capContClassDefault = array();
$dbo->cols['pay_status']->valContClassDefault = array();
$dbo->cols['pay_status']->option->default = 'A/Active
D/Deleted';
$dbo->cols['pay_status']->option->defaultMethod = 'text';
$dbo->cols['pay_status']->option->searchMethod = 'text';
$dbo->cols['pay_status']->option->listMethod = 'text';
$dbo->cols['pay_status']->option->detailMethod = 'text';
$dbo->cols['pay_status']->option->newMethod = 'text';
$dbo->cols['pay_status']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_paymentall_custom_new';
function dbo_paymentall_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_paymentall_custom_edit';
function dbo_paymentall_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_paymentall_custom_search';
function dbo_paymentall_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_paymentall_custom_delete';
function dbo_paymentall_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_paymentall_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>