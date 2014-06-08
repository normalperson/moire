<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'tmp_monthsalesbycategory';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'tmp_monthsalesbycategory';
$dbo->key = array('tmp_cateogry');
$dbo->sql = 'select * from tmp_monthsalesbycategory';
$dbo->col = array('tmp_cateogry', 'tmp_salesjan', 'tmp_salesfeb', 'tmp_salesmarch', 'tmp_salesapril', 'tmp_salesmay', 'tmp_salesjune', 'tmp_salesjuly', 'tmp_salesaug', 'tmp_salessept', 'tmp_salesoct', 'tmp_salesnov', 'tmp_salesdev');
$dbo->colList = array('tmp_cateogry', 'tmp_salesjan', 'tmp_salesfeb', 'tmp_salesmarch', 'tmp_salesapril', 'tmp_salesmay', 'tmp_salesjune', 'tmp_salesjuly', 'tmp_salesaug', 'tmp_salessept', 'tmp_salesoct', 'tmp_salesnov', 'tmp_salesdev');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('tmp_cateogry', 'tmp_salesjan', 'tmp_salesfeb', 'tmp_salesmarch', 'tmp_salesapril', 'tmp_salesmay', 'tmp_salesjune', 'tmp_salesjuly', 'tmp_salesaug', 'tmp_salessept', 'tmp_salesoct', 'tmp_salesnov', 'tmp_salesdev');
$dbo->colNew = array('tmp_cateogry', 'tmp_salesjan', 'tmp_salesfeb', 'tmp_salesmarch', 'tmp_salesapril', 'tmp_salesmay', 'tmp_salesjune', 'tmp_salesjuly', 'tmp_salesaug', 'tmp_salessept', 'tmp_salesoct', 'tmp_salesnov', 'tmp_salesdev');
$dbo->colEdit = array('tmp_cateogry', 'tmp_salesjan', 'tmp_salesfeb', 'tmp_salesmarch', 'tmp_salesapril', 'tmp_salesmay', 'tmp_salesjune', 'tmp_salesjuly', 'tmp_salesaug', 'tmp_salessept', 'tmp_salesoct', 'tmp_salesnov', 'tmp_salesdev');
$dbo->colSearch = array('tmp_cateogry', 'tmp_salesjan', 'tmp_salesfeb', 'tmp_salesmarch', 'tmp_salesapril', 'tmp_salesmay', 'tmp_salesjune', 'tmp_salesjuly', 'tmp_salesaug', 'tmp_salessept', 'tmp_salesoct', 'tmp_salesnov', 'tmp_salesdev');
$dbo->colExport = array('tmp_cateogry', 'tmp_salesjan', 'tmp_salesfeb', 'tmp_salesmarch', 'tmp_salesapril', 'tmp_salesmay', 'tmp_salesjune', 'tmp_salesjuly', 'tmp_salesaug', 'tmp_salessept', 'tmp_salesoct', 'tmp_salesnov', 'tmp_salesdev');
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
$dbo->titleList = 'Monthly sale by category';
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

