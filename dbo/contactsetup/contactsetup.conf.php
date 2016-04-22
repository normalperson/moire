<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'contactsetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'pndcontact';
$dbo->key = array('ct_id');
$dbo->sql = 'select * from pndcontact left join fcorg on ct_refid = org_id and ct_reftype=\'ORG_ID\'';
$dbo->col = array('ct_id', 'ct_refid', 'ct_reftype', 'ct_name', 'ct_email', 'ct_concode', 'org_id', 'org_type', 'org_external', 'org_name', 'org_parentid', 'org_primaryid', 'org_address', 'org_contactno', 'org_status', 'org_lccode', 'org_concode');
$dbo->colList = array('org_name', 'ct_name', 'ct_email');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('ct_refid', 'ct_name', 'ct_email', 'ct_concode');
$dbo->colNew = array('ct_refid', 'ct_name', 'ct_email', 'ct_concode');
$dbo->colEdit = array('ct_refid', 'ct_name', 'ct_email', 'ct_concode');
$dbo->colSearch = array('ct_refid', 'ct_name', 'ct_email');
$dbo->colExport = array('ct_id', 'ct_refid', 'ct_reftype', 'ct_name', 'ct_email', 'ct_concode');
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
$dbo->exportFormat = array('csv', 'excel', 'pdf');
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
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->detailBack = 'Back';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->listEditSubmit = 'Submit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';

