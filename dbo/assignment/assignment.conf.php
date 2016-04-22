<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'assignment';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjobsheet';
$dbo->key = array('js_id');
$dbo->sql = 'select js_cuid, js_ctid, to_char(js_request_date,\'DD-MON-YYYY HH24:MI:SS\') as js_request_date , js_title, js_status, js_completiondate, js_assignto,
org_name,ct_name,js_id, \'\' as taskaging from mjobsheet
join fcorg on js_cuid = org_id
join pndcontact on js_ctid = ct_id
where js_status = \'PENDING ACKNOWLEDGE\'';
$dbo->col = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto', 'org_name', 'ct_name', 'js_id', 'taskaging');
$dbo->colList = array('js_id', 'org_name', 'ct_name', 'js_title', 'js_request_date', 'js_status', 'js_assignto');
$dbo->colListEdit = array('js_assignto');
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto', 'org_name', 'ct_name', 'js_id', 'taskaging');
$dbo->colNew = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto', 'org_name', 'ct_name', 'js_id', 'taskaging');
$dbo->colEdit = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto', 'org_name', 'ct_name', 'js_id', 'taskaging');
$dbo->colSearch = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto', 'org_name', 'ct_name', 'js_id', 'taskaging');
$dbo->colExport = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto', 'org_name', 'ct_name', 'js_id', 'taskaging');
$dbo->colSort = array();
$dbo->canSearch = false;
$dbo->canNew = false;
$dbo->canEdit = false;
$dbo->canDelete = false;
$dbo->canDetail = false;
$dbo->canListEdit = true;
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

