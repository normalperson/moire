<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'table_setup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'htable';
$dbo->key = array('ht_id');
$dbo->sql = 'select * from htable';
$dbo->col = array('ht_id', 'ht_tablename', 'ht_seq', 'ht_secid');
$dbo->colList = array('ht_tablename', 'ht_secid', 'ht_seq');
$dbo->colDetail = array('ht_tablename', 'ht_secid', 'ht_seq');
$dbo->colNew = array('ht_tablename', 'ht_secid', 'ht_seq');
$dbo->colEdit = array('ht_tablename', 'ht_secid', 'ht_seq');
$dbo->colSearch = array('ht_tablename', 'ht_secid');
$dbo->colExport = array('ht_tablename', 'ht_secid', 'ht_seq');
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
$dbo->theme = 'blacktie';
$dbo->layout = 'One';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-GB';
$dbo->render = array();
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

$dbo->cols['ht_id'] = new DBO_COL('ht_id', 'LONG', '11', '0');
$dbo->cols['ht_id']->inputTypeDefault = 'text';
$dbo->cols['ht_id']->searchMode = 'exact';
$dbo->cols['ht_id']->capContClassDefault = array();
$dbo->cols['ht_id']->valContClassDefault = array();
$dbo->cols['ht_id']->option->defaultMethod = 'text';
$dbo->cols['ht_id']->option->searchMethod = 'text';
$dbo->cols['ht_id']->option->listMethod = 'text';
$dbo->cols['ht_id']->option->detailMethod = 'text';
$dbo->cols['ht_id']->option->newMethod = 'text';
$dbo->cols['ht_id']->option->editMethod = 'text';
$dbo->cols['ht_tablename'] = new DBO_COL('ht_tablename', 'VAR_STRING', '150', '0');
$dbo->cols['ht_tablename']->inputTypeDefault = 'text';
$dbo->cols['ht_tablename']->searchMode = 'exact';
$dbo->cols['ht_tablename']->capContClassDefault = array();
$dbo->cols['ht_tablename']->valContClassDefault = array();
$dbo->cols['ht_tablename']->option->defaultMethod = 'text';
$dbo->cols['ht_tablename']->option->searchMethod = 'text';
$dbo->cols['ht_tablename']->option->listMethod = 'text';
$dbo->cols['ht_tablename']->option->detailMethod = 'text';
$dbo->cols['ht_tablename']->option->newMethod = 'text';
$dbo->cols['ht_tablename']->option->editMethod = 'text';
$dbo->cols['ht_seq'] = new DBO_COL('ht_seq', 'LONG', '11', '0');
$dbo->cols['ht_seq']->inputTypeDefault = 'text';
$dbo->cols['ht_seq']->searchMode = 'exact';
$dbo->cols['ht_seq']->capContClassDefault = array();
$dbo->cols['ht_seq']->valContClassDefault = array();
$dbo->cols['ht_seq']->option->defaultMethod = 'text';
$dbo->cols['ht_seq']->option->searchMethod = 'text';
$dbo->cols['ht_seq']->option->listMethod = 'text';
$dbo->cols['ht_seq']->option->detailMethod = 'text';
$dbo->cols['ht_seq']->option->newMethod = 'text';
$dbo->cols['ht_seq']->option->editMethod = 'text';
$dbo->cols['ht_secid'] = new DBO_COL('ht_secid', 'LONG', '11', '0');
$dbo->cols['ht_secid']->inputTypeDefault = 'select';
$dbo->cols['ht_secid']->searchMode = 'exact';
$dbo->cols['ht_secid']->capContClassDefault = array();
$dbo->cols['ht_secid']->valContClassDefault = array();
$dbo->cols['ht_secid']->option->default = 'select sec_id,sec_name from htablesection order by sec_seq';
$dbo->cols['ht_secid']->option->defaultMethod = 'sql';
$dbo->cols['ht_secid']->option->searchMethod = 'text';
$dbo->cols['ht_secid']->option->listMethod = 'text';
$dbo->cols['ht_secid']->option->detailMethod = 'text';
$dbo->cols['ht_secid']->option->newMethod = 'text';
$dbo->cols['ht_secid']->option->editMethod = 'text';

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
$dbo->newModifier = 'table_setup_custom_new';
function table_setup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'table_setup_custom_edit';
function table_setup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'table_setup_custom_search';
function table_setup_custom_search(&$search){
}

$dbo->deleteModifier = 'table_setup_custom_delete';
function table_setup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function table_setup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>