<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'tnc_setup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'mtnc';
$dbo->key = array('tc_id');
$dbo->sql = 'select * from mtnc';
$dbo->col = array('tc_id', 'tc_text');
$dbo->colList = array('tc_id', 'tc_text');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('tc_id', 'tc_text');
$dbo->colNew = array('tc_id', 'tc_text');
$dbo->colEdit = array('tc_text');
$dbo->colSearch = array('tc_id', 'tc_text');
$dbo->colExport = array('tc_id', 'tc_text');
$dbo->colSort = array();
$dbo->canSearch = false;
$dbo->canNew = false;
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
$dbo->titleEdit = 'Terms and Conditions';
$dbo->titleSearch = 'Search Record';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'edit';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->detailBack = 'Back';
$dbo->editSubmit = 'Save Change';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['tc_id'] = new DBO_COL('tc_id', 'int4', '4', '-1');
$dbo->cols['tc_id']->inputTypeDefault = 'text';
$dbo->cols['tc_id']->searchMode = 'exact';
$dbo->cols['tc_id']->capContClassDefault = array();
$dbo->cols['tc_id']->valContClassDefault = array();
$dbo->cols['tc_id']->option->defaultMethod = 'text';
$dbo->cols['tc_id']->option->searchMethod = 'text';
$dbo->cols['tc_id']->option->listMethod = 'text';
$dbo->cols['tc_id']->option->detailMethod = 'text';
$dbo->cols['tc_id']->option->newMethod = 'text';
$dbo->cols['tc_id']->option->editMethod = 'text';
$dbo->cols['tc_text'] = new DBO_COL('tc_text', 'text', '-1', '-1');
$dbo->cols['tc_text']->inputTypeDefault = 'Summernote_WYSIWYG';
$dbo->cols['tc_text']->size = 500;
$dbo->cols['tc_text']->searchMode = 'exact';
$dbo->cols['tc_text']->capContClassDefault = array();
$dbo->cols['tc_text']->valContClassDefault = array();
$dbo->cols['tc_text']->option->defaultMethod = 'text';
$dbo->cols['tc_text']->option->searchMethod = 'text';
$dbo->cols['tc_text']->option->listMethod = 'text';
$dbo->cols['tc_text']->option->detailMethod = 'text';
$dbo->cols['tc_text']->option->newMethod = 'text';
$dbo->cols['tc_text']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_tnc_setup_custom_new';
function dbo_tnc_setup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_tnc_setup_custom_edit';
function dbo_tnc_setup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_tnc_setup_custom_search';
function dbo_tnc_setup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_tnc_setup_custom_delete';
function dbo_tnc_setup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_tnc_setup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>