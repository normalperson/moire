<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'role';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcrole';
$dbo->key = array('rol_id');
$dbo->sql = 'select fcrole.*,\'\' as rol_permission from fcrole';
$dbo->col = array('rol_id', 'rol_name', 'rol_permission');
$dbo->colList = array('rol_name');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array();
$dbo->colNew = array('rol_name', 'rol_permission');
$dbo->colEdit = array('rol_id', 'rol_name', 'rol_permission');
$dbo->colSearch = array('rol_name');
$dbo->colExport = array('rol_permission');
$dbo->colSort = array();
$dbo->canSearch = true;
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
$dbo->titleList = 'List Role';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Role';
$dbo->titleEdit = 'Edit Role';
$dbo->titleSearch = 'Search Role';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->detailBack = 'Back';

$dbo->cols['rol_id'] = new DBO_COL('rol_id', 'int4', '4', '-1');
$dbo->cols['rol_id']->inputTypeDefault = 'text';
$dbo->cols['rol_id']->searchMode = 'exact';
$dbo->cols['rol_id']->capContClassDefault = array();
$dbo->cols['rol_id']->valContClassDefault = array();
$dbo->cols['rol_id']->filter = array();
$dbo->cols['rol_id']->filterVal = array();
$dbo->cols['rol_id']->option->defaultMethod = 'text';
$dbo->cols['rol_id']->option->searchMethod = 'text';
$dbo->cols['rol_id']->option->listMethod = 'text';
$dbo->cols['rol_id']->option->detailMethod = 'text';
$dbo->cols['rol_id']->option->newMethod = 'text';
$dbo->cols['rol_id']->option->editMethod = 'text';
$dbo->cols['rol_code'] = new DBO_COL('rol_code', 'varchar', '-1', '16');
$dbo->cols['rol_code']->inputTypeDefault = 'text';
$dbo->cols['rol_code']->mandatoryNew = 1;
$dbo->cols['rol_code']->mandatoryEdit = 1;
$dbo->cols['rol_code']->searchMode = 'exact';
$dbo->cols['rol_code']->capContClassDefault = array();
$dbo->cols['rol_code']->valContClassDefault = array();
$dbo->cols['rol_code']->filter = array();
$dbo->cols['rol_code']->filterVal = array();
$dbo->cols['rol_code']->option->defaultMethod = 'text';
$dbo->cols['rol_code']->option->searchMethod = 'text';
$dbo->cols['rol_code']->option->listMethod = 'text';
$dbo->cols['rol_code']->option->detailMethod = 'text';
$dbo->cols['rol_code']->option->newMethod = 'text';
$dbo->cols['rol_code']->option->editMethod = 'text';
$dbo->cols['rol_desc'] = new DBO_COL('rol_desc', 'varchar', '-1', '2004');
$dbo->cols['rol_desc']->inputTypeDefault = 'text';
$dbo->cols['rol_desc']->mandatoryNew = 1;
$dbo->cols['rol_desc']->mandatoryEdit = 1;
$dbo->cols['rol_desc']->searchMode = 'exact';
$dbo->cols['rol_desc']->capContClassDefault = array();
$dbo->cols['rol_desc']->valContClassDefault = array();
$dbo->cols['rol_desc']->filter = array();
$dbo->cols['rol_desc']->filterVal = array();
$dbo->cols['rol_desc']->option->defaultMethod = 'text';
$dbo->cols['rol_desc']->option->searchMethod = 'text';
$dbo->cols['rol_desc']->option->listMethod = 'text';
$dbo->cols['rol_desc']->option->detailMethod = 'text';
$dbo->cols['rol_desc']->option->newMethod = 'text';
$dbo->cols['rol_desc']->option->editMethod = 'text';
$dbo->cols['rol_permission'] = new DBO_COL('rol_permission', 'unknown', '-2', '-1');
$dbo->cols['rol_permission']->inputTypeDefault = 'checkbox';
$dbo->cols['rol_permission']->searchMode = 'exact';
$dbo->cols['rol_permission']->capContClassDefault = array();
$dbo->cols['rol_permission']->valContClassDefault = array();
$dbo->cols['rol_permission']->filter = array();
$dbo->cols['rol_permission']->filterVal = array();
$dbo->cols['rol_permission']->option->default = 'select pms_code,pms_desc from fcpermission';
$dbo->cols['rol_permission']->option->defaultMethod = 'sql';
$dbo->cols['rol_permission']->option->searchMethod = 'text';
$dbo->cols['rol_permission']->option->listMethod = 'text';
$dbo->cols['rol_permission']->option->detailMethod = 'text';
$dbo->cols['rol_permission']->option->newMethod = 'text';
$dbo->cols['rol_permission']->option->editMethod = 'text';
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
$dbo->cols['rol_status'] = new DBO_COL('rol_status', 'varchar', '-1', '36');
$dbo->cols['rol_status']->inputTypeDefault = 'select';
$dbo->cols['rol_status']->searchMode = 'exact';
$dbo->cols['rol_status']->capContClassDefault = array();
$dbo->cols['rol_status']->valContClassDefault = array();
$dbo->cols['rol_status']->option->default = 'ACTIVE/Active
INACTIVE/Inactive';
$dbo->cols['rol_status']->option->defaultMethod = 'text';
$dbo->cols['rol_status']->option->searchMethod = 'text';
$dbo->cols['rol_status']->option->listMethod = 'text';
$dbo->cols['rol_status']->option->detailMethod = 'text';
$dbo->cols['rol_status']->option->newMethod = 'text';
$dbo->cols['rol_status']->option->editMethod = 'text';
$dbo->cols['rol_name'] = new DBO_COL('rol_name', 'varchar', '-1', '2004');
$dbo->cols['rol_name']->inputTypeDefault = 'text';
$dbo->cols['rol_name']->searchMode = 'exact';
$dbo->cols['rol_name']->capContClassDefault = array();
$dbo->cols['rol_name']->valContClassDefault = array();
$dbo->cols['rol_name']->option->defaultMethod = 'text';
$dbo->cols['rol_name']->option->searchMethod = 'text';
$dbo->cols['rol_name']->option->listMethod = 'text';
$dbo->cols['rol_name']->option->detailMethod = 'text';
$dbo->cols['rol_name']->option->newMethod = 'text';
$dbo->cols['rol_name']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_role_custom_new';
function dbo_role_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_role_custom_edit';
function dbo_role_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_role_custom_search';
function dbo_role_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_role_custom_delete';
function dbo_role_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_role_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>