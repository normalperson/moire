<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'permission';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcpermission';
$dbo->key = array('pms_code');
$dbo->sql = 'select * from fcpermission';
$dbo->col = array('pms_code', 'pms_desc');
$dbo->colList = array('pms_code', 'pms_desc');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('pms_code', 'pms_desc');
$dbo->colNew = array('pms_code', 'pms_desc');
$dbo->colEdit = array('pms_code', 'pms_desc');
$dbo->colSearch = array('pms_code', 'pms_desc');
$dbo->colExport = array('pms_code', 'pms_desc');
$dbo->colSort = array();
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
$dbo->theme = 'metro';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 50;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

$dbo->cols['pms_id'] = new DBO_COL('pms_id', 'int4', '4', '-1');
$dbo->cols['pms_id']->inputTypeDefault = 'text';
$dbo->cols['pms_id']->searchMode = 'exact';
$dbo->cols['pms_id']->capContClassDefault = array();
$dbo->cols['pms_id']->valContClassDefault = array();
$dbo->cols['pms_id']->option->defaultMethod = 'text';
$dbo->cols['pms_id']->option->searchMethod = 'text';
$dbo->cols['pms_id']->option->listMethod = 'text';
$dbo->cols['pms_id']->option->detailMethod = 'text';
$dbo->cols['pms_id']->option->newMethod = 'text';
$dbo->cols['pms_id']->option->editMethod = 'text';
$dbo->cols['pms_code'] = new DBO_COL('pms_code', 'varchar', '-1', '54');
$dbo->cols['pms_code']->inputTypeDefault = 'text';
$dbo->cols['pms_code']->searchMode = 'exact';
$dbo->cols['pms_code']->capContClassDefault = array();
$dbo->cols['pms_code']->valContClassDefault = array();
$dbo->cols['pms_code']->option->defaultMethod = 'text';
$dbo->cols['pms_code']->option->searchMethod = 'text';
$dbo->cols['pms_code']->option->listMethod = 'text';
$dbo->cols['pms_code']->option->detailMethod = 'text';
$dbo->cols['pms_code']->option->newMethod = 'text';
$dbo->cols['pms_code']->option->editMethod = 'text';
$dbo->cols['pms_desc'] = new DBO_COL('pms_desc', 'varchar', '-1', '2004');
$dbo->cols['pms_desc']->inputTypeDefault = 'text';
$dbo->cols['pms_desc']->searchMode = 'exact';
$dbo->cols['pms_desc']->capContClassDefault = array();
$dbo->cols['pms_desc']->valContClassDefault = array();
$dbo->cols['pms_desc']->option->defaultMethod = 'text';
$dbo->cols['pms_desc']->option->searchMethod = 'text';
$dbo->cols['pms_desc']->option->listMethod = 'text';
$dbo->cols['pms_desc']->option->detailMethod = 'text';
$dbo->cols['pms_desc']->option->newMethod = 'text';
$dbo->cols['pms_desc']->option->editMethod = 'text';
$dbo->cols['last_modified_date'] = new DBO_COL('last_modified_date', 'timestamptz', '8', '-1');
$dbo->cols['last_modified_date']->inputTypeDefault = 'text';
$dbo->cols['last_modified_date']->searchMode = 'exact';
$dbo->cols['last_modified_date']->capContClassDefault = array();
$dbo->cols['last_modified_date']->valContClassDefault = array();
$dbo->cols['last_modified_date']->option->defaultMethod = 'text';
$dbo->cols['last_modified_date']->option->searchMethod = 'text';
$dbo->cols['last_modified_date']->option->listMethod = 'text';
$dbo->cols['last_modified_date']->option->detailMethod = 'text';
$dbo->cols['last_modified_date']->option->newMethod = 'text';
$dbo->cols['last_modified_date']->option->editMethod = 'text';
$dbo->cols['last_synchronized_date'] = new DBO_COL('last_synchronized_date', 'timestamptz', '8', '-1');
$dbo->cols['last_synchronized_date']->inputTypeDefault = 'text';
$dbo->cols['last_synchronized_date']->searchMode = 'exact';
$dbo->cols['last_synchronized_date']->capContClassDefault = array();
$dbo->cols['last_synchronized_date']->valContClassDefault = array();
$dbo->cols['last_synchronized_date']->option->defaultMethod = 'text';
$dbo->cols['last_synchronized_date']->option->searchMethod = 'text';
$dbo->cols['last_synchronized_date']->option->listMethod = 'text';
$dbo->cols['last_synchronized_date']->option->detailMethod = 'text';
$dbo->cols['last_synchronized_date']->option->newMethod = 'text';
$dbo->cols['last_synchronized_date']->option->editMethod = 'text';
$dbo->cols['record_synchronized'] = new DBO_COL('record_synchronized', 'varchar', '-1', '5');
$dbo->cols['record_synchronized']->inputTypeDefault = 'text';
$dbo->cols['record_synchronized']->searchMode = 'exact';
$dbo->cols['record_synchronized']->capContClassDefault = array();
$dbo->cols['record_synchronized']->valContClassDefault = array();
$dbo->cols['record_synchronized']->option->defaultMethod = 'text';
$dbo->cols['record_synchronized']->option->searchMethod = 'text';
$dbo->cols['record_synchronized']->option->listMethod = 'text';
$dbo->cols['record_synchronized']->option->detailMethod = 'text';
$dbo->cols['record_synchronized']->option->newMethod = 'text';
$dbo->cols['record_synchronized']->option->editMethod = 'text';
$dbo->cols['cloud_refid'] = new DBO_COL('cloud_refid', 'int4', '4', '-1');
$dbo->cols['cloud_refid']->inputTypeDefault = 'text';
$dbo->cols['cloud_refid']->searchMode = 'exact';
$dbo->cols['cloud_refid']->capContClassDefault = array();
$dbo->cols['cloud_refid']->valContClassDefault = array();
$dbo->cols['cloud_refid']->option->defaultMethod = 'text';
$dbo->cols['cloud_refid']->option->searchMethod = 'text';
$dbo->cols['cloud_refid']->option->listMethod = 'text';
$dbo->cols['cloud_refid']->option->detailMethod = 'text';
$dbo->cols['cloud_refid']->option->newMethod = 'text';
$dbo->cols['cloud_refid']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_permission_custom_new';
function dbo_permission_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_permission_custom_edit';
function dbo_permission_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_permission_custom_search';
function dbo_permission_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_permission_custom_delete';
function dbo_permission_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_permission_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>