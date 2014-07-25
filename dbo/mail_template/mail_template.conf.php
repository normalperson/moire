<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'mail_template';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->fileSaveMode = 511;
$dbo->table = 'mmailtemplate';
$dbo->key = array('mt_code');
$dbo->sql = 'select * from mmailtemplate';
$dbo->col = array('mt_code', 'mt_desc', 'mt_recipient_to', 'mt_recipient_cc', 'mt_subject', 'mt_content', 'mt_status', 'mt_internal_userid');
$dbo->colList = array('mt_code', 'mt_desc', 'mt_subject');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('mt_code', 'mt_desc', 'mt_recipient_to', 'mt_recipient_cc', 'mt_subject', 'mt_content');
$dbo->colNew = array('mt_code', 'mt_desc', 'mt_recipient_to', 'mt_recipient_cc', 'mt_internal_userid', 'mt_subject', 'mt_content', 'mt_status');
$dbo->colEdit = array('mt_code', 'mt_desc', 'mt_recipient_to', 'mt_recipient_cc', 'mt_internal_userid', 'mt_subject', 'mt_content', 'mt_status');
$dbo->colSearch = array('mt_code', 'mt_desc', 'mt_recipient_to', 'mt_recipient_cc', 'mt_subject', 'mt_content');
$dbo->colExport = array('mt_code', 'mt_desc', 'mt_recipient_to', 'mt_recipient_cc', 'mt_subject', 'mt_content');
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

