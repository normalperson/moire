<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'customersetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcorg';
$dbo->key = array('org_id');
$dbo->sql = 'select * from fcorg';
$dbo->col = array('org_id', 'org_type', 'org_external', 'org_name', 'org_parentid', 'org_primaryid', 'org_address', 'org_contactno', 'org_status');
$dbo->colList = array('org_type', 'org_external', 'org_name', 'org_parentid');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('org_type', 'org_external', 'org_name', 'org_parentid');
$dbo->colNew = array('org_type', 'org_external', 'org_name', 'org_parentid');
$dbo->colEdit = array('org_type', 'org_external', 'org_name', 'org_parentid');
$dbo->colSearch = array('org_id', 'org_type', 'org_external', 'org_name', 'org_parentid', 'org_primaryid', 'org_address', 'org_contactno', 'org_status');
$dbo->colExport = array('org_type', 'org_external', 'org_name', 'org_parentid');
$dbo->colSort = array();
$dbo->canSearch = false;
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
$dbo->theme = 'metro';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

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
$dbo->cols['org_type'] = new DBO_COL('org_type', 'varchar', '-1', '36');
$dbo->cols['org_type']->inputTypeDefault = 'text';
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
$dbo->cols['org_external']->inputTypeDefault = 'text';
$dbo->cols['org_external']->searchMode = 'exact';
$dbo->cols['org_external']->capContClassDefault = array();
$dbo->cols['org_external']->valContClassDefault = array();
$dbo->cols['org_external']->option->defaultMethod = 'text';
$dbo->cols['org_external']->option->searchMethod = 'text';
$dbo->cols['org_external']->option->listMethod = 'text';
$dbo->cols['org_external']->option->detailMethod = 'text';
$dbo->cols['org_external']->option->newMethod = 'text';
$dbo->cols['org_external']->option->editMethod = 'text';
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
$dbo->cols['org_parentid'] = new DBO_COL('org_parentid', 'int4', '4', '-1');
$dbo->cols['org_parentid']->inputTypeDefault = 'text';
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
$dbo->cols['org_status']->inputTypeDefault = 'text';
$dbo->cols['org_status']->searchMode = 'exact';
$dbo->cols['org_status']->capContClassDefault = array();
$dbo->cols['org_status']->valContClassDefault = array();
$dbo->cols['org_status']->option->defaultMethod = 'text';
$dbo->cols['org_status']->option->searchMethod = 'text';
$dbo->cols['org_status']->option->listMethod = 'text';
$dbo->cols['org_status']->option->detailMethod = 'text';
$dbo->cols['org_status']->option->newMethod = 'text';
$dbo->cols['org_status']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_customersetup_custom_new';
function dbo_customersetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_customersetup_custom_edit';
function dbo_customersetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_customersetup_custom_search';
function dbo_customersetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_customersetup_custom_delete';
function dbo_customersetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_customersetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>