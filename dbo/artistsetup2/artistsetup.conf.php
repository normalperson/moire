<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'artistsetup';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fc_user';
$dbo->key = array('usr_userid');
$dbo->sql = 'select fcuser.*, \'\' as password1, \'\' as password2, string_agg(cast(ma_id as varchar), \', \') as skillids 
from fcuser left join martistskill on usr_userid = ma_usruserid group by usr_userid';
$dbo->col = array('usr_userid', 'usr_password', 'usr_created', 'usr_name', 'usr_email', 'usr_last_active', 'usr_last_success_login', 'usr_last_fail_login', 'usr_group', 'usr_sessiondata', 'usr_status', 'usr_langcode', 'password1', 'password2', 'skillids');
$dbo->colList = array('usr_userid', 'usr_created', 'usr_name', 'usr_email');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('usr_userid', 'usr_created', 'usr_name', 'usr_email', 'usr_last_active', 'usr_last_success_login', 'usr_last_fail_login', 'usr_group', 'usr_status', 'usr_langcode', 'skillids');
$dbo->colNew = array('usr_userid', 'usr_password', 'usr_name', 'usr_email', 'usr_status', 'skillids');
$dbo->colEdit = array('usr_userid', 'usr_name', 'usr_email', 'usr_status');
$dbo->colSearch = array('usr_userid', 'usr_name');
$dbo->colExport = array('usr_userid', 'usr_password', 'usr_created', 'usr_name', 'usr_email', 'usr_last_active', 'usr_last_success_login', 'usr_last_fail_login', 'usr_group', 'usr_sessiondata', 'usr_status', 'usr_langcode', 'skillids');
$dbo->colSort = array();
$dbo->canSearch = true;
$dbo->canNew = true;
$dbo->canEdit = true;
$dbo->canDelete = true;
$dbo->canDetail = true;
$dbo->canListEdit = false;
$dbo->canListNew = false;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->newModifier = 'dbo_artistsetup_custom_new';
$dbo->editModifier = 'dbo_artistsetup_custom_edit';
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

