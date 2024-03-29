<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'clientorg';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcorg';
$dbo->key = array('org_id');
$dbo->sql = 'select * from fcorg join morgextra on org_id = ox_orgid 
where org_external = \'Y\'';
$dbo->col = array('org_id', 'org_type', 'org_external', 'org_name', 'org_parentid', 'org_primaryid', 'org_address', 'org_contactno', 'org_status', 'org_lccode', 'org_concode', 'org_region', 'org_created', 'ox_id', 'ox_orgid', 'ox_customertype');
$dbo->colList = array('org_name', 'org_address', 'org_contactno', 'org_status');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('org_id', 'org_name', 'org_parentid', 'org_primaryid', 'org_address', 'org_contactno', 'org_status');
$dbo->colNew = array('org_name', 'org_address', 'org_contactno', 'org_status', 'org_external', 'org_region', 'ox_customertype');
$dbo->colEdit = array('org_name', 'org_address', 'org_contactno', 'org_status', 'org_external', 'org_region', 'ox_customertype');
$dbo->colSearch = array('org_name');
$dbo->colExport = array('org_id', 'org_name', 'org_parentid', 'org_primaryid', 'org_address', 'org_contactno', 'org_status');
$dbo->colSort = array();
$dbo->colSum = array();
$dbo->colSumPage = array();
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array();
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
$dbo->listEditToggle = false;
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
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

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
$dbo->cols['org_code'] = new DBO_COL('org_code', 'VAR_STRING', '150', '0');
$dbo->cols['org_code']->inputTypeDefault = 'text';
$dbo->cols['org_code']->exportUseLookup = true;
$dbo->cols['org_code']->mandatoryNew = 1;
$dbo->cols['org_code']->mandatoryEdit = 1;
$dbo->cols['org_code']->searchMode = 'exact';
$dbo->cols['org_code']->capContClassDefault = array();
$dbo->cols['org_code']->valContClassDefault = array();
$dbo->cols['org_code']->option->defaultMethod = 'text';
$dbo->cols['org_code']->option->searchMethod = 'text';
$dbo->cols['org_code']->option->listMethod = 'text';
$dbo->cols['org_code']->option->detailMethod = 'text';
$dbo->cols['org_code']->option->newMethod = 'text';
$dbo->cols['org_code']->option->editMethod = 'text';
$dbo->cols['org_name'] = new DBO_COL('org_name', 'varchar', '-1', '2004');
$dbo->cols['org_name']->inputTypeDefault = 'text';
$dbo->cols['org_name']->exportUseLookup = true;
$dbo->cols['org_name']->mandatoryNew = '1';
$dbo->cols['org_name']->mandatoryEdit = '1';
$dbo->cols['org_name']->searchMode = 'matchfront';
$dbo->cols['org_name']->capContClassDefault = array();
$dbo->cols['org_name']->valContClassDefault = array();
$dbo->cols['org_name']->option->defaultMethod = 'text';
$dbo->cols['org_name']->option->searchMethod = 'text';
$dbo->cols['org_name']->option->listMethod = 'text';
$dbo->cols['org_name']->option->detailMethod = 'text';
$dbo->cols['org_name']->option->newMethod = 'text';
$dbo->cols['org_name']->option->editMethod = 'text';
$dbo->cols['org_parentid'] = new DBO_COL('org_parentid', 'int4', '4', '-1');
$dbo->cols['org_parentid']->inputTypeDefault = 'text';
$dbo->cols['org_parentid']->exportUseLookup = true;
$dbo->cols['org_parentid']->searchMode = 'exact';
$dbo->cols['org_parentid']->capContClassDefault = array();
$dbo->cols['org_parentid']->valContClassDefault = array();
$dbo->cols['org_parentid']->option->defaultMethod = 'text';
$dbo->cols['org_parentid']->option->searchMethod = 'text';
$dbo->cols['org_parentid']->option->listMethod = 'text';
$dbo->cols['org_parentid']->option->detailMethod = 'text';
$dbo->cols['org_parentid']->option->newMethod = 'text';
$dbo->cols['org_parentid']->option->editMethod = 'text';
$dbo->cols['org_primaryid'] = new DBO_COL('org_primaryid', 'varchar', '-1', '204');
$dbo->cols['org_primaryid']->inputTypeDefault = 'text';
$dbo->cols['org_primaryid']->exportUseLookup = true;
$dbo->cols['org_primaryid']->searchMode = 'exact';
$dbo->cols['org_primaryid']->capContClassDefault = array();
$dbo->cols['org_primaryid']->valContClassDefault = array();
$dbo->cols['org_primaryid']->option->defaultMethod = 'text';
$dbo->cols['org_primaryid']->option->searchMethod = 'text';
$dbo->cols['org_primaryid']->option->listMethod = 'text';
$dbo->cols['org_primaryid']->option->detailMethod = 'text';
$dbo->cols['org_primaryid']->option->newMethod = 'text';
$dbo->cols['org_primaryid']->option->editMethod = 'text';
$dbo->cols['org_address'] = new DBO_COL('org_address', 'varchar', '-1', '4004');
$dbo->cols['org_address']->inputTypeDefault = 'text';
$dbo->cols['org_address']->exportUseLookup = true;
$dbo->cols['org_address']->mandatoryNew = '1';
$dbo->cols['org_address']->mandatoryEdit = '1';
$dbo->cols['org_address']->searchMode = 'exact';
$dbo->cols['org_address']->capContClassDefault = array();
$dbo->cols['org_address']->valContClassDefault = array();
$dbo->cols['org_address']->option->defaultMethod = 'text';
$dbo->cols['org_address']->option->searchMethod = 'text';
$dbo->cols['org_address']->option->listMethod = 'text';
$dbo->cols['org_address']->option->detailMethod = 'text';
$dbo->cols['org_address']->option->newMethod = 'text';
$dbo->cols['org_address']->option->editMethod = 'text';
$dbo->cols['org_contactno'] = new DBO_COL('org_contactno', 'varchar', '-1', '104');
$dbo->cols['org_contactno']->inputTypeDefault = 'text';
$dbo->cols['org_contactno']->exportUseLookup = true;
$dbo->cols['org_contactno']->searchMode = 'exact';
$dbo->cols['org_contactno']->capContClassDefault = array();
$dbo->cols['org_contactno']->valContClassDefault = array();
$dbo->cols['org_contactno']->option->defaultMethod = 'text';
$dbo->cols['org_contactno']->option->searchMethod = 'text';
$dbo->cols['org_contactno']->option->listMethod = 'text';
$dbo->cols['org_contactno']->option->detailMethod = 'text';
$dbo->cols['org_contactno']->option->newMethod = 'text';
$dbo->cols['org_contactno']->option->editMethod = 'text';
$dbo->cols['org_status'] = new DBO_COL('org_status', 'varchar', '-1', '16');
$dbo->cols['org_status']->defaultNewValue = 'ACTIVE';
$dbo->cols['org_status']->inputTypeDefault = 'radio';
$dbo->cols['org_status']->exportUseLookup = true;
$dbo->cols['org_status']->searchMode = 'exact';
$dbo->cols['org_status']->capContClassDefault = array();
$dbo->cols['org_status']->valContClassDefault = array();
$dbo->cols['org_status']->option->default = 'ACTIVE/Active
INACTIVE/Inactive';
$dbo->cols['org_status']->option->defaultMethod = 'text';
$dbo->cols['org_status']->option->searchMethod = 'text';
$dbo->cols['org_status']->option->listMethod = 'text';
$dbo->cols['org_status']->option->detailMethod = 'text';
$dbo->cols['org_status']->option->newMethod = 'text';
$dbo->cols['org_status']->option->editMethod = 'text';
$dbo->cols['org_type'] = new DBO_COL('org_type', 'varchar', '-1', '36');
$dbo->cols['org_type']->inputTypeDefault = 'text';
$dbo->cols['org_type']->exportUseLookup = true;
$dbo->cols['org_type']->searchMode = 'exact';
$dbo->cols['org_type']->capContClassDefault = array();
$dbo->cols['org_type']->valContClassDefault = array();
$dbo->cols['org_type']->option->defaultMethod = 'text';
$dbo->cols['org_type']->option->searchMethod = 'text';
$dbo->cols['org_type']->option->listMethod = 'text';
$dbo->cols['org_type']->option->detailMethod = 'text';
$dbo->cols['org_type']->option->newMethod = 'text';
$dbo->cols['org_type']->option->editMethod = 'text';
$dbo->cols['org_external'] = new DBO_COL('org_external', 'varchar', '-1', '5');
$dbo->cols['org_external']->defaultNewValue = 'N';
$dbo->cols['org_external']->inputTypeDefault = 'radio';
$dbo->cols['org_external']->exportUseLookup = true;
$dbo->cols['org_external']->searchMode = 'exact';
$dbo->cols['org_external']->capContClassDefault = array();
$dbo->cols['org_external']->valContClassDefault = array();
$dbo->cols['org_external']->option->default = 'Y/Yes
N/No';
$dbo->cols['org_external']->option->defaultMethod = 'text';
$dbo->cols['org_external']->option->searchMethod = 'text';
$dbo->cols['org_external']->option->listMethod = 'text';
$dbo->cols['org_external']->option->detailMethod = 'text';
$dbo->cols['org_external']->option->newMethod = 'text';
$dbo->cols['org_external']->option->editMethod = 'text';
$dbo->cols['org_lccode'] = new DBO_COL('org_lccode', 'varchar', '-1', '36');
$dbo->cols['org_lccode']->inputTypeDefault = 'text';
$dbo->cols['org_lccode']->exportUseLookup = true;
$dbo->cols['org_lccode']->searchMode = 'exact';
$dbo->cols['org_lccode']->capContClassDefault = array();
$dbo->cols['org_lccode']->valContClassDefault = array();
$dbo->cols['org_lccode']->option->defaultMethod = 'text';
$dbo->cols['org_lccode']->option->searchMethod = 'text';
$dbo->cols['org_lccode']->option->listMethod = 'text';
$dbo->cols['org_lccode']->option->detailMethod = 'text';
$dbo->cols['org_lccode']->option->newMethod = 'text';
$dbo->cols['org_lccode']->option->editMethod = 'text';
$dbo->cols['org_concode'] = new DBO_COL('org_concode', 'varchar', '-1', '28');
$dbo->cols['org_concode']->inputTypeDefault = 'text';
$dbo->cols['org_concode']->exportUseLookup = true;
$dbo->cols['org_concode']->searchMode = 'exact';
$dbo->cols['org_concode']->capContClassDefault = array();
$dbo->cols['org_concode']->valContClassDefault = array();
$dbo->cols['org_concode']->option->defaultMethod = 'text';
$dbo->cols['org_concode']->option->searchMethod = 'text';
$dbo->cols['org_concode']->option->listMethod = 'text';
$dbo->cols['org_concode']->option->detailMethod = 'text';
$dbo->cols['org_concode']->option->newMethod = 'text';
$dbo->cols['org_concode']->option->editMethod = 'text';
$dbo->cols['org_region'] = new DBO_COL('org_region', 'varchar', '-1', '54');
$dbo->cols['org_region']->inputTypeDefault = 'select';
$dbo->cols['org_region']->exportUseLookup = true;
$dbo->cols['org_region']->mandatoryNew = '1';
$dbo->cols['org_region']->mandatoryEdit = '1';
$dbo->cols['org_region']->searchMode = 'exact';
$dbo->cols['org_region']->capContClassDefault = array();
$dbo->cols['org_region']->valContClassDefault = array();
$dbo->cols['org_region']->option->default = 'select rg_code from mregion';
$dbo->cols['org_region']->option->defaultMethod = 'sql';
$dbo->cols['org_region']->option->searchMethod = 'text';
$dbo->cols['org_region']->option->listMethod = 'text';
$dbo->cols['org_region']->option->detailMethod = 'text';
$dbo->cols['org_region']->option->newMethod = 'text';
$dbo->cols['org_region']->option->editMethod = 'text';
$dbo->cols['org_created'] = new DBO_COL('org_created', 'timestamptz', '8', '-1');
$dbo->cols['org_created']->inputTypeDefault = 'text';
$dbo->cols['org_created']->exportUseLookup = true;
$dbo->cols['org_created']->searchMode = 'exact';
$dbo->cols['org_created']->capContClassDefault = array();
$dbo->cols['org_created']->valContClassDefault = array();
$dbo->cols['org_created']->option->defaultMethod = 'text';
$dbo->cols['org_created']->option->searchMethod = 'text';
$dbo->cols['org_created']->option->listMethod = 'text';
$dbo->cols['org_created']->option->detailMethod = 'text';
$dbo->cols['org_created']->option->newMethod = 'text';
$dbo->cols['org_created']->option->editMethod = 'text';
$dbo->cols['tp_id'] = new DBO_COL('tp_id', 'int4', '4', '-1');
$dbo->cols['tp_id']->inputTypeDefault = 'text';
$dbo->cols['tp_id']->exportUseLookup = true;
$dbo->cols['tp_id']->searchMode = 'exact';
$dbo->cols['tp_id']->capContClassDefault = array();
$dbo->cols['tp_id']->valContClassDefault = array();
$dbo->cols['tp_id']->option->defaultMethod = 'text';
$dbo->cols['tp_id']->option->searchMethod = 'text';
$dbo->cols['tp_id']->option->listMethod = 'text';
$dbo->cols['tp_id']->option->detailMethod = 'text';
$dbo->cols['tp_id']->option->newMethod = 'text';
$dbo->cols['tp_id']->option->editMethod = 'text';
$dbo->cols['tp_orgid'] = new DBO_COL('tp_orgid', 'int4', '4', '-1');
$dbo->cols['tp_orgid']->inputTypeDefault = 'text';
$dbo->cols['tp_orgid']->exportUseLookup = true;
$dbo->cols['tp_orgid']->searchMode = 'exact';
$dbo->cols['tp_orgid']->capContClassDefault = array();
$dbo->cols['tp_orgid']->valContClassDefault = array();
$dbo->cols['tp_orgid']->option->defaultMethod = 'text';
$dbo->cols['tp_orgid']->option->searchMethod = 'text';
$dbo->cols['tp_orgid']->option->listMethod = 'text';
$dbo->cols['tp_orgid']->option->detailMethod = 'text';
$dbo->cols['tp_orgid']->option->newMethod = 'text';
$dbo->cols['tp_orgid']->option->editMethod = 'text';
$dbo->cols['tp_customertype'] = new DBO_COL('tp_customertype', 'varchar', '-1', '-1');
$dbo->cols['tp_customertype']->inputTypeDefault = 'radio';
$dbo->cols['tp_customertype']->exportUseLookup = true;
$dbo->cols['tp_customertype']->mandatoryNew = '1';
$dbo->cols['tp_customertype']->mandatoryEdit = '1';
$dbo->cols['tp_customertype']->searchMode = 'exact';
$dbo->cols['tp_customertype']->capContClassDefault = array();
$dbo->cols['tp_customertype']->valContClassDefault = array();
$dbo->cols['tp_customertype']->option->default = 'select lu_code,lu_title from fclookup
where lu_cat = \'CUSTYPE\'
order by lu_code';
$dbo->cols['tp_customertype']->option->defaultMethod = 'sql';
$dbo->cols['tp_customertype']->option->searchMethod = 'text';
$dbo->cols['tp_customertype']->option->listMethod = 'text';
$dbo->cols['tp_customertype']->option->detailMethod = 'text';
$dbo->cols['tp_customertype']->option->newMethod = 'text';
$dbo->cols['tp_customertype']->option->editMethod = 'text';
$dbo->cols['ox_id'] = new DBO_COL('ox_id', 'int4', '4', '-1');
$dbo->cols['ox_id']->inputTypeDefault = 'text';
$dbo->cols['ox_id']->exportUseLookup = true;
$dbo->cols['ox_id']->searchMode = 'exact';
$dbo->cols['ox_id']->capContClassDefault = array();
$dbo->cols['ox_id']->valContClassDefault = array();
$dbo->cols['ox_id']->option->defaultMethod = 'text';
$dbo->cols['ox_id']->option->searchMethod = 'text';
$dbo->cols['ox_id']->option->listMethod = 'text';
$dbo->cols['ox_id']->option->detailMethod = 'text';
$dbo->cols['ox_id']->option->newMethod = 'text';
$dbo->cols['ox_id']->option->editMethod = 'text';
$dbo->cols['ox_orgid'] = new DBO_COL('ox_orgid', 'int4', '4', '-1');
$dbo->cols['ox_orgid']->inputTypeDefault = 'text';
$dbo->cols['ox_orgid']->exportUseLookup = true;
$dbo->cols['ox_orgid']->searchMode = 'exact';
$dbo->cols['ox_orgid']->capContClassDefault = array();
$dbo->cols['ox_orgid']->valContClassDefault = array();
$dbo->cols['ox_orgid']->option->defaultMethod = 'text';
$dbo->cols['ox_orgid']->option->searchMethod = 'text';
$dbo->cols['ox_orgid']->option->listMethod = 'text';
$dbo->cols['ox_orgid']->option->detailMethod = 'text';
$dbo->cols['ox_orgid']->option->newMethod = 'text';
$dbo->cols['ox_orgid']->option->editMethod = 'text';
$dbo->cols['ox_customertype'] = new DBO_COL('ox_customertype', 'varchar', '-1', '-1');
$dbo->cols['ox_customertype']->inputTypeDefault = 'select';
$dbo->cols['ox_customertype']->exportUseLookup = true;
$dbo->cols['ox_customertype']->mandatoryNew = '1';
$dbo->cols['ox_customertype']->mandatoryEdit = '1';
$dbo->cols['ox_customertype']->searchMode = 'exact';
$dbo->cols['ox_customertype']->capContClassDefault = array();
$dbo->cols['ox_customertype']->valContClassDefault = array();
$dbo->cols['ox_customertype']->option->default = 'select lu_code,lu_title from fclookup
where lu_cat = \'CUSTYPE\'
order by lu_code';
$dbo->cols['ox_customertype']->option->defaultMethod = 'sql';
$dbo->cols['ox_customertype']->option->searchMethod = 'text';
$dbo->cols['ox_customertype']->option->listMethod = 'text';
$dbo->cols['ox_customertype']->option->detailMethod = 'text';
$dbo->cols['ox_customertype']->option->newMethod = 'text';
$dbo->cols['ox_customertype']->option->editMethod = 'text';

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
class DBO_custom_clientorg extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_clientorg_custom_new';
function dbo_clientorg_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_clientorg_custom_edit';
function dbo_clientorg_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_clientorg_custom_search';
function dbo_clientorg_custom_search(&$search, $dbo){
}

$dbo->deleteModifier = 'dbo_clientorg_custom_delete';
function dbo_clientorg_custom_delete($table, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_clientorg_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>