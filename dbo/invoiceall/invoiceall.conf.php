<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'invoiceall';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'minvoice';
$dbo->key = array('iv_id');
$dbo->sql = 'select minvoice.*, \'\' as printbutton from minvoice';
$dbo->col = array('iv_id', 'iv_invoicedate', 'iv_created', 'iv_orgid', 'iv_amount', 'iv_paid', 'iv_paydate', 'printbutton');
$dbo->colList = array('iv_orgid', 'iv_invoicedate', 'iv_amount', 'iv_paid', 'iv_paydate', 'printbutton');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('iv_id', 'iv_invoicedate', 'iv_created', 'iv_orgid', 'iv_amount', 'iv_paid', 'iv_paydate');
$dbo->colNew = array('iv_id', 'iv_invoicedate', 'iv_created', 'iv_orgid', 'iv_amount', 'iv_paid', 'iv_paydate');
$dbo->colEdit = array('iv_invoicedate', 'iv_orgid', 'iv_amount', 'iv_paid', 'iv_paydate');
$dbo->colSearch = array('iv_orgid', 'iv_invoicedate', 'iv_paid', 'iv_paydate');
$dbo->colExport = array('iv_id', 'iv_invoicedate', 'iv_created', 'iv_orgid', 'iv_amount', 'iv_paid', 'iv_paydate');
$dbo->colSort = array();
$dbo->canSearch = true;
$dbo->canNew = true;
$dbo->canEdit = true;
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