$dbo->cols['tmp_cateogry'] = new DBO_COL('tmp_cateogry', 'varchar', '-1', '104');
$dbo->cols['tmp_cateogry']->inputTypeDefault = 'text';
$dbo->cols['tmp_cateogry']->searchMode = 'exact';
$dbo->cols['tmp_cateogry']->capContClassDefault = array();
$dbo->cols['tmp_cateogry']->valContClassDefault = array();
$dbo->cols['tmp_cateogry']->option->defaultMethod = 'text';
$dbo->cols['tmp_cateogry']->option->searchMethod = 'text';
$dbo->cols['tmp_cateogry']->option->listMethod = 'text';
$dbo->cols['tmp_cateogry']->option->detailMethod = 'text';
$dbo->cols['tmp_cateogry']->option->newMethod = 'text';
$dbo->cols['tmp_cateogry']->option->editMethod = 'text';
$dbo->cols['tmp_salesjan'] = new DBO_COL('tmp_salesjan', 'varchar', '-1', '104');
$dbo->cols['tmp_salesjan']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesjan']->searchMode = 'exact';
$dbo->cols['tmp_salesjan']->capContClassDefault = array();
$dbo->cols['tmp_salesjan']->valContClassDefault = array();
$dbo->cols['tmp_salesjan']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesjan']->option->searchMethod = 'text';
$dbo->cols['tmp_salesjan']->option->listMethod = 'text';
$dbo->cols['tmp_salesjan']->option->detailMethod = 'text';
$dbo->cols['tmp_salesjan']->option->newMethod = 'text';
$dbo->cols['tmp_salesjan']->option->editMethod = 'text';
$dbo->cols['tmp_salesfeb'] = new DBO_COL('tmp_salesfeb', 'varchar', '-1', '104');
$dbo->cols['tmp_salesfeb']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesfeb']->searchMode = 'exact';
$dbo->cols['tmp_salesfeb']->capContClassDefault = array();
$dbo->cols['tmp_salesfeb']->valContClassDefault = array();
$dbo->cols['tmp_salesfeb']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesfeb']->option->searchMethod = 'text';
$dbo->cols['tmp_salesfeb']->option->listMethod = 'text';
$dbo->cols['tmp_salesfeb']->option->detailMethod = 'text';
$dbo->cols['tmp_salesfeb']->option->newMethod = 'text';
$dbo->cols['tmp_salesfeb']->option->editMethod = 'text';
$dbo->cols['tmp_salesmarch'] = new DBO_COL('tmp_salesmarch', 'varchar', '-1', '104');
$dbo->cols['tmp_salesmarch']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesmarch']->searchMode = 'exact';
$dbo->cols['tmp_salesmarch']->capContClassDefault = array();
$dbo->cols['tmp_salesmarch']->valContClassDefault = array();
$dbo->cols['tmp_salesmarch']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesmarch']->option->searchMethod = 'text';
$dbo->cols['tmp_salesmarch']->option->listMethod = 'text';
$dbo->cols['tmp_salesmarch']->option->detailMethod = 'text';
$dbo->cols['tmp_salesmarch']->option->newMethod = 'text';
$dbo->cols['tmp_salesmarch']->option->editMethod = 'text';
$dbo->cols['tmp_salesapril'] = new DBO_COL('tmp_salesapril', 'varchar', '-1', '104');
$dbo->cols['tmp_salesapril']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesapril']->searchMode = 'exact';
$dbo->cols['tmp_salesapril']->capContClassDefault = array();
$dbo->cols['tmp_salesapril']->valContClassDefault = array();
$dbo->cols['tmp_salesapril']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesapril']->option->searchMethod = 'text';
$dbo->cols['tmp_salesapril']->option->listMethod = 'text';
$dbo->cols['tmp_salesapril']->option->detailMethod = 'text';
$dbo->cols['tmp_salesapril']->option->newMethod = 'text';
$dbo->cols['tmp_salesapril']->option->editMethod = 'text';
$dbo->cols['tmp_salesmay'] = new DBO_COL('tmp_salesmay', 'varchar', '-1', '104');
$dbo->cols['tmp_salesmay']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesmay']->searchMode = 'exact';
$dbo->cols['tmp_salesmay']->capContClassDefault = array();
$dbo->cols['tmp_salesmay']->valContClassDefault = array();
$dbo->cols['tmp_salesmay']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesmay']->option->searchMethod = 'text';
$dbo->cols['tmp_salesmay']->option->listMethod = 'text';
$dbo->cols['tmp_salesmay']->option->detailMethod = 'text';
$dbo->cols['tmp_salesmay']->option->newMethod = 'text';
$dbo->cols['tmp_salesmay']->option->editMethod = 'text';
$dbo->cols['tmp_salesjune'] = new DBO_COL('tmp_salesjune', 'varchar', '-1', '104');
$dbo->cols['tmp_salesjune']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesjune']->searchMode = 'exact';
$dbo->cols['tmp_salesjune']->capContClassDefault = array();
$dbo->cols['tmp_salesjune']->valContClassDefault = array();
$dbo->cols['tmp_salesjune']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesjune']->option->searchMethod = 'text';
$dbo->cols['tmp_salesjune']->option->listMethod = 'text';
$dbo->cols['tmp_salesjune']->option->detailMethod = 'text';
$dbo->cols['tmp_salesjune']->option->newMethod = 'text';
$dbo->cols['tmp_salesjune']->option->editMethod = 'text';
$dbo->cols['tmp_salesjuly'] = new DBO_COL('tmp_salesjuly', 'varchar', '-1', '104');
$dbo->cols['tmp_salesjuly']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesjuly']->searchMode = 'exact';
$dbo->cols['tmp_salesjuly']->capContClassDefault = array();
$dbo->cols['tmp_salesjuly']->valContClassDefault = array();
$dbo->cols['tmp_salesjuly']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesjuly']->option->searchMethod = 'text';
$dbo->cols['tmp_salesjuly']->option->listMethod = 'text';
$dbo->cols['tmp_salesjuly']->option->detailMethod = 'text';
$dbo->cols['tmp_salesjuly']->option->newMethod = 'text';
$dbo->cols['tmp_salesjuly']->option->editMethod = 'text';
$dbo->cols['tmp_salesaug'] = new DBO_COL('tmp_salesaug', 'varchar', '-1', '104');
$dbo->cols['tmp_salesaug']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesaug']->searchMode = 'exact';
$dbo->cols['tmp_salesaug']->capContClassDefault = array();
$dbo->cols['tmp_salesaug']->valContClassDefault = array();
$dbo->cols['tmp_salesaug']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesaug']->option->searchMethod = 'text';
$dbo->cols['tmp_salesaug']->option->listMethod = 'text';
$dbo->cols['tmp_salesaug']->option->detailMethod = 'text';
$dbo->cols['tmp_salesaug']->option->newMethod = 'text';
$dbo->cols['tmp_salesaug']->option->editMethod = 'text';
$dbo->cols['tmp_salessept'] = new DBO_COL('tmp_salessept', 'varchar', '-1', '104');
$dbo->cols['tmp_salessept']->inputTypeDefault = 'text';
$dbo->cols['tmp_salessept']->searchMode = 'exact';
$dbo->cols['tmp_salessept']->capContClassDefault = array();
$dbo->cols['tmp_salessept']->valContClassDefault = array();
$dbo->cols['tmp_salessept']->option->defaultMethod = 'text';
$dbo->cols['tmp_salessept']->option->searchMethod = 'text';
$dbo->cols['tmp_salessept']->option->listMethod = 'text';
$dbo->cols['tmp_salessept']->option->detailMethod = 'text';
$dbo->cols['tmp_salessept']->option->newMethod = 'text';
$dbo->cols['tmp_salessept']->option->editMethod = 'text';
$dbo->cols['tmp_salesoct'] = new DBO_COL('tmp_salesoct', 'varchar', '-1', '104');
$dbo->cols['tmp_salesoct']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesoct']->searchMode = 'exact';
$dbo->cols['tmp_salesoct']->capContClassDefault = array();
$dbo->cols['tmp_salesoct']->valContClassDefault = array();
$dbo->cols['tmp_salesoct']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesoct']->option->searchMethod = 'text';
$dbo->cols['tmp_salesoct']->option->listMethod = 'text';
$dbo->cols['tmp_salesoct']->option->detailMethod = 'text';
$dbo->cols['tmp_salesoct']->option->newMethod = 'text';
$dbo->cols['tmp_salesoct']->option->editMethod = 'text';
$dbo->cols['tmp_salesnov'] = new DBO_COL('tmp_salesnov', 'varchar', '-1', '104');
$dbo->cols['tmp_salesnov']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesnov']->searchMode = 'exact';
$dbo->cols['tmp_salesnov']->capContClassDefault = array();
$dbo->cols['tmp_salesnov']->valContClassDefault = array();
$dbo->cols['tmp_salesnov']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesnov']->option->searchMethod = 'text';
$dbo->cols['tmp_salesnov']->option->listMethod = 'text';
$dbo->cols['tmp_salesnov']->option->detailMethod = 'text';
$dbo->cols['tmp_salesnov']->option->newMethod = 'text';
$dbo->cols['tmp_salesnov']->option->editMethod = 'text';
$dbo->cols['tmp_salesdev'] = new DBO_COL('tmp_salesdev', 'varchar', '-1', '104');
$dbo->cols['tmp_salesdev']->inputTypeDefault = 'text';
$dbo->cols['tmp_salesdev']->searchMode = 'exact';
$dbo->cols['tmp_salesdev']->capContClassDefault = array();
$dbo->cols['tmp_salesdev']->valContClassDefault = array();
$dbo->cols['tmp_salesdev']->option->defaultMethod = 'text';
$dbo->cols['tmp_salesdev']->option->searchMethod = 'text';
$dbo->cols['tmp_salesdev']->option->listMethod = 'text';
$dbo->cols['tmp_salesdev']->option->detailMethod = 'text';
$dbo->cols['tmp_salesdev']->option->newMethod = 'text';
$dbo->cols['tmp_salesdev']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_tmp_monthsalesbycategory_custom_new';
function dbo_tmp_monthsalesbycategory_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_tmp_monthsalesbycategory_custom_edit';
function dbo_tmp_monthsalesbycategory_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_tmp_monthsalesbycategory_custom_search';
function dbo_tmp_monthsalesbycategory_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_tmp_monthsalesbycategory_custom_delete';
function dbo_tmp_monthsalesbycategory_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_tmp_monthsalesbycategory_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>