$dbo->cols['js_cuid'] = new DBO_COL('js_cuid', 'int4', '4', '-1');
$dbo->cols['js_cuid']->inputTypeDefault = 'text';
$dbo->cols['js_cuid']->searchMode = 'exact';
$dbo->cols['js_cuid']->capContClassDefault = array();
$dbo->cols['js_cuid']->valContClassDefault = array();
$dbo->cols['js_cuid']->option->defaultMethod = 'text';
$dbo->cols['js_cuid']->option->searchMethod = 'text';
$dbo->cols['js_cuid']->option->listMethod = 'text';
$dbo->cols['js_cuid']->option->detailMethod = 'text';
$dbo->cols['js_cuid']->option->newMethod = 'text';
$dbo->cols['js_cuid']->option->editMethod = 'text';
$dbo->cols['js_ctid'] = new DBO_COL('js_ctid', 'int4', '4', '-1');
$dbo->cols['js_ctid']->inputTypeDefault = 'text';
$dbo->cols['js_ctid']->searchMode = 'exact';
$dbo->cols['js_ctid']->capContClassDefault = array();
$dbo->cols['js_ctid']->valContClassDefault = array();
$dbo->cols['js_ctid']->option->defaultMethod = 'text';
$dbo->cols['js_ctid']->option->searchMethod = 'text';
$dbo->cols['js_ctid']->option->listMethod = 'text';
$dbo->cols['js_ctid']->option->detailMethod = 'text';
$dbo->cols['js_ctid']->option->newMethod = 'text';
$dbo->cols['js_ctid']->option->editMethod = 'text';
$dbo->cols['js_request_date'] = new DBO_COL('js_request_date', 'text', '-1', '-1');
$dbo->cols['js_request_date']->inputTypeDefault = 'text';
$dbo->cols['js_request_date']->searchMode = 'exact';
$dbo->cols['js_request_date']->capContClassDefault = array();
$dbo->cols['js_request_date']->valContClassDefault = array();
$dbo->cols['js_request_date']->option->defaultMethod = 'text';
$dbo->cols['js_request_date']->option->searchMethod = 'text';
$dbo->cols['js_request_date']->option->listMethod = 'text';
$dbo->cols['js_request_date']->option->detailMethod = 'text';
$dbo->cols['js_request_date']->option->newMethod = 'text';
$dbo->cols['js_request_date']->option->editMethod = 'text';
$dbo->cols['js_title'] = new DBO_COL('js_title', 'varchar', '-1', '104');
$dbo->cols['js_title']->inputTypeDefault = 'text';
$dbo->cols['js_title']->searchMode = 'exact';
$dbo->cols['js_title']->capContClassDefault = array();
$dbo->cols['js_title']->valContClassDefault = array();
$dbo->cols['js_title']->option->defaultMethod = 'text';
$dbo->cols['js_title']->option->searchMethod = 'text';
$dbo->cols['js_title']->option->listMethod = 'text';
$dbo->cols['js_title']->option->detailMethod = 'text';
$dbo->cols['js_title']->option->newMethod = 'text';
$dbo->cols['js_title']->option->editMethod = 'text';
$dbo->cols['js_status'] = new DBO_COL('js_status', 'varchar', '-1', '104');
$dbo->cols['js_status']->inputTypeDefault = 'text';
$dbo->cols['js_status']->searchMode = 'exact';
$dbo->cols['js_status']->capContClassDefault = array();
$dbo->cols['js_status']->valContClassDefault = array();
$dbo->cols['js_status']->option->defaultMethod = 'text';
$dbo->cols['js_status']->option->searchMethod = 'text';
$dbo->cols['js_status']->option->listMethod = 'text';
$dbo->cols['js_status']->option->detailMethod = 'text';
$dbo->cols['js_status']->option->newMethod = 'text';
$dbo->cols['js_status']->option->editMethod = 'text';
$dbo->cols['js_completiondate'] = new DBO_COL('js_completiondate', 'timestamptz', '8', '-1');
$dbo->cols['js_completiondate']->inputTypeDefault = 'text';
$dbo->cols['js_completiondate']->searchMode = 'exact';
$dbo->cols['js_completiondate']->capContClassDefault = array();
$dbo->cols['js_completiondate']->valContClassDefault = array();
$dbo->cols['js_completiondate']->option->defaultMethod = 'text';
$dbo->cols['js_completiondate']->option->searchMethod = 'text';
$dbo->cols['js_completiondate']->option->listMethod = 'text';
$dbo->cols['js_completiondate']->option->detailMethod = 'text';
$dbo->cols['js_completiondate']->option->newMethod = 'text';
$dbo->cols['js_completiondate']->option->editMethod = 'text';
$dbo->cols['js_assignto'] = new DBO_COL('js_assignto', 'varchar', '-1', '54');
$dbo->cols['js_assignto']->inputTypeDefault = 'select';
$dbo->cols['js_assignto']->searchMode = 'exact';
$dbo->cols['js_assignto']->capContClassDefault = array();
$dbo->cols['js_assignto']->valContClassDefault = array();
$dbo->cols['js_assignto']->option->default = 'select usr_userid,usr_name from fcuser
where usr_userid in (\'artist1\',\'artist2\')';
$dbo->cols['js_assignto']->option->defaultMethod = 'sql';
$dbo->cols['js_assignto']->option->searchMethod = 'text';
$dbo->cols['js_assignto']->option->listMethod = 'text';
$dbo->cols['js_assignto']->option->detailMethod = 'text';
$dbo->cols['js_assignto']->option->newMethod = 'text';
$dbo->cols['js_assignto']->option->editMethod = 'text';
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
$dbo->cols['js_id'] = new DBO_COL('js_id', 'int4', '4', '-1');
$dbo->cols['js_id']->inputTypeDefault = 'text';
$dbo->cols['js_id']->searchMode = 'exact';
$dbo->cols['js_id']->capContClassDefault = array();
$dbo->cols['js_id']->valContClassDefault = array();
$dbo->cols['js_id']->option->defaultMethod = 'text';
$dbo->cols['js_id']->option->searchMethod = 'text';
$dbo->cols['js_id']->option->listMethod = 'text';
$dbo->cols['js_id']->option->detailMethod = 'text';
$dbo->cols['js_id']->option->newMethod = 'text';
$dbo->cols['js_id']->option->editMethod = 'text';
$dbo->cols['taskaging'] = new DBO_COL('taskaging', 'unknown', '-2', '-1');
$dbo->cols['taskaging']->inputTypeDefault = 'text';
$dbo->cols['taskaging']->searchMode = 'exact';
$dbo->cols['taskaging']->capContClassDefault = array();
$dbo->cols['taskaging']->valContClassDefault = array();
$dbo->cols['taskaging']->option->defaultMethod = 'text';
$dbo->cols['taskaging']->option->searchMethod = 'text';
$dbo->cols['taskaging']->option->listMethod = 'text';
$dbo->cols['taskaging']->option->detailMethod = 'text';
$dbo->cols['taskaging']->option->newMethod = 'text';
$dbo->cols['taskaging']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_assignment_custom_new';
function dbo_assignment_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_assignment_custom_edit';
function dbo_assignment_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_assignment_custom_search';
function dbo_assignment_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_assignment_custom_delete';
function dbo_assignment_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_assignment_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>