$dbo->cols['usr_userid'] = new DBO_COL('usr_userid', 'varchar', '-1', '54');
$dbo->cols['usr_userid']->inputTypeDefault = 'text';
$dbo->cols['usr_userid']->searchMode = 'exact';
$dbo->cols['usr_userid']->capContClassDefault = array();
$dbo->cols['usr_userid']->valContClassDefault = array();
$dbo->cols['usr_userid']->option->defaultMethod = 'text';
$dbo->cols['usr_userid']->option->searchMethod = 'text';
$dbo->cols['usr_userid']->option->listMethod = 'text';
$dbo->cols['usr_userid']->option->detailMethod = 'text';
$dbo->cols['usr_userid']->option->newMethod = 'text';
$dbo->cols['usr_userid']->option->editMethod = 'text';
$dbo->cols['usr_password'] = new DBO_COL('usr_password', 'varchar', '-1', '54');
$dbo->cols['usr_password']->inputTypeDefault = 'password';
$dbo->cols['usr_password']->searchMode = 'exact';
$dbo->cols['usr_password']->capContClassDefault = array();
$dbo->cols['usr_password']->valContClassDefault = array();
$dbo->cols['usr_password']->option->defaultMethod = 'text';
$dbo->cols['usr_password']->option->searchMethod = 'text';
$dbo->cols['usr_password']->option->listMethod = 'text';
$dbo->cols['usr_password']->option->detailMethod = 'text';
$dbo->cols['usr_password']->option->newMethod = 'text';
$dbo->cols['usr_password']->option->editMethod = 'text';
$dbo->cols['usr_created'] = new DBO_COL('usr_created', 'timestamptz', '8', '-1');
$dbo->cols['usr_created']->inputTypeDefault = 'text';
$dbo->cols['usr_created']->searchMode = 'exact';
$dbo->cols['usr_created']->capContClassDefault = array();
$dbo->cols['usr_created']->valContClassDefault = array();
$dbo->cols['usr_created']->option->defaultMethod = 'text';
$dbo->cols['usr_created']->option->searchMethod = 'text';
$dbo->cols['usr_created']->option->listMethod = 'text';
$dbo->cols['usr_created']->option->detailMethod = 'text';
$dbo->cols['usr_created']->option->newMethod = 'text';
$dbo->cols['usr_created']->option->editMethod = 'text';
$dbo->cols['usr_name'] = new DBO_COL('usr_name', 'varchar', '-1', '104');
$dbo->cols['usr_name']->inputTypeDefault = 'text';
$dbo->cols['usr_name']->searchMode = 'exact';
$dbo->cols['usr_name']->capContClassDefault = array();
$dbo->cols['usr_name']->valContClassDefault = array();
$dbo->cols['usr_name']->option->defaultMethod = 'text';
$dbo->cols['usr_name']->option->searchMethod = 'text';
$dbo->cols['usr_name']->option->listMethod = 'text';
$dbo->cols['usr_name']->option->detailMethod = 'text';
$dbo->cols['usr_name']->option->newMethod = 'text';
$dbo->cols['usr_name']->option->editMethod = 'text';
$dbo->cols['usr_email'] = new DBO_COL('usr_email', 'varchar', '-1', '54');
$dbo->cols['usr_email']->inputTypeDefault = 'email';
$dbo->cols['usr_email']->searchMode = 'exact';
$dbo->cols['usr_email']->capContClassDefault = array();
$dbo->cols['usr_email']->valContClassDefault = array();
$dbo->cols['usr_email']->option->defaultMethod = 'text';
$dbo->cols['usr_email']->option->searchMethod = 'text';
$dbo->cols['usr_email']->option->listMethod = 'text';
$dbo->cols['usr_email']->option->detailMethod = 'text';
$dbo->cols['usr_email']->option->newMethod = 'text';
$dbo->cols['usr_email']->option->editMethod = 'text';
$dbo->cols['usr_last_active'] = new DBO_COL('usr_last_active', 'timestamptz', '8', '-1');
$dbo->cols['usr_last_active']->inputTypeDefault = 'datetime';
$dbo->cols['usr_last_active']->searchMode = 'exact';
$dbo->cols['usr_last_active']->capContClassDefault = array();
$dbo->cols['usr_last_active']->valContClassDefault = array();
$dbo->cols['usr_last_active']->option->defaultMethod = 'text';
$dbo->cols['usr_last_active']->option->searchMethod = 'text';
$dbo->cols['usr_last_active']->option->listMethod = 'text';
$dbo->cols['usr_last_active']->option->detailMethod = 'text';
$dbo->cols['usr_last_active']->option->newMethod = 'text';
$dbo->cols['usr_last_active']->option->editMethod = 'text';
$dbo->cols['usr_last_success_login'] = new DBO_COL('usr_last_success_login', 'timestamptz', '8', '-1');
$dbo->cols['usr_last_success_login']->inputTypeDefault = 'datetime';
$dbo->cols['usr_last_success_login']->searchMode = 'exact';
$dbo->cols['usr_last_success_login']->capContClassDefault = array();
$dbo->cols['usr_last_success_login']->valContClassDefault = array();
$dbo->cols['usr_last_success_login']->option->defaultMethod = 'text';
$dbo->cols['usr_last_success_login']->option->searchMethod = 'text';
$dbo->cols['usr_last_success_login']->option->listMethod = 'text';
$dbo->cols['usr_last_success_login']->option->detailMethod = 'text';
$dbo->cols['usr_last_success_login']->option->newMethod = 'text';
$dbo->cols['usr_last_success_login']->option->editMethod = 'text';
$dbo->cols['usr_last_fail_login'] = new DBO_COL('usr_last_fail_login', 'timestamptz', '8', '-1');
$dbo->cols['usr_last_fail_login']->inputTypeDefault = 'datetime';
$dbo->cols['usr_last_fail_login']->searchMode = 'exact';
$dbo->cols['usr_last_fail_login']->capContClassDefault = array();
$dbo->cols['usr_last_fail_login']->valContClassDefault = array();
$dbo->cols['usr_last_fail_login']->option->defaultMethod = 'text';
$dbo->cols['usr_last_fail_login']->option->searchMethod = 'text';
$dbo->cols['usr_last_fail_login']->option->listMethod = 'text';
$dbo->cols['usr_last_fail_login']->option->detailMethod = 'text';
$dbo->cols['usr_last_fail_login']->option->newMethod = 'text';
$dbo->cols['usr_last_fail_login']->option->editMethod = 'text';
$dbo->cols['usr_group'] = new DBO_COL('usr_group', 'varchar', '-1', '1004');
$dbo->cols['usr_group']->inputTypeDefault = 'text';
$dbo->cols['usr_group']->searchMode = 'exact';
$dbo->cols['usr_group']->capContClassDefault = array();
$dbo->cols['usr_group']->valContClassDefault = array();
$dbo->cols['usr_group']->option->defaultMethod = 'text';
$dbo->cols['usr_group']->option->searchMethod = 'text';
$dbo->cols['usr_group']->option->listMethod = 'text';
$dbo->cols['usr_group']->option->detailMethod = 'text';
$dbo->cols['usr_group']->option->newMethod = 'text';
$dbo->cols['usr_group']->option->editMethod = 'text';
$dbo->cols['usr_sessiondata'] = new DBO_COL('usr_sessiondata', 'text', '-1', '-1');
$dbo->cols['usr_sessiondata']->inputTypeDefault = 'text';
$dbo->cols['usr_sessiondata']->searchMode = 'exact';
$dbo->cols['usr_sessiondata']->capContClassDefault = array();
$dbo->cols['usr_sessiondata']->valContClassDefault = array();
$dbo->cols['usr_sessiondata']->option->defaultMethod = 'text';
$dbo->cols['usr_sessiondata']->option->searchMethod = 'text';
$dbo->cols['usr_sessiondata']->option->listMethod = 'text';
$dbo->cols['usr_sessiondata']->option->detailMethod = 'text';
$dbo->cols['usr_sessiondata']->option->newMethod = 'text';
$dbo->cols['usr_sessiondata']->option->editMethod = 'text';
$dbo->cols['usr_status'] = new DBO_COL('usr_status', 'varchar', '-1', '36');
$dbo->cols['usr_status']->inputTypeDefault = 'text';
$dbo->cols['usr_status']->searchMode = 'exact';
$dbo->cols['usr_status']->capContClassDefault = array();
$dbo->cols['usr_status']->valContClassDefault = array();
$dbo->cols['usr_status']->option->defaultMethod = 'text';
$dbo->cols['usr_status']->option->searchMethod = 'text';
$dbo->cols['usr_status']->option->listMethod = 'text';
$dbo->cols['usr_status']->option->detailMethod = 'text';
$dbo->cols['usr_status']->option->newMethod = 'text';
$dbo->cols['usr_status']->option->editMethod = 'text';
$dbo->cols['usr_langcode'] = new DBO_COL('usr_langcode', 'varchar', '-1', '9');
$dbo->cols['usr_langcode']->inputTypeDefault = 'text';
$dbo->cols['usr_langcode']->searchMode = 'exact';
$dbo->cols['usr_langcode']->capContClassDefault = array();
$dbo->cols['usr_langcode']->valContClassDefault = array();
$dbo->cols['usr_langcode']->option->defaultMethod = 'text';
$dbo->cols['usr_langcode']->option->searchMethod = 'text';
$dbo->cols['usr_langcode']->option->listMethod = 'text';
$dbo->cols['usr_langcode']->option->detailMethod = 'text';
$dbo->cols['usr_langcode']->option->newMethod = 'text';
$dbo->cols['usr_langcode']->option->editMethod = 'text';
$dbo->cols['skillids'] = new DBO_COL('skillids', 'text', '-1', '-1');
$dbo->cols['skillids']->inputTypeDefault = 'checkbox';
$dbo->cols['skillids']->searchMode = 'exact';
$dbo->cols['skillids']->capContClassDefault = array();
$dbo->cols['skillids']->valContClassDefault = array();
$dbo->cols['skillids']->option->default = 'select jcl_id, jcl_title from mjobcatlookup';
$dbo->cols['skillids']->option->defaultMethod = 'sql';
$dbo->cols['skillids']->option->searchMethod = 'text';
$dbo->cols['skillids']->option->listMethod = 'text';
$dbo->cols['skillids']->option->detailMethod = 'text';
$dbo->cols['skillids']->option->newMethod = 'text';
$dbo->cols['skillids']->option->editMethod = 'text';
$dbo->cols['password1'] = new DBO_COL('password1', 'unknown', '-2', '-1');
$dbo->cols['password1']->inputTypeDefault = 'text';
$dbo->cols['password1']->capContClassDefault = array();
$dbo->cols['password1']->valContClassDefault = array();
$dbo->cols['password2'] = new DBO_COL('password2', 'unknown', '-2', '-1');
$dbo->cols['password2']->inputTypeDefault = 'text';
$dbo->cols['password2']->capContClassDefault = array();
$dbo->cols['password2']->valContClassDefault = array();

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
$dbo->newModifier = 'dbo_artistsetup_custom_new';
function dbo_artistsetup_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_artistsetup_custom_edit';
function dbo_artistsetup_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_artistsetup_custom_search';
function dbo_artistsetup_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_artistsetup_custom_delete';
function dbo_artistsetup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_artistsetup_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>