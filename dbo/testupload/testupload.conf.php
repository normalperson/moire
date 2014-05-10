<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'testupload';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcdoc';
$dbo->key = array();
$dbo->sql = 'select * from fcdoc';
$dbo->col = array('fd_id', 'fd_created_date', 'fd_created_by', 'fd_refid', 'fd_reftype', 'fd_description', 'fd_file_name', 'fd_file_ext', 'fd_tags', 'fd_file_size');
$dbo->colList = array('fd_file_name');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('fd_id', 'fd_created_date', 'fd_created_by', 'fd_refid', 'fd_reftype', 'fd_description', 'fd_file_name', 'fd_file_ext', 'fd_tags', 'fd_file_size');
$dbo->colNew = array('fd_file_name');
$dbo->colEdit = array('fd_id', 'fd_created_date', 'fd_created_by', 'fd_refid', 'fd_reftype', 'fd_description', 'fd_file_name', 'fd_file_ext', 'fd_tags', 'fd_file_size');
$dbo->colSearch = array('fd_id', 'fd_created_date', 'fd_created_by', 'fd_refid', 'fd_reftype', 'fd_description', 'fd_file_name', 'fd_file_ext', 'fd_tags', 'fd_file_size');
$dbo->colExport = array('fd_id', 'fd_created_date', 'fd_created_by', 'fd_refid', 'fd_reftype', 'fd_description', 'fd_file_name', 'fd_file_ext', 'fd_tags', 'fd_file_size');
$dbo->colSort = array();
$dbo->canSearch = false;
$dbo->canNew = true;
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
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