$dbo->cols['iv_id'] = new DBO_COL('iv_id', 'int4', '4', '-1');
$dbo->cols['iv_id']->inputTypeDefault = 'text';
$dbo->cols['iv_id']->searchMode = 'exact';
$dbo->cols['iv_id']->capContClassDefault = array();
$dbo->cols['iv_id']->valContClassDefault = array();
$dbo->cols['iv_id']->option->defaultMethod = 'text';
$dbo->cols['iv_id']->option->searchMethod = 'text';
$dbo->cols['iv_id']->option->listMethod = 'text';
$dbo->cols['iv_id']->option->detailMethod = 'text';
$dbo->cols['iv_id']->option->newMethod = 'text';
$dbo->cols['iv_id']->option->editMethod = 'text';
$dbo->cols['iv_invoicedate'] = new DBO_COL('iv_invoicedate', 'timestamptz', '8', '-1');
$dbo->cols['iv_invoicedate']->displayDataType = 'date';
$dbo->cols['iv_invoicedate']->inputTypeDefault = 'month';
$dbo->cols['iv_invoicedate']->attributeEdit = array('readonly'=>array(''));
$dbo->cols['iv_invoicedate']->format = 'MONTH YYYY';
$dbo->cols['iv_invoicedate']->searchMode = 'exact';
$dbo->cols['iv_invoicedate']->capContClassDefault = array();
$dbo->cols['iv_invoicedate']->valContClassDefault = array();
$dbo->cols['iv_invoicedate']->option->defaultMethod = 'text';
$dbo->cols['iv_invoicedate']->option->searchMethod = 'text';
$dbo->cols['iv_invoicedate']->option->listMethod = 'text';
$dbo->cols['iv_invoicedate']->option->detailMethod = 'text';
$dbo->cols['iv_invoicedate']->option->newMethod = 'text';
$dbo->cols['iv_invoicedate']->option->editMethod = 'text';
$dbo->cols['iv_created'] = new DBO_COL('iv_created', 'timestamptz', '8', '-1');
$dbo->cols['iv_created']->inputTypeDefault = 'text';
$dbo->cols['iv_created']->searchMode = 'exact';
$dbo->cols['iv_created']->capContClassDefault = array();
$dbo->cols['iv_created']->valContClassDefault = array();
$dbo->cols['iv_created']->option->defaultMethod = 'text';
$dbo->cols['iv_created']->option->searchMethod = 'text';
$dbo->cols['iv_created']->option->listMethod = 'text';
$dbo->cols['iv_created']->option->detailMethod = 'text';
$dbo->cols['iv_created']->option->newMethod = 'text';
$dbo->cols['iv_created']->option->editMethod = 'text';
$dbo->cols['iv_orgid'] = new DBO_COL('iv_orgid', 'int4', '4', '-1');
$dbo->cols['iv_orgid']->inputTypeDefault = 'select';
$dbo->cols['iv_orgid']->attributeEdit = array('readonly'=>array(''));
$dbo->cols['iv_orgid']->searchMode = 'exact';
$dbo->cols['iv_orgid']->capContClassDefault = array();
$dbo->cols['iv_orgid']->valContClassDefault = array();
$dbo->cols['iv_orgid']->option->default = 'select org_id, org_name from fcorg where org_external = \'Y\'';
$dbo->cols['iv_orgid']->option->defaultMethod = 'sql';
$dbo->cols['iv_orgid']->option->searchMethod = 'text';
$dbo->cols['iv_orgid']->option->listMethod = 'text';
$dbo->cols['iv_orgid']->option->detailMethod = 'text';
$dbo->cols['iv_orgid']->option->newMethod = 'text';
$dbo->cols['iv_orgid']->option->editMethod = 'text';
$dbo->cols['iv_amount'] = new DBO_COL('iv_amount', 'numeric', '-1', '1310728');
$dbo->cols['iv_amount']->inputTypeDefault = 'text';
$dbo->cols['iv_amount']->attributeEdit = array('readonly'=>array(''));
$dbo->cols['iv_amount']->searchMode = 'exact';
$dbo->cols['iv_amount']->capContClassDefault = array();
$dbo->cols['iv_amount']->valContClassDefault = array();
$dbo->cols['iv_amount']->option->defaultMethod = 'text';
$dbo->cols['iv_amount']->option->searchMethod = 'text';
$dbo->cols['iv_amount']->option->listMethod = 'text';
$dbo->cols['iv_amount']->option->detailMethod = 'text';
$dbo->cols['iv_amount']->option->newMethod = 'text';
$dbo->cols['iv_amount']->option->editMethod = 'text';
$dbo->cols['iv_paid'] = new DBO_COL('iv_paid', 'varchar', '-1', '8');
$dbo->cols['iv_paid']->inputTypeDefault = 'select';
$dbo->cols['iv_paid']->searchMode = 'exact';
$dbo->cols['iv_paid']->capContClassDefault = array();
$dbo->cols['iv_paid']->valContClassDefault = array();
$dbo->cols['iv_paid']->option->default = 'Y/Yes
N/No';
$dbo->cols['iv_paid']->option->defaultMethod = 'text';
$dbo->cols['iv_paid']->option->searchMethod = 'text';
$dbo->cols['iv_paid']->option->listMethod = 'text';
$dbo->cols['iv_paid']->option->detailMethod = 'text';
$dbo->cols['iv_paid']->option->newMethod = 'text';
$dbo->cols['iv_paid']->option->editMethod = 'text';
$dbo->cols['iv_paydate'] = new DBO_COL('iv_paydate', 'timestamptz', '8', '-1');
$dbo->cols['iv_paydate']->displayDataType = 'date';
$dbo->cols['iv_paydate']->inputTypeDefault = 'date';
$dbo->cols['iv_paydate']->searchMode = 'exact';
$dbo->cols['iv_paydate']->capContClassDefault = array();
$dbo->cols['iv_paydate']->valContClassDefault = array();
$dbo->cols['iv_paydate']->option->defaultMethod = 'text';
$dbo->cols['iv_paydate']->option->searchMethod = 'text';
$dbo->cols['iv_paydate']->option->listMethod = 'text';
$dbo->cols['iv_paydate']->option->detailMethod = 'text';
$dbo->cols['iv_paydate']->option->newMethod = 'text';
$dbo->cols['iv_paydate']->option->editMethod = 'text';
$dbo->cols['printbutton'] = new DBO_COL('printbutton', 'unknown', '-2', '-1');
$dbo->cols['printbutton']->displayListModifierMethod = 'text';
$dbo->cols['printbutton']->displayListModifier = '<button form="noform" class="btn btn-labeled btn-primary" style="min-width:85px;" onclick="printInvoicePreview({iv_id});"><span class="btn-label icon fa fa-print"></span>Print</button>';
$dbo->cols['printbutton']->inputTypeDefault = 'text';
$dbo->cols['printbutton']->searchMode = 'exact';
$dbo->cols['printbutton']->capContClassDefault = array();
$dbo->cols['printbutton']->valContClassDefault = array();
$dbo->cols['printbutton']->option->defaultMethod = 'text';
$dbo->cols['printbutton']->option->searchMethod = 'text';
$dbo->cols['printbutton']->option->listMethod = 'text';
$dbo->cols['printbutton']->option->detailMethod = 'text';
$dbo->cols['printbutton']->option->newMethod = 'text';
$dbo->cols['printbutton']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_invoiceall_custom_new';
function dbo_invoiceall_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_invoiceall_custom_edit';
function dbo_invoiceall_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_invoiceall_custom_search';
function dbo_invoiceall_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_invoiceall_custom_delete';
function dbo_invoiceall_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_invoiceall_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>