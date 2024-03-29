<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'menu';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcmenu';
$dbo->key = array('mn_id');
$dbo->sql = 'select * from fcmenu';
$dbo->col = array('mn_id', 'mn_code', 'mn_parentid', 'mn_title', 'mn_status', 'mn_order', 'mn_url', 'mn_webflag', 'mn_class', 'mn_classlist', 'mn_func', 'mn_funclist', 'mn_param', 'mn_pmscode', 'mn_icon_class');
$dbo->colList = array('mn_code', 'mn_parentid', 'mn_title', 'mn_status', 'mn_webflag', 'mn_order', 'mn_icon_class', 'mn_pmscode', 'mn_func', 'mn_class');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('mn_code', 'mn_title', 'mn_status', 'mn_url', 'mn_webflag', 'mn_order', 'mn_func', 'mn_class');
$dbo->colNew = array('mn_code', 'mn_title', 'mn_parentid', 'mn_status', 'mn_url', 'mn_webflag', 'mn_order', 'mn_pmscode', 'mn_func', 'mn_class', 'mn_icon_class');
$dbo->colEdit = array('mn_code', 'mn_title', 'mn_parentid', 'mn_status', 'mn_url', 'mn_webflag', 'mn_order', 'mn_pmscode', 'mn_func', 'mn_class', 'mn_icon_class');
$dbo->colSearch = array('mn_code', 'mn_title', 'mn_status', 'mn_webflag', 'mn_order', 'mn_pmscode', 'mn_func', 'mn_class', 'mn_parentid');
$dbo->colExport = array('mn_title', 'mn_url', 'mn_status', 'mn_order', 'mn_webflag', 'mn_class');
$dbo->colSort = array('mn_parentid', 'mn_order');
$dbo->colSum = array();
$dbo->colSumPage = array();
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array();
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
$dbo->titleList = 'List Menu';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Menu';
$dbo->titleEdit = 'Edit Menu';
$dbo->titleSearch = 'Search Menu';
$dbo->layoutSearch = '1|1';
$dbo->theme = 'pixeladmin';
$dbo->layout = 'One';
$dbo->pageLinkCount = '5';
$dbo->recordPerPage = '100';
$dbo->showRecordNo = '1';
$dbo->defaultState = 'search';
$dbo->maxSortCount = '9';
$dbo->defaultDateFormat = 'yyyy-mm-dd';
$dbo->defaultDateTimeFormat = 'yyyy-mm-dd hh24:min:ss';
$dbo->defaultTimeFormat = 'hh24:min:ss';
$dbo->lang = 'EN-US';
$dbo->pdfEngine = 'dompdf';
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'array_count_value', 'qstr', 'check_ip_online', 'implode_multi', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'displaysearchdate', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_5695e3041dcaa9_86301002', 'testoptiontitle');

