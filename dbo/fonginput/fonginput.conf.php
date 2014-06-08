<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'fonginput';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fonginput';
$dbo->key = array('fi_id');
$dbo->sql = 'select * from fonginput';
$dbo->col = array('fi_id', 'fi_created', 'fi_text', 'fi_textarea', 'fi_select', 'fi_multiselect', 'fi_checkbox', 'fi_radio', 'fi_html', 'fi_integer', 'fi_date', 'fi_datetime', 'fi_time', 'fi_timestamp', 'fi_file', 'fi_color', 'fi_datetimelocal', 'fi_email', 'fi_month', 'fi_number', 'fi_password', 'fi_range', 'fi_search', 'fi_tel', 'fi_url', 'fi_week');
$dbo->colList = array('fi_id', 'fi_created', 'fi_text', 'fi_textarea', 'fi_select', 'fi_date', 'fi_checkbox', 'fi_multiselect');
$dbo->colListEdit = array('fi_text', 'fi_checkbox');
$dbo->colListNew = array('fi_text');
$dbo->colListGlobalInput = array('fi_integer', 'fi_id', 'fi_created', 'fi_text', 'fi_textarea', 'fi_select', 'fi_multiselect', 'fi_checkbox', 'fi_radio', 'fi_date', 'fi_html');
$dbo->colDetail = array('fi_id', 'fi_created', 'fi_text', 'fi_textarea', 'fi_select', 'fi_multiselect', 'fi_checkbox', 'fi_radio', 'fi_date', 'fi_integer', 'fi_html', 'fi_datetime', 'fi_time', 'fi_timestamp', 'fi_file', 'fi_color', 'fi_datetimelocal', 'fi_email', 'fi_month', 'fi_number', 'fi_password', 'fi_range', 'fi_search', 'fi_tel', 'fi_url', 'fi_week');
$dbo->colNew = array('fi_text', 'fi_textarea', 'fi_html', 'fi_select', 'fi_multiselect', 'fi_radio', 'fi_checkbox', 'fi_integer', 'fi_date', 'fi_datetime', 'fi_time', 'fi_timestamp', 'fi_file', 'fi_color', 'fi_datetimelocal', 'fi_email', 'fi_month', 'fi_number', 'fi_password', 'fi_range', 'fi_search', 'fi_tel', 'fi_url', 'fi_week');
$dbo->colEdit = array('fi_text', 'fi_textarea', 'fi_html', 'fi_select', 'fi_multiselect', 'fi_radio', 'fi_checkbox', 'fi_integer', 'fi_date', 'fi_datetime', 'fi_time', 'fi_timestamp', 'fi_file', 'fi_color', 'fi_datetimelocal', 'fi_email', 'fi_month', 'fi_number', 'fi_password', 'fi_range', 'fi_search', 'fi_tel', 'fi_url', 'fi_week');
$dbo->colSearch = array('fi_created', 'fi_text', 'fi_multiselect');
$dbo->colExport = array('fi_id', 'fi_created', 'fi_text', 'fi_textarea', 'fi_select', 'fi_multiselect', 'fi_checkbox', 'fi_radio', 'fi_date', 'fi_integer', 'fi_html');
$dbo->colSort = array();
$dbo->canSearch = true;
$dbo->canNew = true;
$dbo->canEdit = true;
$dbo->canDelete = true;
$dbo->canDetail = true;
$dbo->canListEdit = true;
$dbo->canListNew = true;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->exportFormat = array('csv', 'excel');
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->layoutDetail = '1|1';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'AlwaysList';
$dbo->width = '100%';
$dbo->pageLinkCount = 7;
$dbo->recordPerPage = 10;
$dbo->showRecordNo = 1;
$dbo->defaultState = 'list';
$dbo->maxSortCount = 9;
$dbo->lang = 'EN-US';
$dbo->render = array();
$dbo->detailBack = 'Back';
$dbo->listEditSubmit = 'Submit';

