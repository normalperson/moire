<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'soaorg';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'fcorg';
$dbo->key = array('org_id');
$dbo->sql = 'select org_id, org_name, \'\' as button from fcorg where org_external = \'Y\'';
$dbo->col = array('org_id', 'org_name', 'button');
$dbo->colList = array('org_name', 'button');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('org_name');
$dbo->colNew = array('org_id', 'org_name');
$dbo->colEdit = array('org_id', 'org_name');
$dbo->colSearch = array('org_name');
$dbo->colExport = array('org_id', 'org_name');
$dbo->colSort = array();
$dbo->canSearch = true;
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
$dbo->theme = 'pixeladmin';
$dbo->layout = 'AlwaysList';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->defaultDateFormat = 'yyyy-mm-dd';
$dbo->defaultDateTimeFormat = 'yyyy-mm-dd hh24:min:ss';
$dbo->defaultTimeFormat = 'hh24:min:ss';
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
$dbo->cols['button'] = new DBO_COL('button', 'unknown', '-2', '-1');
$dbo->cols['button']->displayListModifier = '<button form="noform" class="btn btn-labeled btn-primary" style="min-width:85px;" onclick="window.open(\'?nosoaorg=1&orgid={org_id}\', \'\', \'width=1024,height=700\')"><span class="btn-label icon fa-file-text"></span>Statement</button>';
$dbo->cols['button']->inputTypeDefault = 'text';
$dbo->cols['button']->searchMode = 'exact';
$dbo->cols['button']->capContClassDefault = array();
$dbo->cols['button']->valContClassDefault = array();
$dbo->cols['button']->option->defaultMethod = 'text';
$dbo->cols['button']->option->searchMethod = 'text';
$dbo->cols['button']->option->listMethod = 'text';
$dbo->cols['button']->option->detailMethod = 'text';
$dbo->cols['button']->option->newMethod = 'text';
$dbo->cols['button']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_soaorg_custom_new';
function dbo_soaorg_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_soaorg_custom_edit';
function dbo_soaorg_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_soaorg_custom_search';
function dbo_soaorg_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_soaorg_custom_delete';
function dbo_soaorg_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_soaorg_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>