<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'cartonsetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mcarton';
$dbo->key = array('car_id');
$dbo->sql = 'select a.*, car_id as "__map_mcartonvariable__carv_carid__",
null as "__map_mcartonvariable__carv_code__", 
null as "__map_mcartonvariable__carv_unit__",
\'\' as file
from mcarton a';
$dbo->col = array('car_id', 'car_name', '__map_mcartonvariable__carv_carid__', '__map_mcartonvariable__carv_code__', '__map_mcartonvariable__carv_unit__', 'file');
$dbo->colList = array('car_name');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('car_id', 'car_name', '__map_mcartonvariable__carv_carid__', '__map_mcartonvariable__carv_code__', '__map_mcartonvariable__carv_unit__', 'file');
$dbo->colNew = array('car_name', 'file', '__map_mcartonvariable__carv_carid__');
$dbo->colEdit = array('car_name', '__map_mcartonvariable__carv_carid__');
$dbo->colSearch = array('car_id', 'car_name', '__map_mcartonvariable__carv_carid__', '__map_mcartonvariable__carv_code__', '__map_mcartonvariable__carv_unit__', 'file');
$dbo->colExport = array('car_id', 'car_name', '__map_mcartonvariable__carv_carid__', '__map_mcartonvariable__carv_code__', '__map_mcartonvariable__carv_unit__', 'file');
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
$dbo->listEditSubmit = 'Submit';

$dbo->cols['car_id'] = new DBO_COL('car_id', 'int4', '4', '-1');
$dbo->cols['car_id']->inputTypeDefault = 'text';
$dbo->cols['car_id']->searchMode = 'exact';
$dbo->cols['car_id']->capContClassDefault = array();
$dbo->cols['car_id']->valContClassDefault = array();
$dbo->cols['car_id']->option->defaultMethod = 'text';
$dbo->cols['car_id']->option->searchMethod = 'text';
$dbo->cols['car_id']->option->listMethod = 'text';
$dbo->cols['car_id']->option->detailMethod = 'text';
$dbo->cols['car_id']->option->newMethod = 'text';
$dbo->cols['car_id']->option->editMethod = 'text';
$dbo->cols['car_name'] = new DBO_COL('car_name', 'varchar', '-1', '204');
$dbo->cols['car_name']->inputTypeDefault = 'text';
$dbo->cols['car_name']->searchMode = 'exact';
$dbo->cols['car_name']->capContClassDefault = array();
$dbo->cols['car_name']->valContClassDefault = array();
$dbo->cols['car_name']->option->defaultMethod = 'text';
$dbo->cols['car_name']->option->searchMethod = 'text';
$dbo->cols['car_name']->option->listMethod = 'text';
$dbo->cols['car_name']->option->detailMethod = 'text';
$dbo->cols['car_name']->option->newMethod = 'text';
$dbo->cols['car_name']->option->editMethod = 'text';
$dbo->cols['car_fileextension'] = new DBO_COL('car_fileextension', 'varchar', '-1', '54');
$dbo->cols['car_fileextension']->inputTypeDefault = 'text';
$dbo->cols['car_fileextension']->searchMode = 'exact';
$dbo->cols['car_fileextension']->capContClassDefault = array();
$dbo->cols['car_fileextension']->valContClassDefault = array();
$dbo->cols['car_fileextension']->option->defaultMethod = 'text';
$dbo->cols['car_fileextension']->option->searchMethod = 'text';
$dbo->cols['car_fileextension']->option->listMethod = 'text';
$dbo->cols['car_fileextension']->option->detailMethod = 'text';
$dbo->cols['car_fileextension']->option->newMethod = 'text';
$dbo->cols['car_fileextension']->option->editMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_carid__'] = new DBO_COL('__map_mcartonvariable__carv_carid__', 'int4', '4', '-1');
$dbo->cols['__map_mcartonvariable__carv_carid__']->inputNewModifierMethod = 'phpfunc';
$dbo->cols['__map_mcartonvariable__carv_carid__']->inputEditModifierMethod = 'phpfunc';
$dbo->cols['__map_mcartonvariable__carv_carid__']->inputNewModifier = 'genDetailTableInput';
$dbo->cols['__map_mcartonvariable__carv_carid__']->inputEditModifier = 'genDetailTableInput';
$dbo->cols['__map_mcartonvariable__carv_carid__']->inputTypeDefault = 'text';
$dbo->cols['__map_mcartonvariable__carv_carid__']->searchMode = 'exact';
$dbo->cols['__map_mcartonvariable__carv_carid__']->capContClassDefault = array();
$dbo->cols['__map_mcartonvariable__carv_carid__']->valContClassDefault = array();
$dbo->cols['__map_mcartonvariable__carv_carid__']->option->defaultMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_carid__']->option->searchMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_carid__']->option->listMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_carid__']->option->detailMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_carid__']->option->newMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_carid__']->option->editMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_code__'] = new DBO_COL('__map_mcartonvariable__carv_code__', 'unknown', '-2', '-1');
$dbo->cols['__map_mcartonvariable__carv_code__']->inputTypeDefault = 'text';
$dbo->cols['__map_mcartonvariable__carv_code__']->searchMode = 'exact';
$dbo->cols['__map_mcartonvariable__carv_code__']->capContClassDefault = array();
$dbo->cols['__map_mcartonvariable__carv_code__']->valContClassDefault = array();
$dbo->cols['__map_mcartonvariable__carv_code__']->option->defaultMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_code__']->option->searchMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_code__']->option->listMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_code__']->option->detailMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_code__']->option->newMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_code__']->option->editMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_unit__'] = new DBO_COL('__map_mcartonvariable__carv_unit__', 'unknown', '-2', '-1');
$dbo->cols['__map_mcartonvariable__carv_unit__']->defaultNewValueMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_unit__']->defaultNewValue = 'mm';
$dbo->cols['__map_mcartonvariable__carv_unit__']->inputTypeDefault = 'select';
$dbo->cols['__map_mcartonvariable__carv_unit__']->searchMode = 'exact';
$dbo->cols['__map_mcartonvariable__carv_unit__']->capContClassDefault = array();
$dbo->cols['__map_mcartonvariable__carv_unit__']->valContClassDefault = array();
$dbo->cols['__map_mcartonvariable__carv_unit__']->option->default = 'mm
cm
in
ft
m';
$dbo->cols['__map_mcartonvariable__carv_unit__']->option->defaultMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_unit__']->option->searchMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_unit__']->option->listMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_unit__']->option->detailMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_unit__']->option->newMethod = 'text';
$dbo->cols['__map_mcartonvariable__carv_unit__']->option->editMethod = 'text';
$dbo->cols['file'] = new DBO_COL('file', 'unknown', '-2', '-1');
$dbo->cols['file']->inputTypeDefault = 'file';
$dbo->cols['file']->searchMode = 'exact';
$dbo->cols['file']->capContClassDefault = array();
$dbo->cols['file']->valContClassDefault = array();
$dbo->cols['file']->option->defaultMethod = 'text';
$dbo->cols['file']->option->searchMethod = 'text';
$dbo->cols['file']->option->listMethod = 'text';
$dbo->cols['file']->option->detailMethod = 'text';
$dbo->cols['file']->option->newMethod = 'text';
$dbo->cols['file']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_cartonsetup_custom_new';
function dbo_cartonsetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_cartonsetup_custom_edit';
function dbo_cartonsetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_cartonsetup_custom_search';
function dbo_cartonsetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_cartonsetup_custom_delete';
function dbo_cartonsetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_cartonsetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>