$dbo->cols['mn_menu'] = new DBO_COL('mn_menu', 'varchar', '-1', '24');
$dbo->cols['mn_menu']->inputTypeDefault = 'text';
$dbo->cols['mn_menu']->searchMode = 'exact';
$dbo->cols['mn_menu']->capContClassDefault = array();
$dbo->cols['mn_menu']->valContClassDefault = array();
$dbo->cols['mn_menu']->filter = array();
$dbo->cols['mn_menu']->inputType = 'text';
$dbo->cols['mn_menu']->option->defaultMethod = 'text';
$dbo->cols['mn_menu']->option->searchMethod = 'text';
$dbo->cols['mn_menu']->option->listMethod = 'text';
$dbo->cols['mn_menu']->option->detailMethod = 'text';
$dbo->cols['mn_menu']->option->newMethod = 'text';
$dbo->cols['mn_menu']->option->editMethod = 'text';
$dbo->cols['mn_parentcode'] = new DBO_COL('mn_parentcode', 'varchar', '-1', '36');
$dbo->cols['mn_parentcode']->inputTypeDefault = 'text';
$dbo->cols['mn_parentcode']->mandatoryNew = 1;
$dbo->cols['mn_parentcode']->mandatoryEdit = 1;
$dbo->cols['mn_parentcode']->searchMode = 'matchany';
$dbo->cols['mn_parentcode']->capContClassDefault = array();
$dbo->cols['mn_parentcode']->valContClassDefault = array();
$dbo->cols['mn_parentcode']->filter = array();
$dbo->cols['mn_parentcode']->inputType = 'multiselect';
$dbo->cols['mn_parentcode']->filterVal = array();
$dbo->cols['mn_parentcode']->option->default = 'genparentselect()';
$dbo->cols['mn_parentcode']->option->defaultMethod = 'php';
$dbo->cols['mn_parentcode']->option->searchMethod = 'text';
$dbo->cols['mn_parentcode']->option->listMethod = 'text';
$dbo->cols['mn_parentcode']->option->detailMethod = 'text';
$dbo->cols['mn_parentcode']->option->newMethod = 'text';
$dbo->cols['mn_parentcode']->option->editMethod = 'text';
$dbo->cols['mn_title'] = new DBO_COL('mn_title', 'varchar', '-1', '54');
$dbo->cols['mn_title']->inputTypeDefault = 'text';
$dbo->cols['mn_title']->mandatoryNew = '1';
$dbo->cols['mn_title']->mandatoryEdit = '1';
$dbo->cols['mn_title']->searchMode = 'matchany';
$dbo->cols['mn_title']->capContClassDefault = array();
$dbo->cols['mn_title']->valContClassDefault = array();
$dbo->cols['mn_title']->filter = array();
$dbo->cols['mn_title']->inputType = 'text';
$dbo->cols['mn_title']->filterVal = array();
$dbo->cols['mn_title']->option->defaultMethod = 'php';
$dbo->cols['mn_title']->option->searchMethod = 'text';
$dbo->cols['mn_title']->option->listMethod = 'text';
$dbo->cols['mn_title']->option->detailMethod = 'text';
$dbo->cols['mn_title']->option->newMethod = 'text';
$dbo->cols['mn_title']->option->editMethod = 'text';
$dbo->cols['mn_url'] = new DBO_COL('mn_url', 'varchar', '-1', '104');
$dbo->cols['mn_url']->inputTypeDefault = 'text';
$dbo->cols['mn_url']->searchMode = 'matchany';
$dbo->cols['mn_url']->capContClassDefault = array();
$dbo->cols['mn_url']->valContClassDefault = array();
$dbo->cols['mn_url']->filter = array();
$dbo->cols['mn_url']->inputType = 'text';
$dbo->cols['mn_url']->filterVal = array();
$dbo->cols['mn_url']->option->defaultMethod = 'text';
$dbo->cols['mn_url']->option->searchMethod = 'text';
$dbo->cols['mn_url']->option->listMethod = 'text';
$dbo->cols['mn_url']->option->detailMethod = 'text';
$dbo->cols['mn_url']->option->newMethod = 'text';
$dbo->cols['mn_url']->option->editMethod = 'text';
$dbo->cols['mn_active'] = new DBO_COL('mn_active', 'bool', '1', '-1');
$dbo->cols['mn_active']->inputTypeDefault = 'text';
$dbo->cols['mn_active']->searchMode = 'exact';
$dbo->cols['mn_active']->capContClassDefault = array();
$dbo->cols['mn_active']->valContClassDefault = array();
$dbo->cols['mn_active']->filter = array();
$dbo->cols['mn_active']->inputType = 'checkbox';
$dbo->cols['mn_active']->option->default = 'Y/Yes
N/No';
$dbo->cols['mn_active']->option->defaultMethod = 'text';
$dbo->cols['mn_active']->option->searchMethod = 'text';
$dbo->cols['mn_active']->option->listMethod = 'text';
$dbo->cols['mn_active']->option->detailMethod = 'text';
$dbo->cols['mn_active']->option->newMethod = 'text';
$dbo->cols['mn_active']->option->editMethod = 'text';
$dbo->cols['mn_order'] = new DBO_COL('mn_order', 'int4', '4', '-1');
$dbo->cols['mn_order']->defaultSort = 'asc';
$dbo->cols['mn_order']->inputTypeDefault = 'text';
$dbo->cols['mn_order']->searchMode = 'exact';
$dbo->cols['mn_order']->capContClassDefault = array();
$dbo->cols['mn_order']->valContClassDefault = array();
$dbo->cols['mn_order']->filter = array();
$dbo->cols['mn_order']->inputType = 'text';
$dbo->cols['mn_order']->filterVal = array();
$dbo->cols['mn_order']->option->defaultMethod = 'text';
$dbo->cols['mn_order']->option->searchMethod = 'text';
$dbo->cols['mn_order']->option->listMethod = 'text';
$dbo->cols['mn_order']->option->detailMethod = 'text';
$dbo->cols['mn_order']->option->newMethod = 'text';
$dbo->cols['mn_order']->option->editMethod = 'text';
$dbo->cols['mn_id'] = new DBO_COL('mn_id', 'int4', '4', '-1');
$dbo->cols['mn_id']->inputTypeDefault = 'text';
$dbo->cols['mn_id']->searchMode = 'exact';
$dbo->cols['mn_id']->capContClassDefault = array();
$dbo->cols['mn_id']->valContClassDefault = array();
$dbo->cols['mn_id']->filter = array();
$dbo->cols['mn_id']->filterVal = array();
$dbo->cols['mn_id']->option->defaultMethod = 'text';
$dbo->cols['mn_id']->option->searchMethod = 'text';
$dbo->cols['mn_id']->option->listMethod = 'text';
$dbo->cols['mn_id']->option->detailMethod = 'text';
$dbo->cols['mn_id']->option->newMethod = 'text';
$dbo->cols['mn_id']->option->editMethod = 'text';
$dbo->cols['mn_status'] = new DBO_COL('mn_status', 'varchar', '-1', '16');
$dbo->cols['mn_status']->inputTypeDefault = 'select';
$dbo->cols['mn_status']->searchMode = 'exact';
$dbo->cols['mn_status']->capContClassDefault = array();
$dbo->cols['mn_status']->valContClassDefault = array();
$dbo->cols['mn_status']->filter = array();
$dbo->cols['mn_status']->filterVal = array();
$dbo->cols['mn_status']->option->default = 'ACTIVE/Active
INACTIVE/Inactive';
$dbo->cols['mn_status']->option->defaultMethod = 'text';
$dbo->cols['mn_status']->option->searchMethod = 'text';
$dbo->cols['mn_status']->option->listMethod = 'text';
$dbo->cols['mn_status']->option->detailMethod = 'text';
$dbo->cols['mn_status']->option->newMethod = 'text';
$dbo->cols['mn_status']->option->editMethod = 'text';
$dbo->cols['mn_parentid'] = new DBO_COL('mn_parentid', 'int4', '4', '-1');
$dbo->cols['mn_parentid']->defaultSort = 'asc';
$dbo->cols['mn_parentid']->inputTypeDefault = 'select';
$dbo->cols['mn_parentid']->searchMode = 'exact';
$dbo->cols['mn_parentid']->capContClassDefault = array();
$dbo->cols['mn_parentid']->valContClassDefault = array();
$dbo->cols['mn_parentid']->filter = array();
$dbo->cols['mn_parentid']->option->default = 'select mn_id, mn_title from fcmenu 
where mn_Status = \'ACTIVE\'
order by 2;';
$dbo->cols['mn_parentid']->option->defaultMethod = 'sql';
$dbo->cols['mn_parentid']->option->searchMethod = 'text';
$dbo->cols['mn_parentid']->option->listMethod = 'text';
$dbo->cols['mn_parentid']->option->detailMethod = 'text';
$dbo->cols['mn_parentid']->option->newMethod = 'text';
$dbo->cols['mn_parentid']->option->editMethod = 'text';
$dbo->cols['mn_code'] = new DBO_COL('mn_code', 'varchar', '-1', '36');
$dbo->cols['mn_code']->inputTypeDefault = 'text';
$dbo->cols['mn_code']->mandatoryNew = '1';
$dbo->cols['mn_code']->mandatoryEdit = '1';
$dbo->cols['mn_code']->searchMode = 'matchfront';
$dbo->cols['mn_code']->capContClassDefault = array();
$dbo->cols['mn_code']->valContClassDefault = array();
$dbo->cols['mn_code']->filter = array();
$dbo->cols['mn_code']->filterVal = array();
$dbo->cols['mn_code']->option->defaultMethod = 'text';
$dbo->cols['mn_code']->option->searchMethod = 'php';
$dbo->cols['mn_code']->option->listMethod = 'text';
$dbo->cols['mn_code']->option->detailMethod = 'text';
$dbo->cols['mn_code']->option->newMethod = 'text';
$dbo->cols['mn_code']->option->editMethod = 'text';
$dbo->cols['mn_group'] = new DBO_COL('mn_group', 'VAR_STRING', '3000', '0');
$dbo->cols['mn_group']->inputTypeDefault = 'checkbox';
$dbo->cols['mn_group']->size = 5;
$dbo->cols['mn_group']->searchMode = 'exact';
$dbo->cols['mn_group']->capContClassDefault = array();
$dbo->cols['mn_group']->valContClassDefault = array();
$dbo->cols['mn_group']->filter = array();
$dbo->cols['mn_group']->filterVal = array();
$dbo->cols['mn_group']->option->default = 'select pms_code,pms_desc from fcpermission';
$dbo->cols['mn_group']->option->defaultMethod = 'sql';
$dbo->cols['mn_group']->option->searchMethod = 'text';
$dbo->cols['mn_group']->option->listMethod = 'text';
$dbo->cols['mn_group']->option->detailMethod = 'text';
$dbo->cols['mn_group']->option->newMethod = 'text';
$dbo->cols['mn_group']->option->editMethod = 'text';
$dbo->cols['mn_webflag'] = new DBO_COL('mn_webflag', 'varchar', '-1', '16');
$dbo->cols['mn_webflag']->inputTypeDefault = 'radio';
$dbo->cols['mn_webflag']->searchMode = 'exact';
$dbo->cols['mn_webflag']->capContClassDefault = array();
$dbo->cols['mn_webflag']->valContClassDefault = array();
$dbo->cols['mn_webflag']->filter = array();
$dbo->cols['mn_webflag']->filterVal = array();
$dbo->cols['mn_webflag']->option->default = 'Y/Yes
N/No';
$dbo->cols['mn_webflag']->option->defaultMethod = 'text';
$dbo->cols['mn_webflag']->option->searchMethod = 'text';
$dbo->cols['mn_webflag']->option->listMethod = 'text';
$dbo->cols['mn_webflag']->option->detailMethod = 'text';
$dbo->cols['mn_webflag']->option->newMethod = 'text';
$dbo->cols['mn_webflag']->option->editMethod = 'text';
$dbo->cols['mn_class'] = new DBO_COL('mn_class', 'varchar', '-1', '54');
$dbo->cols['mn_class']->inputTypeDefault = 'text';
$dbo->cols['mn_class']->searchMode = 'exact';
$dbo->cols['mn_class']->capContClassDefault = array();
$dbo->cols['mn_class']->valContClassDefault = array();
$dbo->cols['mn_class']->filter = array();
$dbo->cols['mn_class']->filterVal = array();
$dbo->cols['mn_class']->option->defaultMethod = 'text';
$dbo->cols['mn_class']->option->searchMethod = 'text';
$dbo->cols['mn_class']->option->listMethod = 'text';
$dbo->cols['mn_class']->option->detailMethod = 'text';
$dbo->cols['mn_class']->option->newMethod = 'text';
$dbo->cols['mn_class']->option->editMethod = 'text';
$dbo->cols['mn_classlist'] = new DBO_COL('mn_classlist', 'varchar', '-1', '1004');
$dbo->cols['mn_classlist']->inputTypeDefault = 'PixelAdminRadioInline';
$dbo->cols['mn_classlist']->searchMode = 'exact';
$dbo->cols['mn_classlist']->capContClassDefault = array();
$dbo->cols['mn_classlist']->valContClassDefault = array();
$dbo->cols['mn_classlist']->filter = array();
$dbo->cols['mn_classlist']->filterVal = array();
$dbo->cols['mn_classlist']->option->defaultMethod = 'text';
$dbo->cols['mn_classlist']->option->searchMethod = 'text';
$dbo->cols['mn_classlist']->option->listMethod = 'text';
$dbo->cols['mn_classlist']->option->detailMethod = 'text';
$dbo->cols['mn_classlist']->option->newMethod = 'text';
$dbo->cols['mn_classlist']->option->editMethod = 'text';
$dbo->cols['mn_func'] = new DBO_COL('mn_func', 'varchar', '-1', '54');
$dbo->cols['mn_func']->inputTypeDefault = 'text';
$dbo->cols['mn_func']->searchMode = 'exact';
$dbo->cols['mn_func']->capContClassDefault = array();
$dbo->cols['mn_func']->valContClassDefault = array();
$dbo->cols['mn_func']->filter = array();
$dbo->cols['mn_func']->filterVal = array();
$dbo->cols['mn_func']->option->defaultMethod = 'text';
$dbo->cols['mn_func']->option->searchMethod = 'text';
$dbo->cols['mn_func']->option->listMethod = 'text';
$dbo->cols['mn_func']->option->detailMethod = 'text';
$dbo->cols['mn_func']->option->newMethod = 'text';
$dbo->cols['mn_func']->option->editMethod = 'text';
$dbo->cols['mn_funclist'] = new DBO_COL('mn_funclist', 'varchar', '-1', '1004');
$dbo->cols['mn_funclist']->inputTypeDefault = 'textarea';
$dbo->cols['mn_funclist']->searchMode = 'exact';
$dbo->cols['mn_funclist']->capContClassDefault = array();
$dbo->cols['mn_funclist']->valContClassDefault = array();
$dbo->cols['mn_funclist']->filter = array();
$dbo->cols['mn_funclist']->filterVal = array();
$dbo->cols['mn_funclist']->option->defaultMethod = 'text';
$dbo->cols['mn_funclist']->option->searchMethod = 'text';
$dbo->cols['mn_funclist']->option->listMethod = 'text';
$dbo->cols['mn_funclist']->option->detailMethod = 'text';
$dbo->cols['mn_funclist']->option->newMethod = 'text';
$dbo->cols['mn_funclist']->option->editMethod = 'text';
$dbo->cols['mn_param'] = new DBO_COL('mn_param', 'varchar', '-1', '504');
$dbo->cols['mn_param']->inputTypeDefault = 'text';
$dbo->cols['mn_param']->searchMode = 'exact';
$dbo->cols['mn_param']->capContClassDefault = array();
$dbo->cols['mn_param']->valContClassDefault = array();
$dbo->cols['mn_param']->filter = array();
$dbo->cols['mn_param']->filterVal = array();
$dbo->cols['mn_param']->option->defaultMethod = 'text';
$dbo->cols['mn_param']->option->searchMethod = 'text';
$dbo->cols['mn_param']->option->listMethod = 'text';
$dbo->cols['mn_param']->option->detailMethod = 'text';
$dbo->cols['mn_param']->option->newMethod = 'text';
$dbo->cols['mn_param']->option->editMethod = 'text';
$dbo->cols['fakec'] = new DBO_COL('fakec', 'unknown', '-2', '-1');
$dbo->cols['fakec']->inputTypeDefault = 'text';
$dbo->cols['fakec']->searchMode = 'exact';
$dbo->cols['fakec']->capContClassDefault = array();
$dbo->cols['fakec']->valContClassDefault = array();
$dbo->cols['fakec']->filter = array();
$dbo->cols['fakec']->option->defaultMethod = 'text';
$dbo->cols['fakec']->option->searchMethod = 'text';
$dbo->cols['fakec']->option->listMethod = 'text';
$dbo->cols['fakec']->option->detailMethod = 'text';
$dbo->cols['fakec']->option->newMethod = 'text';
$dbo->cols['fakec']->option->editMethod = 'text';
$dbo->cols['last_modified_date'] = new DBO_COL('last_modified_date', 'timestamptz', '8', '-1');
$dbo->cols['last_modified_date']->inputTypeDefault = 'text';
$dbo->cols['last_modified_date']->capContClassDefault = array();
$dbo->cols['last_modified_date']->valContClassDefault = array();
$dbo->cols['last_modified_date']->option->defaultMethod = 'text';
$dbo->cols['last_modified_date']->option->searchMethod = 'text';
$dbo->cols['last_modified_date']->option->listMethod = 'text';
$dbo->cols['last_modified_date']->option->detailMethod = 'text';
$dbo->cols['last_modified_date']->option->newMethod = 'text';
$dbo->cols['last_modified_date']->option->editMethod = 'text';
$dbo->cols['last_synchronized_date'] = new DBO_COL('last_synchronized_date', 'timestamptz', '8', '-1');
$dbo->cols['last_synchronized_date']->inputTypeDefault = 'text';
$dbo->cols['last_synchronized_date']->capContClassDefault = array();
$dbo->cols['last_synchronized_date']->valContClassDefault = array();
$dbo->cols['last_synchronized_date']->option->defaultMethod = 'text';
$dbo->cols['last_synchronized_date']->option->searchMethod = 'text';
$dbo->cols['last_synchronized_date']->option->listMethod = 'text';
$dbo->cols['last_synchronized_date']->option->detailMethod = 'text';
$dbo->cols['last_synchronized_date']->option->newMethod = 'text';
$dbo->cols['last_synchronized_date']->option->editMethod = 'text';
$dbo->cols['record_synchronized'] = new DBO_COL('record_synchronized', 'varchar', '-1', '5');
$dbo->cols['record_synchronized']->inputTypeDefault = 'text';
$dbo->cols['record_synchronized']->capContClassDefault = array();
$dbo->cols['record_synchronized']->valContClassDefault = array();
$dbo->cols['record_synchronized']->option->defaultMethod = 'text';
$dbo->cols['record_synchronized']->option->searchMethod = 'text';
$dbo->cols['record_synchronized']->option->listMethod = 'text';
$dbo->cols['record_synchronized']->option->detailMethod = 'text';
$dbo->cols['record_synchronized']->option->newMethod = 'text';
$dbo->cols['record_synchronized']->option->editMethod = 'text';
$dbo->cols['cloud_refid'] = new DBO_COL('cloud_refid', 'int4', '4', '-1');
$dbo->cols['cloud_refid']->inputTypeDefault = 'text';
$dbo->cols['cloud_refid']->capContClassDefault = array();
$dbo->cols['cloud_refid']->valContClassDefault = array();
$dbo->cols['cloud_refid']->option->defaultMethod = 'text';
$dbo->cols['cloud_refid']->option->searchMethod = 'text';
$dbo->cols['cloud_refid']->option->listMethod = 'text';
$dbo->cols['cloud_refid']->option->detailMethod = 'text';
$dbo->cols['cloud_refid']->option->newMethod = 'text';
$dbo->cols['cloud_refid']->option->editMethod = 'text';
$dbo->cols['mn_pmscode'] = new DBO_COL('mn_pmscode', 'varchar', '-1', '54');
$dbo->cols['mn_pmscode']->inputTypeDefault = 'select';
$dbo->cols['mn_pmscode']->searchMode = 'exact';
$dbo->cols['mn_pmscode']->capContClassDefault = array();
$dbo->cols['mn_pmscode']->valContClassDefault = array();
$dbo->cols['mn_pmscode']->option->default = 'select pms_code,pms_desc from fcpermission
order by 2';
$dbo->cols['mn_pmscode']->option->defaultMethod = 'sql';
$dbo->cols['mn_pmscode']->option->searchMethod = 'text';
$dbo->cols['mn_pmscode']->option->listMethod = 'text';
$dbo->cols['mn_pmscode']->option->detailMethod = 'text';
$dbo->cols['mn_pmscode']->option->newMethod = 'text';
$dbo->cols['mn_pmscode']->option->editMethod = 'text';
$dbo->cols['mn_icon_class'] = new DBO_COL('mn_icon_class', 'varchar', '-1', '104');
$dbo->cols['mn_icon_class']->inputTypeDefault = 'text';
$dbo->cols['mn_icon_class']->searchMode = 'exact';
$dbo->cols['mn_icon_class']->capContClassDefault = array();
$dbo->cols['mn_icon_class']->valContClassDefault = array();
$dbo->cols['mn_icon_class']->option->defaultMethod = 'text';
$dbo->cols['mn_icon_class']->option->searchMethod = 'text';
$dbo->cols['mn_icon_class']->option->listMethod = 'text';
$dbo->cols['mn_icon_class']->option->detailMethod = 'text';
$dbo->cols['mn_icon_class']->option->newMethod = 'text';
$dbo->cols['mn_icon_class']->option->editMethod = 'text';

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
# enable overwriting DBO class
class DBO_custom_menu extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_menu_custom_new';
function dbo_menu_custom_new($table, $cols, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_menu_custom_edit';
function dbo_menu_custom_edit($table, $cols, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_menu_custom_search';
function dbo_menu_custom_search(&$search, $dbo){
}

$dbo->deleteModifier = 'dbo_menu_custom_delete';
function dbo_menu_custom_delete($table, $wheres, $dbo){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_menu_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>