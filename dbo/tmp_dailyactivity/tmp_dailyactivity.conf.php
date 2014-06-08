<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'tmp_dailyactivity';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'tmp_dailyactivity';
$dbo->key = array('tmp_id');
$dbo->sql = 'select * from tmp_dailyactivity';
$dbo->col = array('tmp_userid', 'tmp_date', 'tmp_time', 'tmp_activity', 'tmp_id');
$dbo->colList = array('tmp_userid', 'tmp_date', 'tmp_time', 'tmp_activity');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('tmp_userid', 'tmp_date', 'tmp_time', 'tmp_activity');
$dbo->colNew = array('tmp_userid', 'tmp_date', 'tmp_time', 'tmp_activity');
$dbo->colEdit = array('tmp_userid', 'tmp_date', 'tmp_time', 'tmp_activity');
$dbo->colSearch = array('tmp_userid', 'tmp_date', 'tmp_time', 'tmp_activity');
$dbo->colExport = array('tmp_userid', 'tmp_date', 'tmp_time', 'tmp_activity');
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
$dbo->titleList = 'Daily user activity';
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

$dbo->cols['tmp_userid'] = new DBO_COL('tmp_userid', 'varchar', '-1', '104');
$dbo->cols['tmp_userid']->inputTypeDefault = 'text';
$dbo->cols['tmp_userid']->searchMode = 'exact';
$dbo->cols['tmp_userid']->capContClassDefault = array();
$dbo->cols['tmp_userid']->valContClassDefault = array();
$dbo->cols['tmp_userid']->option->defaultMethod = 'text';
$dbo->cols['tmp_userid']->option->searchMethod = 'text';
$dbo->cols['tmp_userid']->option->listMethod = 'text';
$dbo->cols['tmp_userid']->option->detailMethod = 'text';
$dbo->cols['tmp_userid']->option->newMethod = 'text';
$dbo->cols['tmp_userid']->option->editMethod = 'text';
$dbo->cols['tmp_date'] = new DBO_COL('tmp_date', 'varchar', '-1', '104');
$dbo->cols['tmp_date']->inputTypeDefault = 'text';
$dbo->cols['tmp_date']->searchMode = 'exact';
$dbo->cols['tmp_date']->capContClassDefault = array();
$dbo->cols['tmp_date']->valContClassDefault = array();
$dbo->cols['tmp_date']->option->defaultMethod = 'text';
$dbo->cols['tmp_date']->option->searchMethod = 'text';
$dbo->cols['tmp_date']->option->listMethod = 'text';
$dbo->cols['tmp_date']->option->detailMethod = 'text';
$dbo->cols['tmp_date']->option->newMethod = 'text';
$dbo->cols['tmp_date']->option->editMethod = 'text';
$dbo->cols['tmp_time'] = new DBO_COL('tmp_time', 'varchar', '-1', '104');
$dbo->cols['tmp_time']->inputTypeDefault = 'text';
$dbo->cols['tmp_time']->searchMode = 'exact';
$dbo->cols['tmp_time']->capContClassDefault = array();
$dbo->cols['tmp_time']->valContClassDefault = array();
$dbo->cols['tmp_time']->option->defaultMethod = 'text';
$dbo->cols['tmp_time']->option->searchMethod = 'text';
$dbo->cols['tmp_time']->option->listMethod = 'text';
$dbo->cols['tmp_time']->option->detailMethod = 'text';
$dbo->cols['tmp_time']->option->newMethod = 'text';
$dbo->cols['tmp_time']->option->editMethod = 'text';
$dbo->cols['tmp_activity'] = new DBO_COL('tmp_activity', 'varchar', '-1', '104');
$dbo->cols['tmp_activity']->inputTypeDefault = 'text';
$dbo->cols['tmp_activity']->searchMode = 'exact';
$dbo->cols['tmp_activity']->capContClassDefault = array();
$dbo->cols['tmp_activity']->valContClassDefault = array();
$dbo->cols['tmp_activity']->option->defaultMethod = 'text';
$dbo->cols['tmp_activity']->option->searchMethod = 'text';
$dbo->cols['tmp_activity']->option->listMethod = 'text';
$dbo->cols['tmp_activity']->option->detailMethod = 'text';
$dbo->cols['tmp_activity']->option->newMethod = 'text';
$dbo->cols['tmp_activity']->option->editMethod = 'text';
$dbo->cols['tmp_id'] = new DBO_COL('tmp_id', 'int4', '4', '-1');
$dbo->cols['tmp_id']->inputTypeDefault = 'text';
$dbo->cols['tmp_id']->searchMode = 'exact';
$dbo->cols['tmp_id']->capContClassDefault = array();
$dbo->cols['tmp_id']->valContClassDefault = array();
$dbo->cols['tmp_id']->option->defaultMethod = 'text';
$dbo->cols['tmp_id']->option->searchMethod = 'text';
$dbo->cols['tmp_id']->option->listMethod = 'text';
$dbo->cols['tmp_id']->option->detailMethod = 'text';
$dbo->cols['tmp_id']->option->newMethod = 'text';
$dbo->cols['tmp_id']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_tmp_dailyactivity_custom_new';
function dbo_tmp_dailyactivity_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_tmp_dailyactivity_custom_edit';
function dbo_tmp_dailyactivity_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_tmp_dailyactivity_custom_search';
function dbo_tmp_dailyactivity_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_tmp_dailyactivity_custom_delete';
function dbo_tmp_dailyactivity_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_tmp_dailyactivity_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>