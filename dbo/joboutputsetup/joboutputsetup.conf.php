<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'joboutputsetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'mjoboutputlookup';
$dbo->key = array('jol_id');
$dbo->sql = 'select * from mjoboutputlookup order by 1';
$dbo->col = array('jol_id', 'jol_title', 'jol_requiredtime', 'jol_status');
$dbo->colList = array('jol_title', 'jol_requiredtime', 'jol_status');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('jol_id', 'jol_title', 'jol_requiredtime', 'jol_status');
$dbo->colNew = array('jol_title', 'jol_requiredtime', 'jol_status');
$dbo->colEdit = array('jol_title', 'jol_requiredtime', 'jol_status');
$dbo->colSearch = array('jol_id', 'jol_title', 'jol_requiredtime', 'jol_status');
$dbo->colExport = array('jol_id', 'jol_title', 'jol_requiredtime', 'jol_status');
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
$dbo->titleList = 'List Job Output';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Job Output';
$dbo->titleEdit = 'Edit Job Output';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->detailBack = 'Back';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Save';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

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
$dbo->cols['jol_title']->mandatoryNew = 1;
$dbo->cols['jol_title']->mandatoryEdit = 1;
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
$dbo->cols['jol_requiredtime']->mandatoryNew = 1;
$dbo->cols['jol_requiredtime']->mandatoryEdit = 1;
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
$dbo->cols['jol_status']->mandatoryNew = 1;
$dbo->cols['jol_status']->mandatoryEdit = 1;
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