$dbo->cols['ct_id'] = new DBO_COL('ct_id', 'int4', '4', '-1');
$dbo->cols['ct_id']->inputTypeDefault = 'text';
$dbo->cols['ct_id']->searchMode = 'exact';
$dbo->cols['ct_id']->capContClassDefault = array();
$dbo->cols['ct_id']->valContClassDefault = array();
$dbo->cols['ct_id']->option->defaultMethod = 'text';
$dbo->cols['ct_id']->option->searchMethod = 'text';
$dbo->cols['ct_id']->option->listMethod = 'text';
$dbo->cols['ct_id']->option->detailMethod = 'text';
$dbo->cols['ct_id']->option->newMethod = 'text';
$dbo->cols['ct_id']->option->editMethod = 'text';
$dbo->cols['ct_refid'] = new DBO_COL('ct_refid', 'int4', '4', '-1');
$dbo->cols['ct_refid']->inputTypeDefault = 'select';
$dbo->cols['ct_refid']->searchMode = 'exact';
$dbo->cols['ct_refid']->capContClassDefault = array();
$dbo->cols['ct_refid']->valContClassDefault = array();
$dbo->cols['ct_refid']->option->default = 'select org_id, org_name from fcorg order by org_name';
$dbo->cols['ct_refid']->option->defaultMethod = 'sql';
$dbo->cols['ct_refid']->option->searchMethod = 'text';
$dbo->cols['ct_refid']->option->listMethod = 'text';
$dbo->cols['ct_refid']->option->detailMethod = 'text';
$dbo->cols['ct_refid']->option->newMethod = 'text';
$dbo->cols['ct_refid']->option->editMethod = 'text';
$dbo->cols['ct_reftype'] = new DBO_COL('ct_reftype', 'varchar', '-1', '54');
$dbo->cols['ct_reftype']->defaultValueMethod = 'text';
$dbo->cols['ct_reftype']->defaultValue = 'ORG_ID';
$dbo->cols['ct_reftype']->inputTypeDefault = 'text';
$dbo->cols['ct_reftype']->searchMode = 'exact';
$dbo->cols['ct_reftype']->capContClassDefault = array();
$dbo->cols['ct_reftype']->valContClassDefault = array();
$dbo->cols['ct_reftype']->option->defaultMethod = 'text';
$dbo->cols['ct_reftype']->option->searchMethod = 'text';
$dbo->cols['ct_reftype']->option->listMethod = 'text';
$dbo->cols['ct_reftype']->option->detailMethod = 'text';
$dbo->cols['ct_reftype']->option->newMethod = 'text';
$dbo->cols['ct_reftype']->option->editMethod = 'text';
$dbo->cols['ct_name'] = new DBO_COL('ct_name', 'varchar', '-1', '104');
$dbo->cols['ct_name']->inputTypeDefault = 'text';
$dbo->cols['ct_name']->searchMode = 'exact';
$dbo->cols['ct_name']->capContClassDefault = array();
$dbo->cols['ct_name']->valContClassDefault = array();
$dbo->cols['ct_name']->option->defaultMethod = 'text';
$dbo->cols['ct_name']->option->searchMethod = 'text';
$dbo->cols['ct_name']->option->listMethod = 'text';
$dbo->cols['ct_name']->option->detailMethod = 'text';
$dbo->cols['ct_name']->option->newMethod = 'text';
$dbo->cols['ct_name']->option->editMethod = 'text';
$dbo->cols['ct_email'] = new DBO_COL('ct_email', 'varchar', '-1', '104');
$dbo->cols['ct_email']->inputTypeDefault = 'text';
$dbo->cols['ct_email']->searchMode = 'exact';
$dbo->cols['ct_email']->capContClassDefault = array();
$dbo->cols['ct_email']->valContClassDefault = array();
$dbo->cols['ct_email']->option->defaultMethod = 'text';
$dbo->cols['ct_email']->option->searchMethod = 'text';
$dbo->cols['ct_email']->option->listMethod = 'text';
$dbo->cols['ct_email']->option->detailMethod = 'text';
$dbo->cols['ct_email']->option->newMethod = 'text';
$dbo->cols['ct_email']->option->editMethod = 'text';
$dbo->cols['ct_concode'] = new DBO_COL('ct_concode', 'varchar', '-1', '28');
$dbo->cols['ct_concode']->inputTypeDefault = 'select';
$dbo->cols['ct_concode']->searchMode = 'exact';
$dbo->cols['ct_concode']->capContClassDefault = array();
$dbo->cols['ct_concode']->valContClassDefault = array();
$dbo->cols['ct_concode']->option->default = 'select con_code, con_name from fccountry order by con_name';
$dbo->cols['ct_concode']->option->defaultMethod = 'sql';
$dbo->cols['ct_concode']->option->searchMethod = 'text';
$dbo->cols['ct_concode']->option->listMethod = 'text';
$dbo->cols['ct_concode']->option->detailMethod = 'text';
$dbo->cols['ct_concode']->option->newMethod = 'text';
$dbo->cols['ct_concode']->option->editMethod = 'text';
$dbo->cols['org_id'] = new DBO_COL('org_id', 'int4', '4', '-1');
$dbo->cols['org_id']->inputTypeDefault = 'select';
$dbo->cols['org_id']->searchMode = 'exact';
$dbo->cols['org_id']->capContClassDefault = array();
$dbo->cols['org_id']->valContClassDefault = array();
$dbo->cols['org_id']->option->default = 'select org_id, org_name from fcorg order by org_name';
$dbo->cols['org_id']->option->defaultMethod = 'sql';
$dbo->cols['org_id']->option->searchMethod = 'text';
$dbo->cols['org_id']->option->listMethod = 'text';
$dbo->cols['org_id']->option->detailMethod = 'text';
$dbo->cols['org_id']->option->newMethod = 'text';
$dbo->cols['org_id']->option->editMethod = 'text';
$dbo->cols['org_type'] = new DBO_COL('org_type', 'varchar', '-1', '36');
$dbo->cols['org_type']->inputTypeDefault = 'text';
$dbo->cols['org_type']->searchMode = 'exact';
$dbo->cols['org_type']->capContClassDefault = array();
$dbo->cols['org_type']->valContClassDefault = array();
$dbo->cols['org_type']->option->defaultMethod = 'text';
$dbo->cols['org_type']->option->searchMethod = 'text';
$dbo->cols['org_type']->option->listMethod = 'text';
$dbo->cols['org_type']->option->detailMethod = 'text';
$dbo->cols['org_type']->option->newMethod = 'text';
$dbo->cols['org_type']->option->editMethod = 'text';
$dbo->cols['org_external'] = new DBO_COL('org_external', 'varchar', '-1', '5');
$dbo->cols['org_external']->inputTypeDefault = 'text';
$dbo->cols['org_external']->searchMode = 'exact';
$dbo->cols['org_external']->capContClassDefault = array();
$dbo->cols['org_external']->valContClassDefault = array();
$dbo->cols['org_external']->option->defaultMethod = 'text';
$dbo->cols['org_external']->option->searchMethod = 'text';
$dbo->cols['org_external']->option->listMethod = 'text';
$dbo->cols['org_external']->option->detailMethod = 'text';
$dbo->cols['org_external']->option->newMethod = 'text';
$dbo->cols['org_external']->option->editMethod = 'text';
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
$dbo->cols['org_parentid'] = new DBO_COL('org_parentid', 'int4', '4', '-1');
$dbo->cols['org_parentid']->inputTypeDefault = 'text';
$dbo->cols['org_parentid']->searchMode = 'exact';
$dbo->cols['org_parentid']->capContClassDefault = array();
$dbo->cols['org_parentid']->valContClassDefault = array();
$dbo->cols['org_parentid']->option->defaultMethod = 'text';
$dbo->cols['org_parentid']->option->searchMethod = 'text';
$dbo->cols['org_parentid']->option->listMethod = 'text';
$dbo->cols['org_parentid']->option->detailMethod = 'text';
$dbo->cols['org_parentid']->option->newMethod = 'text';
$dbo->cols['org_parentid']->option->editMethod = 'text';
$dbo->cols['org_primaryid'] = new DBO_COL('org_primaryid', 'varchar', '-1', '204');
$dbo->cols['org_primaryid']->inputTypeDefault = 'text';
$dbo->cols['org_primaryid']->searchMode = 'exact';
$dbo->cols['org_primaryid']->capContClassDefault = array();
$dbo->cols['org_primaryid']->valContClassDefault = array();
$dbo->cols['org_primaryid']->option->defaultMethod = 'text';
$dbo->cols['org_primaryid']->option->searchMethod = 'text';
$dbo->cols['org_primaryid']->option->listMethod = 'text';
$dbo->cols['org_primaryid']->option->detailMethod = 'text';
$dbo->cols['org_primaryid']->option->newMethod = 'text';
$dbo->cols['org_primaryid']->option->editMethod = 'text';
$dbo->cols['org_address'] = new DBO_COL('org_address', 'varchar', '-1', '4004');
$dbo->cols['org_address']->inputTypeDefault = 'text';
$dbo->cols['org_address']->searchMode = 'exact';
$dbo->cols['org_address']->capContClassDefault = array();
$dbo->cols['org_address']->valContClassDefault = array();
$dbo->cols['org_address']->option->defaultMethod = 'text';
$dbo->cols['org_address']->option->searchMethod = 'text';
$dbo->cols['org_address']->option->listMethod = 'text';
$dbo->cols['org_address']->option->detailMethod = 'text';
$dbo->cols['org_address']->option->newMethod = 'text';
$dbo->cols['org_address']->option->editMethod = 'text';
$dbo->cols['org_contactno'] = new DBO_COL('org_contactno', 'varchar', '-1', '104');
$dbo->cols['org_contactno']->inputTypeDefault = 'text';
$dbo->cols['org_contactno']->searchMode = 'exact';
$dbo->cols['org_contactno']->capContClassDefault = array();
$dbo->cols['org_contactno']->valContClassDefault = array();
$dbo->cols['org_contactno']->option->defaultMethod = 'text';
$dbo->cols['org_contactno']->option->searchMethod = 'text';
$dbo->cols['org_contactno']->option->listMethod = 'text';
$dbo->cols['org_contactno']->option->detailMethod = 'text';
$dbo->cols['org_contactno']->option->newMethod = 'text';
$dbo->cols['org_contactno']->option->editMethod = 'text';
$dbo->cols['org_status'] = new DBO_COL('org_status', 'varchar', '-1', '16');
$dbo->cols['org_status']->inputTypeDefault = 'text';
$dbo->cols['org_status']->searchMode = 'exact';
$dbo->cols['org_status']->capContClassDefault = array();
$dbo->cols['org_status']->valContClassDefault = array();
$dbo->cols['org_status']->option->defaultMethod = 'text';
$dbo->cols['org_status']->option->searchMethod = 'text';
$dbo->cols['org_status']->option->listMethod = 'text';
$dbo->cols['org_status']->option->detailMethod = 'text';
$dbo->cols['org_status']->option->newMethod = 'text';
$dbo->cols['org_status']->option->editMethod = 'text';
$dbo->cols['org_lccode'] = new DBO_COL('org_lccode', 'varchar', '-1', '36');
$dbo->cols['org_lccode']->inputTypeDefault = 'text';
$dbo->cols['org_lccode']->searchMode = 'exact';
$dbo->cols['org_lccode']->capContClassDefault = array();
$dbo->cols['org_lccode']->valContClassDefault = array();
$dbo->cols['org_lccode']->option->defaultMethod = 'text';
$dbo->cols['org_lccode']->option->searchMethod = 'text';
$dbo->cols['org_lccode']->option->listMethod = 'text';
$dbo->cols['org_lccode']->option->detailMethod = 'text';
$dbo->cols['org_lccode']->option->newMethod = 'text';
$dbo->cols['org_lccode']->option->editMethod = 'text';
$dbo->cols['org_concode'] = new DBO_COL('org_concode', 'varchar', '-1', '28');
$dbo->cols['org_concode']->inputTypeDefault = 'text';
$dbo->cols['org_concode']->searchMode = 'exact';
$dbo->cols['org_concode']->capContClassDefault = array();
$dbo->cols['org_concode']->valContClassDefault = array();
$dbo->cols['org_concode']->option->defaultMethod = 'text';
$dbo->cols['org_concode']->option->searchMethod = 'text';
$dbo->cols['org_concode']->option->listMethod = 'text';
$dbo->cols['org_concode']->option->detailMethod = 'text';
$dbo->cols['org_concode']->option->newMethod = 'text';
$dbo->cols['org_concode']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_contactsetup_custom_new';
function dbo_contactsetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_contactsetup_custom_edit';
function dbo_contactsetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_contactsetup_custom_search';
function dbo_contactsetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_contactsetup_custom_delete';
function dbo_contactsetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_contactsetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>