$dbo->cols['mt_code'] = new DBO_COL('mt_code', 'varchar', '-1', '36');
$dbo->cols['mt_code']->inputTypeDefault = 'text';
$dbo->cols['mt_code']->attributeEdit = array('readonly'=>array('readonly'));
$dbo->cols['mt_code']->searchMode = 'exact';
$dbo->cols['mt_code']->capContClassDefault = array();
$dbo->cols['mt_code']->valContClassDefault = array();
$dbo->cols['mt_code']->option->defaultMethod = 'text';
$dbo->cols['mt_code']->option->searchMethod = 'text';
$dbo->cols['mt_code']->option->listMethod = 'text';
$dbo->cols['mt_code']->option->detailMethod = 'text';
$dbo->cols['mt_code']->option->newMethod = 'text';
$dbo->cols['mt_code']->option->editMethod = 'text';
$dbo->cols['mt_desc'] = new DBO_COL('mt_desc', 'varchar', '-1', '204');
$dbo->cols['mt_desc']->inputTypeDefault = 'text';
$dbo->cols['mt_desc']->searchMode = 'exact';
$dbo->cols['mt_desc']->capContClassDefault = array();
$dbo->cols['mt_desc']->valContClassDefault = array();
$dbo->cols['mt_desc']->option->defaultMethod = 'text';
$dbo->cols['mt_desc']->option->searchMethod = 'text';
$dbo->cols['mt_desc']->option->listMethod = 'text';
$dbo->cols['mt_desc']->option->detailMethod = 'text';
$dbo->cols['mt_desc']->option->newMethod = 'text';
$dbo->cols['mt_desc']->option->editMethod = 'text';
$dbo->cols['mt_recipient_to'] = new DBO_COL('mt_recipient_to', 'varchar', '-1', '2004');
$dbo->cols['mt_recipient_to']->inputTypeDefault = 'MultiSelect2';
$dbo->cols['mt_recipient_to']->searchMode = 'exact';
$dbo->cols['mt_recipient_to']->capContClassDefault = array();
$dbo->cols['mt_recipient_to']->valContClassDefault = array();
$dbo->cols['mt_recipient_to']->option->default = 'select  usr_userid||\':\'||usr_email as usr_email, usr_name, \'Users\' from fcuser where usr_email is not null 
union all
select \'[[\'||udv_code||\']]\', udv_name, \'UDV\' from fcudv where udv_cat = \'EMAIL_RECIPIENT\'
order by 3, 2';
$dbo->cols['mt_recipient_to']->option->defaultMethod = 'sql';
$dbo->cols['mt_recipient_to']->option->searchMethod = 'text';
$dbo->cols['mt_recipient_to']->option->listMethod = 'text';
$dbo->cols['mt_recipient_to']->option->detailMethod = 'text';
$dbo->cols['mt_recipient_to']->option->newMethod = 'text';
$dbo->cols['mt_recipient_to']->option->editMethod = 'text';
$dbo->cols['mt_recipient_cc'] = new DBO_COL('mt_recipient_cc', 'varchar', '-1', '2004');
$dbo->cols['mt_recipient_cc']->inputTypeDefault = 'MultiSelect2';
$dbo->cols['mt_recipient_cc']->searchMode = 'exact';
$dbo->cols['mt_recipient_cc']->capContClassDefault = array();
$dbo->cols['mt_recipient_cc']->valContClassDefault = array();
$dbo->cols['mt_recipient_cc']->option->default = 'select  usr_userid||\':\'||usr_email as usr_email, usr_name, \'Users\' from fcuser where usr_email is not null 
union all
select \'[[\'||udv_code||\']]\', udv_name, \'UDV\' from fcudv where udv_cat = \'EMAIL_RECIPIENT\'
order by 3, 2';
$dbo->cols['mt_recipient_cc']->option->defaultMethod = 'sql';
$dbo->cols['mt_recipient_cc']->option->searchMethod = 'text';
$dbo->cols['mt_recipient_cc']->option->listMethod = 'text';
$dbo->cols['mt_recipient_cc']->option->detailMethod = 'text';
$dbo->cols['mt_recipient_cc']->option->newMethod = 'text';
$dbo->cols['mt_recipient_cc']->option->editMethod = 'text';
$dbo->cols['mt_subject'] = new DBO_COL('mt_subject', 'varchar', '-1', '504');
$dbo->cols['mt_subject']->inputTypeDefault = 'text';
$dbo->cols['mt_subject']->searchMode = 'exact';
$dbo->cols['mt_subject']->capContClassDefault = array();
$dbo->cols['mt_subject']->valContClassDefault = array();
$dbo->cols['mt_subject']->option->defaultMethod = 'text';
$dbo->cols['mt_subject']->option->searchMethod = 'text';
$dbo->cols['mt_subject']->option->listMethod = 'text';
$dbo->cols['mt_subject']->option->detailMethod = 'text';
$dbo->cols['mt_subject']->option->newMethod = 'text';
$dbo->cols['mt_subject']->option->editMethod = 'text';
$dbo->cols['mt_content'] = new DBO_COL('mt_content', 'text', '-1', '-1');
$dbo->cols['mt_content']->inputTypeDefault = 'Summernote_WYSIWYG';
$dbo->cols['mt_content']->searchMode = 'exact';
$dbo->cols['mt_content']->capContClassDefault = array();
$dbo->cols['mt_content']->valContClassDefault = array();
$dbo->cols['mt_content']->option->defaultMethod = 'text';
$dbo->cols['mt_content']->option->searchMethod = 'text';
$dbo->cols['mt_content']->option->listMethod = 'text';
$dbo->cols['mt_content']->option->detailMethod = 'text';
$dbo->cols['mt_content']->option->newMethod = 'text';
$dbo->cols['mt_content']->option->editMethod = 'text';
$dbo->cols['mt_status'] = new DBO_COL('mt_status', 'varchar', '-1', '36');
$dbo->cols['mt_status']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['mt_status']->searchMode = 'exact';
$dbo->cols['mt_status']->capContClassDefault = array();
$dbo->cols['mt_status']->valContClassDefault = array();
$dbo->cols['mt_status']->option->default = 'ACTIVE/Active
INACTIVE/In-Active';
$dbo->cols['mt_status']->option->defaultMethod = 'text';
$dbo->cols['mt_status']->option->searchMethod = 'text';
$dbo->cols['mt_status']->option->listMethod = 'text';
$dbo->cols['mt_status']->option->detailMethod = 'text';
$dbo->cols['mt_status']->option->newMethod = 'text';
$dbo->cols['mt_status']->option->editMethod = 'text';
$dbo->cols['mt_internal_userid'] = new DBO_COL('mt_internal_userid', 'varchar', '-1', '2004');
$dbo->cols['mt_internal_userid']->inputTypeDefault = 'MultiSelect2';
$dbo->cols['mt_internal_userid']->searchMode = 'exact';
$dbo->cols['mt_internal_userid']->capContClassDefault = array();
$dbo->cols['mt_internal_userid']->valContClassDefault = array();
$dbo->cols['mt_internal_userid']->option->default = 'select usr_userid, usr_name, \'Users\' from fcuser 
union all
select \'[[\'||udv_code||\']]\', udv_name, \'UDV\' from fcudv where udv_cat = \'USERID\'
order by 3, 2';
$dbo->cols['mt_internal_userid']->option->defaultMethod = 'sql';
$dbo->cols['mt_internal_userid']->option->searchMethod = 'text';
$dbo->cols['mt_internal_userid']->option->listMethod = 'text';
$dbo->cols['mt_internal_userid']->option->detailMethod = 'text';
$dbo->cols['mt_internal_userid']->option->newMethod = 'text';
$dbo->cols['mt_internal_userid']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_mail_template_custom_new';
function dbo_mail_template_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_mail_template_custom_edit';
function dbo_mail_template_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_mail_template_custom_search';
function dbo_mail_template_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_mail_template_custom_delete';
function dbo_mail_template_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_mail_template_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>