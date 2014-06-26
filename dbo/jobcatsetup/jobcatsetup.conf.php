<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'jobcatsetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'mjobcatlookup';
$dbo->key = array('jcl_id');
$dbo->sql = 'select * from mjobcatlookup order by jcl_title';
$dbo->col = array('jcl_id', 'jcl_title', 'jcl_sequence', 'jcl_requiretime_color_1', 'jcl_requiretime_color_2', 'jcl_requiretime_color_3', 'jcl_requiretime_color_4', 'jcl_status', 'jcl_price_cat', 'jcl_price_color_1', 'jcl_price_color_2', 'jcl_price_color_3', 'jcl_price_color_4', 'jcl_price_per_unit');
$dbo->colList = array('jcl_title', 'jcl_requiretime_color_1', 'jcl_requiretime_color_2', 'jcl_requiretime_color_3', 'jcl_requiretime_color_4', 'jcl_status');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('jcl_id', 'jcl_title');
$dbo->colNew = array('jcl_title', 'jcl_status', 'jcl_requiretime_color_1', 'jcl_requiretime_color_2', 'jcl_requiretime_color_3', 'jcl_requiretime_color_4', 'jcl_price_cat', 'jcl_price_per_unit', 'jcl_price_color_1', 'jcl_price_color_2', 'jcl_price_color_3', 'jcl_price_color_4');
$dbo->colEdit = array('jcl_title', 'jcl_status', 'jcl_requiretime_color_1', 'jcl_requiretime_color_2', 'jcl_requiretime_color_3', 'jcl_requiretime_color_4', 'jcl_price_cat', 'jcl_price_per_unit', 'jcl_price_color_1', 'jcl_price_color_2', 'jcl_price_color_3', 'jcl_price_color_4');
$dbo->colSearch = array('jcl_title', 'jcl_status');
$dbo->colExport = array('jcl_id', 'jcl_title', 'jcl_sequence');
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
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->layoutNew = '2;
2;
2;
2;
2;
2;
1|1;
2;
2;
2;
2;';
$dbo->layoutEdit = '2;
2;
2;
2;
2;
2;
1|1;
2;
2;
2;
2;';
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

