<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'locale_setup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fclocale';
$dbo->key = array('lc_code');
$dbo->sql = 'select a.*, lc_code as "__map_fclocaleholiday__lch_lccode__",
null as "__map_fclocaleholiday__lch_date__", 
null as "__map_fclocaleholiday__lch_description__",
null as "__map_fclocaleholiday__lch_recurring__",  lc_code as "__map_fclocaleworkinghour__lcw_lccode__",
null as "__map_fclocaleworkinghour__lcw_day__", 
null as "__map_fclocaleworkinghour__lcw_start_time__",
null as "__map_fclocaleworkinghour__lcw_end_time__" from fclocale a';
$dbo->col = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode', '__map_fclocaleholiday__lch_lccode__', '__map_fclocaleholiday__lch_date__', '__map_fclocaleholiday__lch_description__', '__map_fclocaleholiday__lch_recurring__', '__map_fclocaleworkinghour__lcw_lccode__', '__map_fclocaleworkinghour__lcw_day__', '__map_fclocaleworkinghour__lcw_start_time__', '__map_fclocaleworkinghour__lcw_end_time__');
$dbo->colList = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colNew = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode', '__map_fclocaleworkinghour__lcw_lccode__', '__map_fclocaleholiday__lch_lccode__');
$dbo->colEdit = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode', '__map_fclocaleworkinghour__lcw_lccode__', '__map_fclocaleholiday__lch_lccode__');
$dbo->colSearch = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
$dbo->colExport = array('lc_code', 'lc_description', 'lc_primary_langcode', 'lc_tzcode');
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
$dbo->cols['lc_code']->attributeEdit = array('readonly'=>array('readonly'));
$dbo->cols['lc_code']->mandatoryDefault = 1;
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
$dbo->cols['lc_description']->mandatoryDefault = 1;
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
$dbo->cols['lc_primary_langcode']->defaultValueMethod = 'phps';
$dbo->cols['lc_primary_langcode']->defaultValue = 'getDefaultLang()';
$dbo->cols['lc_primary_langcode']->inputTypeDefault = 'Select2';
$dbo->cols['lc_primary_langcode']->mandatoryDefault = 1;
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
$dbo->cols['lc_tzcode']->defaultValueMethod = 'phps';
$dbo->cols['lc_tzcode']->defaultValue = 'getDefaultTZ()';
$dbo->cols['lc_tzcode']->inputTypeDefault = 'Select2';
$dbo->cols['lc_tzcode']->mandatoryDefault = 1;
$dbo->cols['lc_tzcode']->searchMode = 'exact';
$dbo->cols['lc_tzcode']->capContClassDefault = array();
$dbo->cols['lc_tzcode']->valContClassDefault = array();
$dbo->cols['lc_tzcode']->option->default = 'genTZOption()';
$dbo->cols['lc_tzcode']->option->defaultMethod = 'php';
$dbo->cols['lc_tzcode']->option->searchMethod = 'text';
$dbo->cols['lc_tzcode']->option->listMethod = 'text';
$dbo->cols['lc_tzcode']->option->detailMethod = 'text';
$dbo->cols['lc_tzcode']->option->newMethod = 'text';
$dbo->cols['lc_tzcode']->option->editMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_lccode__'] = new DBO_COL('__map_fclocaleholiday__lch_lccode__', 'varchar', '-1', '36');
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->inputNewModifierMethod = 'phpfunc';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->inputEditModifierMethod = 'phpfunc';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->inputNewModifier = 'genDetailTableInput';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->inputEditModifier = 'genDetailTableInput';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->inputTypeDefault = 'text';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->searchMode = 'exact';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->capContClassDefault = array();
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->valContClassDefault = array();
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->option->defaultMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->option->searchMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->option->listMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->option->detailMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->option->newMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->option->editMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_date__'] = new DBO_COL('__map_fclocaleholiday__lch_date__', 'unknown', '-2', '-1');
$dbo->cols['__map_fclocaleholiday__lch_date__']->inputTypeDefault = 'date';
$dbo->cols['__map_fclocaleholiday__lch_date__']->mandatoryDefault = 1;
$dbo->cols['__map_fclocaleholiday__lch_date__']->searchMode = 'exact';
$dbo->cols['__map_fclocaleholiday__lch_date__']->capContClassDefault = array();
$dbo->cols['__map_fclocaleholiday__lch_date__']->valContClassDefault = array();
$dbo->cols['__map_fclocaleholiday__lch_date__']->option->defaultMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_date__']->option->searchMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_date__']->option->listMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_date__']->option->detailMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_date__']->option->newMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_date__']->option->editMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_description__'] = new DBO_COL('__map_fclocaleholiday__lch_description__', 'unknown', '-2', '-1');
$dbo->cols['__map_fclocaleholiday__lch_description__']->inputTypeDefault = 'text';
$dbo->cols['__map_fclocaleholiday__lch_description__']->mandatoryDefault = 1;
$dbo->cols['__map_fclocaleholiday__lch_description__']->searchMode = 'exact';
$dbo->cols['__map_fclocaleholiday__lch_description__']->capContClassDefault = array();
$dbo->cols['__map_fclocaleholiday__lch_description__']->valContClassDefault = array();
$dbo->cols['__map_fclocaleholiday__lch_description__']->option->defaultMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_description__']->option->searchMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_description__']->option->listMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_description__']->option->detailMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_description__']->option->newMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_description__']->option->editMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_recurring__'] = new DBO_COL('__map_fclocaleholiday__lch_recurring__', 'unknown', '-2', '-1');
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->inputTypeDefault = 'select';
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->mandatoryDefault = 1;
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->searchMode = 'exact';
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->capContClassDefault = array();
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->valContClassDefault = array();
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->option->default = 'Y/Recurring
N/Once';
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->option->defaultMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->option->searchMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->option->listMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->option->detailMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->option->newMethod = 'text';
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->option->editMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__'] = new DBO_COL('__map_fclocaleworkinghour__lcw_lccode__', 'varchar', '-1', '36');
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->inputNewModifierMethod = 'phpfunc';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->inputEditModifierMethod = 'phpfunc';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->inputNewModifier = 'genDetailTableInput';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->inputEditModifier = 'genDetailTableInput';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->inputTypeDefault = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->searchMode = 'exact';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->capContClassDefault = array();
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->valContClassDefault = array();
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->option->defaultMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->option->searchMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->option->listMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->option->detailMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->option->newMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->option->editMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__'] = new DBO_COL('__map_fclocaleworkinghour__lcw_day__', 'unknown', '-2', '-1');
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->inputTypeDefault = 'select';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->mandatoryDefault = 1;
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->searchMode = 'exact';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->capContClassDefault = array();
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->valContClassDefault = array();
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->option->default = 'Mon/Monday
Tue/Tuesday
Wed/Wednesday
Thu/Thursday
Fri/Friday
Sat/Saturday
Sun/Sunday';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->option->defaultMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->option->searchMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->option->listMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->option->detailMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->option->newMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->option->editMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__'] = new DBO_COL('__map_fclocaleworkinghour__lcw_start_time__', 'unknown', '-2', '-1');
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->inputTypeDefault = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->mandatoryDefault = 1;
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->searchMode = 'exact';
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->capContClassDefault = array();
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->valContClassDefault = array();
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->option->defaultMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->option->searchMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->option->listMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->option->detailMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->option->newMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->option->editMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__'] = new DBO_COL('__map_fclocaleworkinghour__lcw_end_time__', 'unknown', '-2', '-1');
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->inputTypeDefault = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->mandatoryDefault = 1;
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->searchMode = 'exact';
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->capContClassDefault = array();
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->valContClassDefault = array();
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->option->defaultMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->option->searchMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->option->listMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->option->detailMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->option->newMethod = 'text';
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->option->editMethod = 'text';

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