$dbo->cols['fd_id'] = new DBO_COL('fd_id', 'int4', '4', '-1');
$dbo->cols['fd_id']->inputTypeDefault = 'text';
$dbo->cols['fd_id']->searchMode = 'exact';
$dbo->cols['fd_id']->capContClassDefault = array();
$dbo->cols['fd_id']->valContClassDefault = array();
$dbo->cols['fd_id']->option->defaultMethod = 'text';
$dbo->cols['fd_id']->option->searchMethod = 'text';
$dbo->cols['fd_id']->option->listMethod = 'text';
$dbo->cols['fd_id']->option->detailMethod = 'text';
$dbo->cols['fd_id']->option->newMethod = 'text';
$dbo->cols['fd_id']->option->editMethod = 'text';
$dbo->cols['fd_created_date'] = new DBO_COL('fd_created_date', 'timestamptz', '8', '-1');
$dbo->cols['fd_created_date']->inputTypeDefault = 'text';
$dbo->cols['fd_created_date']->searchMode = 'exact';
$dbo->cols['fd_created_date']->capContClassDefault = array();
$dbo->cols['fd_created_date']->valContClassDefault = array();
$dbo->cols['fd_created_date']->option->defaultMethod = 'text';
$dbo->cols['fd_created_date']->option->searchMethod = 'text';
$dbo->cols['fd_created_date']->option->listMethod = 'text';
$dbo->cols['fd_created_date']->option->detailMethod = 'text';
$dbo->cols['fd_created_date']->option->newMethod = 'text';
$dbo->cols['fd_created_date']->option->editMethod = 'text';
$dbo->cols['fd_created_by'] = new DBO_COL('fd_created_by', 'varchar', '-1', '104');
$dbo->cols['fd_created_by']->inputTypeDefault = 'text';
$dbo->cols['fd_created_by']->searchMode = 'exact';
$dbo->cols['fd_created_by']->capContClassDefault = array();
$dbo->cols['fd_created_by']->valContClassDefault = array();
$dbo->cols['fd_created_by']->option->defaultMethod = 'text';
$dbo->cols['fd_created_by']->option->searchMethod = 'text';
$dbo->cols['fd_created_by']->option->listMethod = 'text';
$dbo->cols['fd_created_by']->option->detailMethod = 'text';
$dbo->cols['fd_created_by']->option->newMethod = 'text';
$dbo->cols['fd_created_by']->option->editMethod = 'text';
$dbo->cols['fd_refid'] = new DBO_COL('fd_refid', 'varchar', '-1', '36');
$dbo->cols['fd_refid']->inputTypeDefault = 'text';
$dbo->cols['fd_refid']->searchMode = 'exact';
$dbo->cols['fd_refid']->capContClassDefault = array();
$dbo->cols['fd_refid']->valContClassDefault = array();
$dbo->cols['fd_refid']->option->defaultMethod = 'text';
$dbo->cols['fd_refid']->option->searchMethod = 'text';
$dbo->cols['fd_refid']->option->listMethod = 'text';
$dbo->cols['fd_refid']->option->detailMethod = 'text';
$dbo->cols['fd_refid']->option->newMethod = 'text';
$dbo->cols['fd_refid']->option->editMethod = 'text';
$dbo->cols['fd_reftype'] = new DBO_COL('fd_reftype', 'varchar', '-1', '104');
$dbo->cols['fd_reftype']->inputTypeDefault = 'text';
$dbo->cols['fd_reftype']->searchMode = 'exact';
$dbo->cols['fd_reftype']->capContClassDefault = array();
$dbo->cols['fd_reftype']->valContClassDefault = array();
$dbo->cols['fd_reftype']->option->defaultMethod = 'text';
$dbo->cols['fd_reftype']->option->searchMethod = 'text';
$dbo->cols['fd_reftype']->option->listMethod = 'text';
$dbo->cols['fd_reftype']->option->detailMethod = 'text';
$dbo->cols['fd_reftype']->option->newMethod = 'text';
$dbo->cols['fd_reftype']->option->editMethod = 'text';
$dbo->cols['fd_description'] = new DBO_COL('fd_description', 'varchar', '-1', '1004');
$dbo->cols['fd_description']->inputTypeDefault = 'text';
$dbo->cols['fd_description']->searchMode = 'exact';
$dbo->cols['fd_description']->capContClassDefault = array();
$dbo->cols['fd_description']->valContClassDefault = array();
$dbo->cols['fd_description']->option->defaultMethod = 'text';
$dbo->cols['fd_description']->option->searchMethod = 'text';
$dbo->cols['fd_description']->option->listMethod = 'text';
$dbo->cols['fd_description']->option->detailMethod = 'text';
$dbo->cols['fd_description']->option->newMethod = 'text';
$dbo->cols['fd_description']->option->editMethod = 'text';
$dbo->cols['fd_file_name'] = new DBO_COL('fd_file_name', 'varchar', '-1', '204');
$dbo->cols['fd_file_name']->inputTypeDefault = 'file';
$dbo->cols['fd_file_name']->searchMode = 'exact';
$dbo->cols['fd_file_name']->capContClassDefault = array();
$dbo->cols['fd_file_name']->valContClassDefault = array();
$dbo->cols['fd_file_name']->option->defaultMethod = 'text';
$dbo->cols['fd_file_name']->option->searchMethod = 'text';
$dbo->cols['fd_file_name']->option->listMethod = 'text';
$dbo->cols['fd_file_name']->option->detailMethod = 'text';
$dbo->cols['fd_file_name']->option->newMethod = 'text';
$dbo->cols['fd_file_name']->option->editMethod = 'text';
$dbo->cols['fd_file_ext'] = new DBO_COL('fd_file_ext', 'varchar', '-1', '36');
$dbo->cols['fd_file_ext']->inputTypeDefault = 'text';
$dbo->cols['fd_file_ext']->searchMode = 'exact';
$dbo->cols['fd_file_ext']->capContClassDefault = array();
$dbo->cols['fd_file_ext']->valContClassDefault = array();
$dbo->cols['fd_file_ext']->option->defaultMethod = 'text';
$dbo->cols['fd_file_ext']->option->searchMethod = 'text';
$dbo->cols['fd_file_ext']->option->listMethod = 'text';
$dbo->cols['fd_file_ext']->option->detailMethod = 'text';
$dbo->cols['fd_file_ext']->option->newMethod = 'text';
$dbo->cols['fd_file_ext']->option->editMethod = 'text';
$dbo->cols['fd_tags'] = new DBO_COL('fd_tags', 'varchar', '-1', '504');
$dbo->cols['fd_tags']->inputTypeDefault = 'text';
$dbo->cols['fd_tags']->searchMode = 'exact';
$dbo->cols['fd_tags']->capContClassDefault = array();
$dbo->cols['fd_tags']->valContClassDefault = array();
$dbo->cols['fd_tags']->option->defaultMethod = 'text';
$dbo->cols['fd_tags']->option->searchMethod = 'text';
$dbo->cols['fd_tags']->option->listMethod = 'text';
$dbo->cols['fd_tags']->option->detailMethod = 'text';
$dbo->cols['fd_tags']->option->newMethod = 'text';
$dbo->cols['fd_tags']->option->editMethod = 'text';
$dbo->cols['fd_file_size'] = new DBO_COL('fd_file_size', 'numeric', '-1', '1310728');
$dbo->cols['fd_file_size']->inputTypeDefault = 'text';
$dbo->cols['fd_file_size']->searchMode = 'exact';
$dbo->cols['fd_file_size']->capContClassDefault = array();
$dbo->cols['fd_file_size']->valContClassDefault = array();
$dbo->cols['fd_file_size']->option->defaultMethod = 'text';
$dbo->cols['fd_file_size']->option->searchMethod = 'text';
$dbo->cols['fd_file_size']->option->listMethod = 'text';
$dbo->cols['fd_file_size']->option->detailMethod = 'text';
$dbo->cols['fd_file_size']->option->newMethod = 'text';
$dbo->cols['fd_file_size']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_testupload_custom_new';
function dbo_testupload_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_testupload_custom_edit';
function dbo_testupload_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_testupload_custom_search';
function dbo_testupload_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_testupload_custom_delete';
function dbo_testupload_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_testupload_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>