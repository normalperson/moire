<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'locale_setup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fclocale';
$dbo->key = array('lc_code');
$dbo->sql = 'select * from fclocale';
$dbo->col = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colList = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colNew = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colEdit = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colSearch = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colExport = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colSort = array();
$dbo->canSearch = false;
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
$dbo->titleList = 'List Locale';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Locale';
$dbo->titleEdit = 'Edit Locale';
$dbo->titleSearch = 'Search Locale';
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
$dbo->newSubmit = 'Save';

$dbo->cols['lc_code'] = new DBO_COL('lc_code', 'varchar', '-1', '36');
$dbo->cols['lc_code']->inputTypeDefault = 'text';
$dbo->cols['lc_code']->searchMode = 'exact';
$dbo->cols['lc_code']->capContClassDefault = array();
$dbo->cols['lc_code']->valContClassDefault = array();
$dbo->cols['lc_code']->option->defaultMethod = 'text';
$dbo->cols['lc_code']->option->searchMethod = 'text';
$dbo->cols['lc_code']->option->listMethod = 'text';
$dbo->cols['lc_code']->option->detailMethod = 'text';
$dbo->cols['lc_code']->option->newMethod = 'text';
$dbo->cols['lc_code']->option->editMethod = 'text';
$dbo->cols['lc_description'] = new DBO_COL('lc_description', 'varchar', '-1', '104');
$dbo->cols['lc_description']->inputTypeDefault = 'text';
$dbo->cols['lc_description']->searchMode = 'exact';
$dbo->cols['lc_description']->capContClassDefault = array();
$dbo->cols['lc_description']->valContClassDefault = array();
$dbo->cols['lc_description']->option->defaultMethod = 'text';
$dbo->cols['lc_description']->option->searchMethod = 'text';
$dbo->cols['lc_description']->option->listMethod = 'text';
$dbo->cols['lc_description']->option->detailMethod = 'text';
$dbo->cols['lc_description']->option->newMethod = 'text';
$dbo->cols['lc_description']->option->editMethod = 'text';
$dbo->cols['lc_primary_langcode'] = new DBO_COL('lc_primary_langcode', 'varchar', '-1', '9');
$dbo->cols['lc_primary_langcode']->inputTypeDefault = 'Select2';
$dbo->cols['lc_primary_langcode']->searchMode = 'exact';
$dbo->cols['lc_primary_langcode']->capContClassDefault = array();
$dbo->cols['lc_primary_langcode']->valContClassDefault = array();
$dbo->cols['lc_primary_langcode']->option->default = 'select lang_code, lang_name from fclang where lang_status=\'ACTIVE\' order by lang_name';
$dbo->cols['lc_primary_langcode']->option->defaultMethod = 'sql';
$dbo->cols['lc_primary_langcode']->option->searchMethod = 'text';
$dbo->cols['lc_primary_langcode']->option->listMethod = 'text';
$dbo->cols['lc_primary_langcode']->option->detailMethod = 'text';
$dbo->cols['lc_primary_langcode']->option->newMethod = 'text';
$dbo->cols['lc_primary_langcode']->option->editMethod = 'text';
$dbo->cols['lc_tzcode'] = new DBO_COL('lc_tzcode', 'varchar', '-1', '104');
$dbo->cols['lc_tzcode']->inputTypeDefault = 'Select2';
$dbo->cols['lc_tzcode']->searchMode = 'exact';
$dbo->cols['lc_tzcode']->capContClassDefault = array();
$dbo->cols['lc_tzcode']->valContClassDefault = array();
$dbo->cols['lc_tzcode']->option->defaultMethod = 'text';
$dbo->cols['lc_tzcode']->option->searchMethod = 'text';
$dbo->cols['lc_tzcode']->option->listMethod = 'text';
$dbo->cols['lc_tzcode']->option->detailMethod = 'text';
$dbo->cols['lc_tzcode']->option->newMethod = 'text';
$dbo->cols['lc_tzcode']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_locale_setup_custom_new';
function dbo_locale_setup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_locale_setup_custom_edit';
function dbo_locale_setup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_locale_setup_custom_search';
function dbo_locale_setup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_locale_setup_custom_delete';
function dbo_locale_setup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_locale_setup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>