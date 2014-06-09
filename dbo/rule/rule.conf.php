<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'rule';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcrule';
$dbo->key = array('ru_id');
$dbo->sql = 'select * from fcrule order by ru_name';
$dbo->col = array('ru_id', 'ru_name', 'ru_true_msg', 'ru_false_msg', 'ru_data');
$dbo->colList = array('ru_id', 'ru_name', 'ru_true_msg', 'ru_false_msg');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('ru_id', 'ru_name', 'ru_true_msg', 'ru_false_msg', 'ru_data');
$dbo->colNew = array('ru_name', 'ru_true_msg', 'ru_false_msg', 'ru_data');
$dbo->colEdit = array('ru_name', 'ru_true_msg', 'ru_false_msg', 'ru_data');
$dbo->colSearch = array('ru_name', 'ru_true_msg', 'ru_false_msg', 'ru_data');
$dbo->colExport = array('ru_id', 'ru_name', 'ru_true_msg', 'ru_false_msg', 'ru_data');
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
$dbo->titleList = 'List Rule';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Rule';
$dbo->titleEdit = 'Edit Rule';
$dbo->titleSearch = 'Search Rule';
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
$dbo->editSubmit = 'Edit';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['ru_id'] = new DBO_COL('ru_id', 'int4', '4', '-1');
$dbo->cols['ru_id']->inputTypeDefault = 'text';
$dbo->cols['ru_id']->searchMode = 'exact';
$dbo->cols['ru_id']->capContClassDefault = array();
$dbo->cols['ru_id']->valContClassDefault = array();
$dbo->cols['ru_id']->option->defaultMethod = 'text';
$dbo->cols['ru_id']->option->searchMethod = 'text';
$dbo->cols['ru_id']->option->listMethod = 'text';
$dbo->cols['ru_id']->option->detailMethod = 'text';
$dbo->cols['ru_id']->option->newMethod = 'text';
$dbo->cols['ru_id']->option->editMethod = 'text';
$dbo->cols['ru_name'] = new DBO_COL('ru_name', 'varchar', '-1', '104');
$dbo->cols['ru_name']->inputTypeDefault = 'text';
$dbo->cols['ru_name']->searchMode = 'exact';
$dbo->cols['ru_name']->capContClassDefault = array();
$dbo->cols['ru_name']->valContClassDefault = array();
$dbo->cols['ru_name']->option->defaultMethod = 'text';
$dbo->cols['ru_name']->option->searchMethod = 'text';
$dbo->cols['ru_name']->option->listMethod = 'text';
$dbo->cols['ru_name']->option->detailMethod = 'text';
$dbo->cols['ru_name']->option->newMethod = 'text';
$dbo->cols['ru_name']->option->editMethod = 'text';
$dbo->cols['ru_true_msg'] = new DBO_COL('ru_true_msg', 'varchar', '-1', '204');
$dbo->cols['ru_true_msg']->inputTypeDefault = 'text';
$dbo->cols['ru_true_msg']->searchMode = 'exact';
$dbo->cols['ru_true_msg']->capContClassDefault = array();
$dbo->cols['ru_true_msg']->valContClassDefault = array();
$dbo->cols['ru_true_msg']->option->defaultMethod = 'text';
$dbo->cols['ru_true_msg']->option->searchMethod = 'text';
$dbo->cols['ru_true_msg']->option->listMethod = 'text';
$dbo->cols['ru_true_msg']->option->detailMethod = 'text';
$dbo->cols['ru_true_msg']->option->newMethod = 'text';
$dbo->cols['ru_true_msg']->option->editMethod = 'text';
$dbo->cols['ru_false_msg'] = new DBO_COL('ru_false_msg', 'varchar', '-1', '204');
$dbo->cols['ru_false_msg']->inputTypeDefault = 'text';
$dbo->cols['ru_false_msg']->searchMode = 'exact';
$dbo->cols['ru_false_msg']->capContClassDefault = array();
$dbo->cols['ru_false_msg']->valContClassDefault = array();
$dbo->cols['ru_false_msg']->option->defaultMethod = 'text';
$dbo->cols['ru_false_msg']->option->searchMethod = 'text';
$dbo->cols['ru_false_msg']->option->listMethod = 'text';
$dbo->cols['ru_false_msg']->option->detailMethod = 'text';
$dbo->cols['ru_false_msg']->option->newMethod = 'text';
$dbo->cols['ru_false_msg']->option->editMethod = 'text';
$dbo->cols['ru_data'] = new DBO_COL('ru_data', 'varchar', '-1', '4004');
$dbo->cols['ru_data']->inputNewModifierMethod = 'phpfunc';
$dbo->cols['ru_data']->inputEditModifierMethod = 'phpfunc';
$dbo->cols['ru_data']->inputNewModifier = 'showRuleEditor';
$dbo->cols['ru_data']->inputEditModifier = 'showRuleEditor';
$dbo->cols['ru_data']->inputTypeDefault = 'text';
$dbo->cols['ru_data']->searchMode = 'exact';
$dbo->cols['ru_data']->capContClassDefault = array();
$dbo->cols['ru_data']->valContClassDefault = array();
$dbo->cols['ru_data']->option->defaultMethod = 'text';
$dbo->cols['ru_data']->option->searchMethod = 'text';
$dbo->cols['ru_data']->option->listMethod = 'text';
$dbo->cols['ru_data']->option->detailMethod = 'text';
$dbo->cols['ru_data']->option->newMethod = 'text';
$dbo->cols['ru_data']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_rule_custom_new';
function dbo_rule_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_rule_custom_edit';
function dbo_rule_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_rule_custom_search';
function dbo_rule_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_rule_custom_delete';
function dbo_rule_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_rule_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>