$dbo->cols['jcl_id'] = new DBO_COL('jcl_id', 'int4', '4', '-1');
$dbo->cols['jcl_id']->inputTypeDefault = 'text';
$dbo->cols['jcl_id']->searchMode = 'exact';
$dbo->cols['jcl_id']->capContClassDefault = array();
$dbo->cols['jcl_id']->valContClassDefault = array();
$dbo->cols['jcl_id']->option->defaultMethod = 'text';
$dbo->cols['jcl_id']->option->searchMethod = 'text';
$dbo->cols['jcl_id']->option->listMethod = 'text';
$dbo->cols['jcl_id']->option->detailMethod = 'text';
$dbo->cols['jcl_id']->option->newMethod = 'text';
$dbo->cols['jcl_id']->option->editMethod = 'text';
$dbo->cols['jcl_title'] = new DBO_COL('jcl_title', 'varchar', '-1', '204');
$dbo->cols['jcl_title']->inputTypeDefault = 'text';
$dbo->cols['jcl_title']->mandatoryNew = 1;
$dbo->cols['jcl_title']->mandatoryEdit = 1;
$dbo->cols['jcl_title']->searchMode = 'exact';
$dbo->cols['jcl_title']->capContClassDefault = array();
$dbo->cols['jcl_title']->valContClassDefault = array();
$dbo->cols['jcl_title']->option->defaultMethod = 'text';
$dbo->cols['jcl_title']->option->searchMethod = 'text';
$dbo->cols['jcl_title']->option->listMethod = 'text';
$dbo->cols['jcl_title']->option->detailMethod = 'text';
$dbo->cols['jcl_title']->option->newMethod = 'text';
$dbo->cols['jcl_title']->option->editMethod = 'text';
$dbo->cols['jcl_requiretime'] = new DBO_COL('jcl_requiretime', 'int4', '4', '-1');
$dbo->cols['jcl_requiretime']->inputTypeDefault = 'text';
$dbo->cols['jcl_requiretime']->searchMode = 'exact';
$dbo->cols['jcl_requiretime']->capContClassDefault = array();
$dbo->cols['jcl_requiretime']->valContClassDefault = array();
$dbo->cols['jcl_requiretime']->option->defaultMethod = 'text';
$dbo->cols['jcl_requiretime']->option->searchMethod = 'text';
$dbo->cols['jcl_requiretime']->option->listMethod = 'text';
$dbo->cols['jcl_requiretime']->option->detailMethod = 'text';
$dbo->cols['jcl_requiretime']->option->newMethod = 'text';
$dbo->cols['jcl_requiretime']->option->editMethod = 'text';
$dbo->cols['jcl_sequence'] = new DBO_COL('jcl_sequence', 'int4', '4', '-1');
$dbo->cols['jcl_sequence']->inputTypeDefault = 'text';
$dbo->cols['jcl_sequence']->searchMode = 'exact';
$dbo->cols['jcl_sequence']->capContClassDefault = array();
$dbo->cols['jcl_sequence']->valContClassDefault = array();
$dbo->cols['jcl_sequence']->option->defaultMethod = 'text';
$dbo->cols['jcl_sequence']->option->searchMethod = 'text';
$dbo->cols['jcl_sequence']->option->listMethod = 'text';
$dbo->cols['jcl_sequence']->option->detailMethod = 'text';
$dbo->cols['jcl_sequence']->option->newMethod = 'text';
$dbo->cols['jcl_sequence']->option->editMethod = 'text';
$dbo->cols['jcl_requiretime_color_1'] = new DBO_COL('jcl_requiretime_color_1', 'int4', '4', '-1');
$dbo->cols['jcl_requiretime_color_1']->displayDataType = 'int';
$dbo->cols['jcl_requiretime_color_1']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_requiretime_color_1']->searchMode = 'exact';
$dbo->cols['jcl_requiretime_color_1']->capContClassDefault = array();
$dbo->cols['jcl_requiretime_color_1']->valContClassDefault = array();
$dbo->cols['jcl_requiretime_color_1']->option->defaultMethod = 'text';
$dbo->cols['jcl_requiretime_color_1']->option->searchMethod = 'text';
$dbo->cols['jcl_requiretime_color_1']->option->listMethod = 'text';
$dbo->cols['jcl_requiretime_color_1']->option->detailMethod = 'text';
$dbo->cols['jcl_requiretime_color_1']->option->newMethod = 'text';
$dbo->cols['jcl_requiretime_color_1']->option->editMethod = 'text';
$dbo->cols['jcl_requiretime_color_2'] = new DBO_COL('jcl_requiretime_color_2', 'int4', '4', '-1');
$dbo->cols['jcl_requiretime_color_2']->displayDataType = 'int';
$dbo->cols['jcl_requiretime_color_2']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_requiretime_color_2']->searchMode = 'exact';
$dbo->cols['jcl_requiretime_color_2']->capContClassDefault = array();
$dbo->cols['jcl_requiretime_color_2']->valContClassDefault = array();
$dbo->cols['jcl_requiretime_color_2']->option->defaultMethod = 'text';
$dbo->cols['jcl_requiretime_color_2']->option->searchMethod = 'text';
$dbo->cols['jcl_requiretime_color_2']->option->listMethod = 'text';
$dbo->cols['jcl_requiretime_color_2']->option->detailMethod = 'text';
$dbo->cols['jcl_requiretime_color_2']->option->newMethod = 'text';
$dbo->cols['jcl_requiretime_color_2']->option->editMethod = 'text';
$dbo->cols['jcl_requiretime_color_3'] = new DBO_COL('jcl_requiretime_color_3', 'int4', '4', '-1');
$dbo->cols['jcl_requiretime_color_3']->displayDataType = 'int';
$dbo->cols['jcl_requiretime_color_3']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_requiretime_color_3']->searchMode = 'exact';
$dbo->cols['jcl_requiretime_color_3']->capContClassDefault = array();
$dbo->cols['jcl_requiretime_color_3']->valContClassDefault = array();
$dbo->cols['jcl_requiretime_color_3']->option->defaultMethod = 'text';
$dbo->cols['jcl_requiretime_color_3']->option->searchMethod = 'text';
$dbo->cols['jcl_requiretime_color_3']->option->listMethod = 'text';
$dbo->cols['jcl_requiretime_color_3']->option->detailMethod = 'text';
$dbo->cols['jcl_requiretime_color_3']->option->newMethod = 'text';
$dbo->cols['jcl_requiretime_color_3']->option->editMethod = 'text';
$dbo->cols['jcl_requiretime_color_4'] = new DBO_COL('jcl_requiretime_color_4', 'int4', '4', '-1');
$dbo->cols['jcl_requiretime_color_4']->displayDataType = 'int';
$dbo->cols['jcl_requiretime_color_4']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_requiretime_color_4']->searchMode = 'exact';
$dbo->cols['jcl_requiretime_color_4']->capContClassDefault = array();
$dbo->cols['jcl_requiretime_color_4']->valContClassDefault = array();
$dbo->cols['jcl_requiretime_color_4']->option->defaultMethod = 'text';
$dbo->cols['jcl_requiretime_color_4']->option->searchMethod = 'text';
$dbo->cols['jcl_requiretime_color_4']->option->listMethod = 'text';
$dbo->cols['jcl_requiretime_color_4']->option->detailMethod = 'text';
$dbo->cols['jcl_requiretime_color_4']->option->newMethod = 'text';
$dbo->cols['jcl_requiretime_color_4']->option->editMethod = 'text';
$dbo->cols['jcl_status'] = new DBO_COL('jcl_status', 'varchar', '-1', '36');
$dbo->cols['jcl_status']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['jcl_status']->mandatoryNew = 1;
$dbo->cols['jcl_status']->mandatoryEdit = 1;
$dbo->cols['jcl_status']->searchMode = 'exact';
$dbo->cols['jcl_status']->capContClassDefault = array();
$dbo->cols['jcl_status']->valContClassDefault = array();
$dbo->cols['jcl_status']->option->default = 'ACTIVE/Active
INACTIVE/Inactive';
$dbo->cols['jcl_status']->option->defaultMethod = 'text';
$dbo->cols['jcl_status']->option->searchMethod = 'text';
$dbo->cols['jcl_status']->option->listMethod = 'text';
$dbo->cols['jcl_status']->option->detailMethod = 'text';
$dbo->cols['jcl_status']->option->newMethod = 'text';
$dbo->cols['jcl_status']->option->editMethod = 'text';
$dbo->cols['jcl_price'] = new DBO_COL('jcl_price', 'numeric', '-1', '1310728');
$dbo->cols['jcl_price']->displayDataType = 'currency';
$dbo->cols['jcl_price']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_price']->mandatoryNew = 1;
$dbo->cols['jcl_price']->mandatoryEdit = 1;
$dbo->cols['jcl_price']->searchMode = 'exact';
$dbo->cols['jcl_price']->capContClassDefault = array();
$dbo->cols['jcl_price']->valContClassDefault = array();
$dbo->cols['jcl_price']->option->defaultMethod = 'text';
$dbo->cols['jcl_price']->option->searchMethod = 'text';
$dbo->cols['jcl_price']->option->listMethod = 'text';
$dbo->cols['jcl_price']->option->detailMethod = 'text';
$dbo->cols['jcl_price']->option->newMethod = 'text';
$dbo->cols['jcl_price']->option->editMethod = 'text';
$dbo->cols['jcl_price_cat'] = new DBO_COL('jcl_price_cat', 'varchar', '-1', '16');
$dbo->cols['jcl_price_cat']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['jcl_price_cat']->mandatoryNew = 1;
$dbo->cols['jcl_price_cat']->mandatoryEdit = 1;
$dbo->cols['jcl_price_cat']->searchMode = 'exact';
$dbo->cols['jcl_price_cat']->capContClassDefault = array();
$dbo->cols['jcl_price_cat']->valContClassDefault = array();
$dbo->cols['jcl_price_cat']->option->default = 'UNIT/By Unit
COLOR/By Color';
$dbo->cols['jcl_price_cat']->option->defaultMethod = 'text';
$dbo->cols['jcl_price_cat']->option->searchMethod = 'text';
$dbo->cols['jcl_price_cat']->option->listMethod = 'text';
$dbo->cols['jcl_price_cat']->option->detailMethod = 'text';
$dbo->cols['jcl_price_cat']->option->newMethod = 'text';
$dbo->cols['jcl_price_cat']->option->editMethod = 'text';
$dbo->cols['jcl_price_color_1'] = new DBO_COL('jcl_price_color_1', 'numeric', '-1', '1310728');
$dbo->cols['jcl_price_color_1']->displayDataType = 'currency';
$dbo->cols['jcl_price_color_1']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_price_color_1']->searchMode = 'exact';
$dbo->cols['jcl_price_color_1']->capContClassDefault = array();
$dbo->cols['jcl_price_color_1']->valContClassDefault = array();
$dbo->cols['jcl_price_color_1']->option->defaultMethod = 'text';
$dbo->cols['jcl_price_color_1']->option->searchMethod = 'text';
$dbo->cols['jcl_price_color_1']->option->listMethod = 'text';
$dbo->cols['jcl_price_color_1']->option->detailMethod = 'text';
$dbo->cols['jcl_price_color_1']->option->newMethod = 'text';
$dbo->cols['jcl_price_color_1']->option->editMethod = 'text';
$dbo->cols['jcl_price_color_2'] = new DBO_COL('jcl_price_color_2', 'numeric', '-1', '1310728');
$dbo->cols['jcl_price_color_2']->displayDataType = 'currency';
$dbo->cols['jcl_price_color_2']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_price_color_2']->searchMode = 'exact';
$dbo->cols['jcl_price_color_2']->capContClassDefault = array();
$dbo->cols['jcl_price_color_2']->valContClassDefault = array();
$dbo->cols['jcl_price_color_2']->option->defaultMethod = 'text';
$dbo->cols['jcl_price_color_2']->option->searchMethod = 'text';
$dbo->cols['jcl_price_color_2']->option->listMethod = 'text';
$dbo->cols['jcl_price_color_2']->option->detailMethod = 'text';
$dbo->cols['jcl_price_color_2']->option->newMethod = 'text';
$dbo->cols['jcl_price_color_2']->option->editMethod = 'text';
$dbo->cols['jcl_price_color_3'] = new DBO_COL('jcl_price_color_3', 'numeric', '-1', '1310728');
$dbo->cols['jcl_price_color_3']->displayDataType = 'currency';
$dbo->cols['jcl_price_color_3']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_price_color_3']->searchMode = 'exact';
$dbo->cols['jcl_price_color_3']->capContClassDefault = array();
$dbo->cols['jcl_price_color_3']->valContClassDefault = array();
$dbo->cols['jcl_price_color_3']->option->defaultMethod = 'text';
$dbo->cols['jcl_price_color_3']->option->searchMethod = 'text';
$dbo->cols['jcl_price_color_3']->option->listMethod = 'text';
$dbo->cols['jcl_price_color_3']->option->detailMethod = 'text';
$dbo->cols['jcl_price_color_3']->option->newMethod = 'text';
$dbo->cols['jcl_price_color_3']->option->editMethod = 'text';
$dbo->cols['jcl_price_color_4'] = new DBO_COL('jcl_price_color_4', 'numeric', '-1', '1310728');
$dbo->cols['jcl_price_color_4']->displayDataType = 'currency';
$dbo->cols['jcl_price_color_4']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_price_color_4']->searchMode = 'exact';
$dbo->cols['jcl_price_color_4']->capContClassDefault = array();
$dbo->cols['jcl_price_color_4']->valContClassDefault = array();
$dbo->cols['jcl_price_color_4']->option->defaultMethod = 'text';
$dbo->cols['jcl_price_color_4']->option->searchMethod = 'text';
$dbo->cols['jcl_price_color_4']->option->listMethod = 'text';
$dbo->cols['jcl_price_color_4']->option->detailMethod = 'text';
$dbo->cols['jcl_price_color_4']->option->newMethod = 'text';
$dbo->cols['jcl_price_color_4']->option->editMethod = 'text';
$dbo->cols['jcl_price_per_unit'] = new DBO_COL('jcl_price_per_unit', 'numeric', '-1', '1310728');
$dbo->cols['jcl_price_per_unit']->displayDataType = 'currency';
$dbo->cols['jcl_price_per_unit']->inputTypeDefault = 'TextInputControl';
$dbo->cols['jcl_price_per_unit']->searchMode = 'exact';
$dbo->cols['jcl_price_per_unit']->capContClassDefault = array();
$dbo->cols['jcl_price_per_unit']->valContClassDefault = array();
$dbo->cols['jcl_price_per_unit']->option->defaultMethod = 'text';
$dbo->cols['jcl_price_per_unit']->option->searchMethod = 'text';
$dbo->cols['jcl_price_per_unit']->option->listMethod = 'text';
$dbo->cols['jcl_price_per_unit']->option->detailMethod = 'text';
$dbo->cols['jcl_price_per_unit']->option->newMethod = 'text';
$dbo->cols['jcl_price_per_unit']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_jobcatsetup_custom_new';
function dbo_jobcatsetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_jobcatsetup_custom_edit';
function dbo_jobcatsetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_jobcatsetup_custom_search';
function dbo_jobcatsetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_jobcatsetup_custom_delete';
function dbo_jobcatsetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_jobcatsetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>