$dbo->cols['fi_id'] = new DBO_COL('fi_id', 'int4', '4', '-1');
$dbo->cols['fi_id']->inputTypeDefault = 'text';
$dbo->cols['fi_id']->searchMode = 'exact';
$dbo->cols['fi_id']->capContClassDefault = array();
$dbo->cols['fi_id']->valContClassDefault = array();
$dbo->cols['fi_id']->option->defaultMethod = 'text';
$dbo->cols['fi_id']->option->searchMethod = 'text';
$dbo->cols['fi_id']->option->listMethod = 'text';
$dbo->cols['fi_id']->option->detailMethod = 'text';
$dbo->cols['fi_id']->option->newMethod = 'text';
$dbo->cols['fi_id']->option->editMethod = 'text';
$dbo->cols['fi_created'] = new DBO_COL('fi_created', 'timestamptz', '8', '-1');
$dbo->cols['fi_created']->displayDataType = 'datetime';
$dbo->cols['fi_created']->inputTypeDefault = 'text';
$dbo->cols['fi_created']->searchMode = 'exact';
$dbo->cols['fi_created']->capContClassDefault = array();
$dbo->cols['fi_created']->valContClassDefault = array();
$dbo->cols['fi_created']->option->defaultMethod = 'text';
$dbo->cols['fi_created']->option->searchMethod = 'text';
$dbo->cols['fi_created']->option->listMethod = 'text';
$dbo->cols['fi_created']->option->detailMethod = 'text';
$dbo->cols['fi_created']->option->newMethod = 'text';
$dbo->cols['fi_created']->option->editMethod = 'text';
$dbo->cols['fi_text'] = new DBO_COL('fi_text', 'varchar', '-1', '504');
$dbo->cols['fi_text']->defaultValue = 'default value for text';
$dbo->cols['fi_text']->inputTypeDefault = 'text';
$dbo->cols['fi_text']->searchMode = 'exact';
$dbo->cols['fi_text']->capContClassDefault = array();
$dbo->cols['fi_text']->valContClassDefault = array();
$dbo->cols['fi_text']->option->defaultMethod = 'text';
$dbo->cols['fi_text']->option->searchMethod = 'text';
$dbo->cols['fi_text']->option->listMethod = 'text';
$dbo->cols['fi_text']->option->detailMethod = 'text';
$dbo->cols['fi_text']->option->newMethod = 'text';
$dbo->cols['fi_text']->option->editMethod = 'text';
$dbo->cols['fi_textarea'] = new DBO_COL('fi_textarea', 'text', '-1', '-1');
$dbo->cols['fi_textarea']->inputTypeDefault = 'textarea';
$dbo->cols['fi_textarea']->size = '50, 10';
$dbo->cols['fi_textarea']->searchMode = 'exact';
$dbo->cols['fi_textarea']->capContClassDefault = array();
$dbo->cols['fi_textarea']->valContClassDefault = array();
$dbo->cols['fi_textarea']->option->defaultMethod = 'text';
$dbo->cols['fi_textarea']->option->searchMethod = 'text';
$dbo->cols['fi_textarea']->option->listMethod = 'text';
$dbo->cols['fi_textarea']->option->detailMethod = 'text';
$dbo->cols['fi_textarea']->option->newMethod = 'text';
$dbo->cols['fi_textarea']->option->editMethod = 'text';
$dbo->cols['fi_select'] = new DBO_COL('fi_select', 'varchar', '-1', '504');
$dbo->cols['fi_select']->inputTypeDefault = 'select';
$dbo->cols['fi_select']->searchMode = 'exact';
$dbo->cols['fi_select']->capContClassDefault = array();
$dbo->cols['fi_select']->valContClassDefault = array();
$dbo->cols['fi_select']->option->default = 'select fo_code, fo_desc from fongoption where fo_cat = \'alpha\'';
$dbo->cols['fi_select']->option->defaultMethod = 'sql';
$dbo->cols['fi_select']->option->searchMethod = 'text';
$dbo->cols['fi_select']->option->listMethod = 'text';
$dbo->cols['fi_select']->option->detailMethod = 'text';
$dbo->cols['fi_select']->option->newMethod = 'text';
$dbo->cols['fi_select']->option->editMethod = 'text';
$dbo->cols['fi_multiselect'] = new DBO_COL('fi_multiselect', 'varchar', '-1', '504');
$dbo->cols['fi_multiselect']->inputTypeDefault = 'multiselect';
$dbo->cols['fi_multiselect']->searchMode = 'exact';
$dbo->cols['fi_multiselect']->capContClassDefault = array();
$dbo->cols['fi_multiselect']->valContClassDefault = array();
$dbo->cols['fi_multiselect']->option->default = 'select fo_code, fo_desc from fongoption where fo_cat = \'alpha\'';
$dbo->cols['fi_multiselect']->option->defaultMethod = 'sql';
$dbo->cols['fi_multiselect']->option->searchMethod = 'text';
$dbo->cols['fi_multiselect']->option->listMethod = 'text';
$dbo->cols['fi_multiselect']->option->detailMethod = 'text';
$dbo->cols['fi_multiselect']->option->newMethod = 'text';
$dbo->cols['fi_multiselect']->option->editMethod = 'text';
$dbo->cols['fi_checkbox'] = new DBO_COL('fi_checkbox', 'varchar', '-1', '504');
$dbo->cols['fi_checkbox']->inputTypeDefault = 'checkbox';
$dbo->cols['fi_checkbox']->size = 5;
$dbo->cols['fi_checkbox']->searchMode = 'exact';
$dbo->cols['fi_checkbox']->capContClassDefault = array();
$dbo->cols['fi_checkbox']->valContClassDefault = array();
$dbo->cols['fi_checkbox']->option->default = 'select fo_code, fo_desc from fongoption where fo_cat = \'alpha\'';
$dbo->cols['fi_checkbox']->option->defaultMethod = 'sql';
$dbo->cols['fi_checkbox']->option->searchMethod = 'text';
$dbo->cols['fi_checkbox']->option->listMethod = 'text';
$dbo->cols['fi_checkbox']->option->detailMethod = 'text';
$dbo->cols['fi_checkbox']->option->newMethod = 'text';
$dbo->cols['fi_checkbox']->option->editMethod = 'text';
$dbo->cols['fi_radio'] = new DBO_COL('fi_radio', 'varchar', '-1', '504');
$dbo->cols['fi_radio']->inputTypeDefault = 'radio';
$dbo->cols['fi_radio']->size = 3;
$dbo->cols['fi_radio']->searchMode = 'exact';
$dbo->cols['fi_radio']->capContClassDefault = array();
$dbo->cols['fi_radio']->valContClassDefault = array();
$dbo->cols['fi_radio']->option->default = 'select fo_code, fo_desc from fongoption where fo_cat = \'alpha\'';
$dbo->cols['fi_radio']->option->defaultMethod = 'sql';
$dbo->cols['fi_radio']->option->searchMethod = 'text';
$dbo->cols['fi_radio']->option->listMethod = 'text';
$dbo->cols['fi_radio']->option->detailMethod = 'text';
$dbo->cols['fi_radio']->option->newMethod = 'text';
$dbo->cols['fi_radio']->option->editMethod = 'text';
$dbo->cols['fi_date'] = new DBO_COL('fi_date', 'timestamptz', '8', '-1');
$dbo->cols['fi_date']->displayDataType = 'date';
$dbo->cols['fi_date']->inputTypeDefault = 'JQueryDate';
$dbo->cols['fi_date']->searchMode = 'exact';
$dbo->cols['fi_date']->capContClassDefault = array();
$dbo->cols['fi_date']->valContClassDefault = array();
$dbo->cols['fi_date']->option->defaultMethod = 'text';
$dbo->cols['fi_date']->option->searchMethod = 'text';
$dbo->cols['fi_date']->option->listMethod = 'text';
$dbo->cols['fi_date']->option->detailMethod = 'text';
$dbo->cols['fi_date']->option->newMethod = 'text';
$dbo->cols['fi_date']->option->editMethod = 'text';
$dbo->cols['fi_integer'] = new DBO_COL('fi_integer', 'int4', '4', '-1');
$dbo->cols['fi_integer']->displayDataType = 'int';
$dbo->cols['fi_integer']->inputTypeDefault = 'text';
$dbo->cols['fi_integer']->searchMode = 'exact';
$dbo->cols['fi_integer']->capContClassDefault = array();
$dbo->cols['fi_integer']->valContClassDefault = array();
$dbo->cols['fi_integer']->option->defaultMethod = 'text';
$dbo->cols['fi_integer']->option->searchMethod = 'text';
$dbo->cols['fi_integer']->option->listMethod = 'text';
$dbo->cols['fi_integer']->option->detailMethod = 'text';
$dbo->cols['fi_integer']->option->newMethod = 'text';
$dbo->cols['fi_integer']->option->editMethod = 'text';
$dbo->cols['fi_html'] = new DBO_COL('fi_html', 'text', '-1', '-1');
$dbo->cols['fi_html']->inputTypeDefault = 'html';
$dbo->cols['fi_html']->searchMode = 'exact';
$dbo->cols['fi_html']->capContClassDefault = array();
$dbo->cols['fi_html']->valContClassDefault = array();
$dbo->cols['fi_html']->option->defaultMethod = 'text';
$dbo->cols['fi_html']->option->searchMethod = 'text';
$dbo->cols['fi_html']->option->listMethod = 'text';
$dbo->cols['fi_html']->option->detailMethod = 'text';
$dbo->cols['fi_html']->option->newMethod = 'text';
$dbo->cols['fi_html']->option->editMethod = 'text';
$dbo->cols['fi_datetime'] = new DBO_COL('fi_datetime', 'timestamptz', '8', '-1');
$dbo->cols['fi_datetime']->displayDataType = 'datetime';
$dbo->cols['fi_datetime']->inputTypeDefault = 'checkbox';
$dbo->cols['fi_datetime']->searchMode = 'exact';
$dbo->cols['fi_datetime']->capContClassDefault = array();
$dbo->cols['fi_datetime']->valContClassDefault = array();
$dbo->cols['fi_datetime']->option->defaultMethod = 'text';
$dbo->cols['fi_datetime']->option->searchMethod = 'text';
$dbo->cols['fi_datetime']->option->listMethod = 'text';
$dbo->cols['fi_datetime']->option->detailMethod = 'text';
$dbo->cols['fi_datetime']->option->newMethod = 'text';
$dbo->cols['fi_datetime']->option->editMethod = 'text';
$dbo->cols['fi_time'] = new DBO_COL('fi_time', 'timestamptz', '8', '-1');
$dbo->cols['fi_time']->displayDataType = 'time';
$dbo->cols['fi_time']->inputTypeDefault = 'time';
$dbo->cols['fi_time']->searchMode = 'exact';
$dbo->cols['fi_time']->capContClassDefault = array();
$dbo->cols['fi_time']->valContClassDefault = array();
$dbo->cols['fi_time']->option->defaultMethod = 'text';
$dbo->cols['fi_time']->option->searchMethod = 'text';
$dbo->cols['fi_time']->option->listMethod = 'text';
$dbo->cols['fi_time']->option->detailMethod = 'text';
$dbo->cols['fi_time']->option->newMethod = 'text';
$dbo->cols['fi_time']->option->editMethod = 'text';
$dbo->cols['fi_timestamp'] = new DBO_COL('fi_timestamp', 'timestamptz', '8', '-1');
$dbo->cols['fi_timestamp']->inputTypeDefault = 'text';
$dbo->cols['fi_timestamp']->searchMode = 'exact';
$dbo->cols['fi_timestamp']->capContClassDefault = array();
$dbo->cols['fi_timestamp']->valContClassDefault = array();
$dbo->cols['fi_timestamp']->option->defaultMethod = 'text';
$dbo->cols['fi_timestamp']->option->searchMethod = 'text';
$dbo->cols['fi_timestamp']->option->listMethod = 'text';
$dbo->cols['fi_timestamp']->option->detailMethod = 'text';
$dbo->cols['fi_timestamp']->option->newMethod = 'text';
$dbo->cols['fi_timestamp']->option->editMethod = 'text';
$dbo->cols['fi_file'] = new DBO_COL('fi_file', 'bytea', '-1', '-1');
$dbo->cols['fi_file']->inputTypeDefault = 'file';
$dbo->cols['fi_file']->searchMode = 'exact';
$dbo->cols['fi_file']->capContClassDefault = array();
$dbo->cols['fi_file']->valContClassDefault = array();
$dbo->cols['fi_file']->option->defaultMethod = 'text';
$dbo->cols['fi_file']->option->searchMethod = 'text';
$dbo->cols['fi_file']->option->listMethod = 'text';
$dbo->cols['fi_file']->option->detailMethod = 'text';
$dbo->cols['fi_file']->option->newMethod = 'text';
$dbo->cols['fi_file']->option->editMethod = 'text';
$dbo->cols['fi_color'] = new DBO_COL('fi_color', 'varchar', '-1', '16');
$dbo->cols['fi_color']->inputTypeDefault = 'color';
$dbo->cols['fi_color']->searchMode = 'exact';
$dbo->cols['fi_color']->capContClassDefault = array();
$dbo->cols['fi_color']->valContClassDefault = array();
$dbo->cols['fi_color']->option->defaultMethod = 'text';
$dbo->cols['fi_color']->option->searchMethod = 'text';
$dbo->cols['fi_color']->option->listMethod = 'text';
$dbo->cols['fi_color']->option->detailMethod = 'text';
$dbo->cols['fi_color']->option->newMethod = 'text';
$dbo->cols['fi_color']->option->editMethod = 'text';
$dbo->cols['fi_datetimelocal'] = new DBO_COL('fi_datetimelocal', 'timestamptz', '8', '-1');
$dbo->cols['fi_datetimelocal']->inputTypeDefault = 'datetime-local';
$dbo->cols['fi_datetimelocal']->searchMode = 'exact';
$dbo->cols['fi_datetimelocal']->capContClassDefault = array();
$dbo->cols['fi_datetimelocal']->valContClassDefault = array();
$dbo->cols['fi_datetimelocal']->option->defaultMethod = 'text';
$dbo->cols['fi_datetimelocal']->option->searchMethod = 'text';
$dbo->cols['fi_datetimelocal']->option->listMethod = 'text';
$dbo->cols['fi_datetimelocal']->option->detailMethod = 'text';
$dbo->cols['fi_datetimelocal']->option->newMethod = 'text';
$dbo->cols['fi_datetimelocal']->option->editMethod = 'text';
$dbo->cols['fi_email'] = new DBO_COL('fi_email', 'varchar', '-1', '104');
$dbo->cols['fi_email']->inputTypeDefault = 'email';
$dbo->cols['fi_email']->searchMode = 'exact';
$dbo->cols['fi_email']->capContClassDefault = array();
$dbo->cols['fi_email']->valContClassDefault = array();
$dbo->cols['fi_email']->option->defaultMethod = 'text';
$dbo->cols['fi_email']->option->searchMethod = 'text';
$dbo->cols['fi_email']->option->listMethod = 'text';
$dbo->cols['fi_email']->option->detailMethod = 'text';
$dbo->cols['fi_email']->option->newMethod = 'text';
$dbo->cols['fi_email']->option->editMethod = 'text';
$dbo->cols['fi_month'] = new DBO_COL('fi_month', 'timestamptz', '8', '-1');
$dbo->cols['fi_month']->inputTypeDefault = 'month';
$dbo->cols['fi_month']->searchMode = 'exact';
$dbo->cols['fi_month']->capContClassDefault = array();
$dbo->cols['fi_month']->valContClassDefault = array();
$dbo->cols['fi_month']->option->defaultMethod = 'text';
$dbo->cols['fi_month']->option->searchMethod = 'text';
$dbo->cols['fi_month']->option->listMethod = 'text';
$dbo->cols['fi_month']->option->detailMethod = 'text';
$dbo->cols['fi_month']->option->newMethod = 'text';
$dbo->cols['fi_month']->option->editMethod = 'text';
$dbo->cols['fi_number'] = new DBO_COL('fi_number', 'int4', '4', '-1');
$dbo->cols['fi_number']->inputTypeDefault = 'number';
$dbo->cols['fi_number']->searchMode = 'exact';
$dbo->cols['fi_number']->capContClassDefault = array();
$dbo->cols['fi_number']->valContClassDefault = array();
$dbo->cols['fi_number']->option->defaultMethod = 'text';
$dbo->cols['fi_number']->option->searchMethod = 'text';
$dbo->cols['fi_number']->option->listMethod = 'text';
$dbo->cols['fi_number']->option->detailMethod = 'text';
$dbo->cols['fi_number']->option->newMethod = 'text';
$dbo->cols['fi_number']->option->editMethod = 'text';
$dbo->cols['fi_password'] = new DBO_COL('fi_password', 'varchar', '-1', '104');
$dbo->cols['fi_password']->inputTypeDefault = 'password';
$dbo->cols['fi_password']->searchMode = 'exact';
$dbo->cols['fi_password']->capContClassDefault = array();
$dbo->cols['fi_password']->valContClassDefault = array();
$dbo->cols['fi_password']->option->defaultMethod = 'text';
$dbo->cols['fi_password']->option->searchMethod = 'text';
$dbo->cols['fi_password']->option->listMethod = 'text';
$dbo->cols['fi_password']->option->detailMethod = 'text';
$dbo->cols['fi_password']->option->newMethod = 'text';
$dbo->cols['fi_password']->option->editMethod = 'text';
$dbo->cols['fi_range'] = new DBO_COL('fi_range', 'numeric', '-1', '655364');
$dbo->cols['fi_range']->inputTypeDefault = 'range';
$dbo->cols['fi_range']->searchMode = 'exact';
$dbo->cols['fi_range']->capContClassDefault = array();
$dbo->cols['fi_range']->valContClassDefault = array();
$dbo->cols['fi_range']->option->defaultMethod = 'text';
$dbo->cols['fi_range']->option->searchMethod = 'text';
$dbo->cols['fi_range']->option->listMethod = 'text';
$dbo->cols['fi_range']->option->detailMethod = 'text';
$dbo->cols['fi_range']->option->newMethod = 'text';
$dbo->cols['fi_range']->option->editMethod = 'text';
$dbo->cols['fi_search'] = new DBO_COL('fi_search', 'varchar', '-1', '104');
$dbo->cols['fi_search']->inputTypeDefault = 'search';
$dbo->cols['fi_search']->searchMode = 'exact';
$dbo->cols['fi_search']->capContClassDefault = array();
$dbo->cols['fi_search']->valContClassDefault = array();
$dbo->cols['fi_search']->option->defaultMethod = 'text';
$dbo->cols['fi_search']->option->searchMethod = 'text';
$dbo->cols['fi_search']->option->listMethod = 'text';
$dbo->cols['fi_search']->option->detailMethod = 'text';
$dbo->cols['fi_search']->option->newMethod = 'text';
$dbo->cols['fi_search']->option->editMethod = 'text';
$dbo->cols['fi_tel'] = new DBO_COL('fi_tel', 'varchar', '-1', '19');
$dbo->cols['fi_tel']->inputTypeDefault = 'tel';
$dbo->cols['fi_tel']->searchMode = 'exact';
$dbo->cols['fi_tel']->capContClassDefault = array();
$dbo->cols['fi_tel']->valContClassDefault = array();
$dbo->cols['fi_tel']->option->defaultMethod = 'text';
$dbo->cols['fi_tel']->option->searchMethod = 'text';
$dbo->cols['fi_tel']->option->listMethod = 'text';
$dbo->cols['fi_tel']->option->detailMethod = 'text';
$dbo->cols['fi_tel']->option->newMethod = 'text';
$dbo->cols['fi_tel']->option->editMethod = 'text';
$dbo->cols['fi_url'] = new DBO_COL('fi_url', 'varchar', '-1', '104');
$dbo->cols['fi_url']->inputTypeDefault = 'url';
$dbo->cols['fi_url']->searchMode = 'exact';
$dbo->cols['fi_url']->capContClassDefault = array();
$dbo->cols['fi_url']->valContClassDefault = array();
$dbo->cols['fi_url']->option->defaultMethod = 'text';
$dbo->cols['fi_url']->option->searchMethod = 'text';
$dbo->cols['fi_url']->option->listMethod = 'text';
$dbo->cols['fi_url']->option->detailMethod = 'text';
$dbo->cols['fi_url']->option->newMethod = 'text';
$dbo->cols['fi_url']->option->editMethod = 'text';
$dbo->cols['fi_week'] = new DBO_COL('fi_week', 'timestamptz', '8', '-1');
$dbo->cols['fi_week']->inputTypeDefault = 'week';
$dbo->cols['fi_week']->searchMode = 'exact';
$dbo->cols['fi_week']->capContClassDefault = array();
$dbo->cols['fi_week']->valContClassDefault = array();
$dbo->cols['fi_week']->option->defaultMethod = 'text';
$dbo->cols['fi_week']->option->searchMethod = 'text';
$dbo->cols['fi_week']->option->listMethod = 'text';
$dbo->cols['fi_week']->option->detailMethod = 'text';
$dbo->cols['fi_week']->option->newMethod = 'text';
$dbo->cols['fi_week']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_fonginput_custom_new';
function dbo_fonginput_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_fonginput_custom_edit';
function dbo_fonginput_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_fonginput_custom_search';
function dbo_fonginput_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_fonginput_custom_delete';
function dbo_fonginput_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_fonginput_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>