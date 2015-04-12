<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'rpt_performance_det';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'fcpmcaseflow';
$dbo->key = array();
$dbo->sql = 'select pmf_id,coalesce(pmat_name,pmev_name) as actvname,pmf_start_date, pmf_due_date,pmf_end_date,pmf_end_by,usr_name,
case when ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) < 0 then 0 else round( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ),2) end as timediff, js_code, js_description
from fcpmcaseflow
join fcpmcase on pmc_id = pmf_pmcid
join mjobsheet on pmc_casekey = js_id
left join fcpmactivity on pmat_id = pmf_obj_id and pmf_obj_type = \'PM_Activity\'
left join fcpmevent on pmev_id = pmf_obj_id and pmf_obj_type = \'PM_Event\'
left join fcpmgateway on pmgw_id = pmf_obj_id and pmf_obj_type = \'PM_Gateway\'
left join fcuser on pmf_end_by = usr_userid
where pmf_due_Date is not null
and pmf_end_status != \'INTERRUPT\'
order by pmf_start_date';
$dbo->col = array('pmf_id', 'actvname', 'pmf_start_date', 'pmf_due_date', 'pmf_end_date', 'pmf_end_by', 'usr_name', 'timediff', 'js_code', 'js_description');
$dbo->colList = array('usr_name', 'actvname', 'js_code', 'js_description', 'pmf_start_date', 'pmf_due_date', 'pmf_end_date', 'timediff');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('pmf_id', 'actvname', 'pmf_start_date', 'pmf_due_date', 'pmf_end_date', 'timediff');
$dbo->colNew = array('pmf_id', 'actvname', 'pmf_start_date', 'pmf_due_date', 'pmf_end_date', 'timediff');
$dbo->colEdit = array('pmf_id', 'actvname', 'pmf_start_date', 'pmf_due_date', 'pmf_end_date', 'timediff');
$dbo->colSearch = array('pmf_id', 'actvname', 'pmf_start_date', 'pmf_due_date', 'pmf_end_date', 'timediff');
$dbo->colExport = array('pmf_id', 'actvname', 'pmf_start_date', 'pmf_due_date', 'pmf_end_date', 'timediff');
$dbo->colSort = array();
$dbo->colSum = array();
$dbo->colSumPage = array();
$dbo->colAvg = array();
$dbo->colAvgPage = array();
$dbo->colGroupable = array();
$dbo->canSearch = false;
$dbo->canNew = false;
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
$dbo->pageLinkCount = '7';
$dbo->recordPerPage = '10';
$dbo->showRecordNo = '1';
$dbo->defaultState = 'list';
$dbo->maxSortCount = '9';
$dbo->defaultDateFormat = 'yyyy-mm-dd';
$dbo->defaultDateTimeFormat = 'yyyy-mm-dd hh24:min:ss';
$dbo->defaultTimeFormat = 'hh24:min:ss';
$dbo->lang = 'EN-US';
$dbo->pdfEngine = 'dompdf';
$dbo->userFunctions = array('d', 'p', 'pre', 'pr', 'vd', 'truncate', 'fiif', 'redirect', 'glob_recursive', 'unlink_recursive', 'alert', 'core_include', 'core_include_once', 'core_require', 'core_require_once', 'core_log', 'app_log', 'randomstring', 'time_to_sec', 'array_split_by_value', 'qstr', 'check_ip_online', 'implode_multi', 'array_column', 'check_core_license', 'check_app_license', 'getprioritysmarty', 'smartyautoload', 'email_destruct', 'html_destruct', 'installckeditor', 'html_outputjs', 'html_outputcss', 'html_ent', 'getjs', 'getcss', 'tl', 'global_destruct', 'dbo_init', 'dbo_include', 'dbo_require', 'dbo_log', 'html_header', 'globalformatdate', 'associative_push', 'searchvalue', 'format_number', 'arr2tree', 'quote', 'time_different_string', 'insertnotice', 'autodetailtableinput', 'gendetailtabledisplay', 'gendetailtableinput', 'autodetailcustomedit', 'autodetailcustomnew', 'movesingleimage', 'convertbytes', 'getusersessid', 'showdbo', 'getuserlang', 'getuseravatarimage', 'getprimarycat', 'showprinterinfo', 'usertoporgid', 'orgtoporgid', 'sendmailfromtemplate', 'calculatecompletion', 'generateinvoicehtml', 'web_filter', 'getnodearr', 'content_54041d8f3bae13_93533903', 'dbo_rpt_performance_det_customize');
$dbo->searchCancel = 'Reset';
$dbo->searchSubmit = 'Search';
$dbo->editCancel = 'Cancel';
$dbo->editSubmit = 'Edit';
$dbo->newCancel = 'Cancel';
$dbo->newSubmit = 'Submit';
$dbo->whereSQL = '( ( timediffinmin(pmf_start_date, pmf_end_date) - timediffinmin(pmf_start_date, pmf_due_date) ) / timediffinmin(pmf_start_date, pmf_due_date) ) * 100 < 0 and pmf_end_by = \'KN032\' and pmf_start_date > \'2014-08-11\' and pmf_start_date <= cast(\'2014-08-11\' as date) + interval \'1 day\'';

$dbo->cols['pmf_id'] = new DBO_COL('pmf_id', 'int4', '4', '-1');
$dbo->cols['pmf_id']->inputTypeDefault = 'text';
$dbo->cols['pmf_id']->searchMode = 'exact';
$dbo->cols['pmf_id']->capContClassDefault = array();
$dbo->cols['pmf_id']->valContClassDefault = array();
$dbo->cols['pmf_id']->option->defaultMethod = 'text';
$dbo->cols['pmf_id']->option->searchMethod = 'text';
$dbo->cols['pmf_id']->option->listMethod = 'text';
$dbo->cols['pmf_id']->option->detailMethod = 'text';
$dbo->cols['pmf_id']->option->newMethod = 'text';
$dbo->cols['pmf_id']->option->editMethod = 'text';
$dbo->cols['actvname'] = new DBO_COL('actvname', 'varchar', '-1', '104');
$dbo->cols['actvname']->inputTypeDefault = 'text';
$dbo->cols['actvname']->searchMode = 'exact';
$dbo->cols['actvname']->capContClassDefault = array();
$dbo->cols['actvname']->valContClassDefault = array();
$dbo->cols['actvname']->option->defaultMethod = 'text';
$dbo->cols['actvname']->option->searchMethod = 'text';
$dbo->cols['actvname']->option->listMethod = 'text';
$dbo->cols['actvname']->option->detailMethod = 'text';
$dbo->cols['actvname']->option->newMethod = 'text';
$dbo->cols['actvname']->option->editMethod = 'text';
$dbo->cols['pmf_start_date'] = new DBO_COL('pmf_start_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_start_date']->displayDataType = 'datetime';
$dbo->cols['pmf_start_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_start_date']->searchMode = 'exact';
$dbo->cols['pmf_start_date']->capContClassDefault = array();
$dbo->cols['pmf_start_date']->valContClassDefault = array();
$dbo->cols['pmf_start_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_start_date']->option->searchMethod = 'text';
$dbo->cols['pmf_start_date']->option->listMethod = 'text';
$dbo->cols['pmf_start_date']->option->detailMethod = 'text';
$dbo->cols['pmf_start_date']->option->newMethod = 'text';
$dbo->cols['pmf_start_date']->option->editMethod = 'text';
$dbo->cols['pmf_due_date'] = new DBO_COL('pmf_due_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_due_date']->displayDataType = 'datetime';
$dbo->cols['pmf_due_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_due_date']->searchMode = 'exact';
$dbo->cols['pmf_due_date']->capContClassDefault = array();
$dbo->cols['pmf_due_date']->valContClassDefault = array();
$dbo->cols['pmf_due_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_due_date']->option->searchMethod = 'text';
$dbo->cols['pmf_due_date']->option->listMethod = 'text';
$dbo->cols['pmf_due_date']->option->detailMethod = 'text';
$dbo->cols['pmf_due_date']->option->newMethod = 'text';
$dbo->cols['pmf_due_date']->option->editMethod = 'text';
$dbo->cols['pmf_end_date'] = new DBO_COL('pmf_end_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_end_date']->displayDataType = 'datetime';
$dbo->cols['pmf_end_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_end_date']->searchMode = 'exact';
$dbo->cols['pmf_end_date']->capContClassDefault = array();
$dbo->cols['pmf_end_date']->valContClassDefault = array();
$dbo->cols['pmf_end_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_end_date']->option->searchMethod = 'text';
$dbo->cols['pmf_end_date']->option->listMethod = 'text';
$dbo->cols['pmf_end_date']->option->detailMethod = 'text';
$dbo->cols['pmf_end_date']->option->newMethod = 'text';
$dbo->cols['pmf_end_date']->option->editMethod = 'text';
$dbo->cols['timediff'] = new DBO_COL('timediff', 'numeric', '-1', '-1');
$dbo->cols['timediff']->inputTypeDefault = 'text';
$dbo->cols['timediff']->searchMode = 'exact';
$dbo->cols['timediff']->capContClassDefault = array();
$dbo->cols['timediff']->valContClassDefault = array();
$dbo->cols['timediff']->option->defaultMethod = 'text';
$dbo->cols['timediff']->option->searchMethod = 'text';
$dbo->cols['timediff']->option->listMethod = 'text';
$dbo->cols['timediff']->option->detailMethod = 'text';
$dbo->cols['timediff']->option->newMethod = 'text';
$dbo->cols['timediff']->option->editMethod = 'text';
$dbo->cols['pmf_pmcid'] = new DBO_COL('pmf_pmcid', 'int4', '4', '-1');
$dbo->cols['pmf_pmcid']->inputTypeDefault = 'text';
$dbo->cols['pmf_pmcid']->searchMode = 'exact';
$dbo->cols['pmf_pmcid']->capContClassDefault = array();
$dbo->cols['pmf_pmcid']->valContClassDefault = array();
$dbo->cols['pmf_pmcid']->option->defaultMethod = 'text';
$dbo->cols['pmf_pmcid']->option->searchMethod = 'text';
$dbo->cols['pmf_pmcid']->option->listMethod = 'text';
$dbo->cols['pmf_pmcid']->option->detailMethod = 'text';
$dbo->cols['pmf_pmcid']->option->newMethod = 'text';
$dbo->cols['pmf_pmcid']->option->editMethod = 'text';
$dbo->cols['pmf_obj_id'] = new DBO_COL('pmf_obj_id', 'int4', '4', '-1');
$dbo->cols['pmf_obj_id']->inputTypeDefault = 'text';
$dbo->cols['pmf_obj_id']->searchMode = 'exact';
$dbo->cols['pmf_obj_id']->capContClassDefault = array();
$dbo->cols['pmf_obj_id']->valContClassDefault = array();
$dbo->cols['pmf_obj_id']->option->defaultMethod = 'text';
$dbo->cols['pmf_obj_id']->option->searchMethod = 'text';
$dbo->cols['pmf_obj_id']->option->listMethod = 'text';
$dbo->cols['pmf_obj_id']->option->detailMethod = 'text';
$dbo->cols['pmf_obj_id']->option->newMethod = 'text';
$dbo->cols['pmf_obj_id']->option->editMethod = 'text';
$dbo->cols['pmf_obj_type'] = new DBO_COL('pmf_obj_type', 'varchar', '-1', '104');
$dbo->cols['pmf_obj_type']->inputTypeDefault = 'text';
$dbo->cols['pmf_obj_type']->searchMode = 'exact';
$dbo->cols['pmf_obj_type']->capContClassDefault = array();
$dbo->cols['pmf_obj_type']->valContClassDefault = array();
$dbo->cols['pmf_obj_type']->option->defaultMethod = 'text';
$dbo->cols['pmf_obj_type']->option->searchMethod = 'text';
$dbo->cols['pmf_obj_type']->option->listMethod = 'text';
$dbo->cols['pmf_obj_type']->option->detailMethod = 'text';
$dbo->cols['pmf_obj_type']->option->newMethod = 'text';
$dbo->cols['pmf_obj_type']->option->editMethod = 'text';
$dbo->cols['pmf_previd'] = new DBO_COL('pmf_previd', 'int4', '4', '-1');
$dbo->cols['pmf_previd']->inputTypeDefault = 'text';
$dbo->cols['pmf_previd']->searchMode = 'exact';
$dbo->cols['pmf_previd']->capContClassDefault = array();
$dbo->cols['pmf_previd']->valContClassDefault = array();
$dbo->cols['pmf_previd']->option->defaultMethod = 'text';
$dbo->cols['pmf_previd']->option->searchMethod = 'text';
$dbo->cols['pmf_previd']->option->listMethod = 'text';
$dbo->cols['pmf_previd']->option->detailMethod = 'text';
$dbo->cols['pmf_previd']->option->newMethod = 'text';
$dbo->cols['pmf_previd']->option->editMethod = 'text';
$dbo->cols['pmf_prev_pmcnid'] = new DBO_COL('pmf_prev_pmcnid', 'int4', '4', '-1');
$dbo->cols['pmf_prev_pmcnid']->inputTypeDefault = 'text';
$dbo->cols['pmf_prev_pmcnid']->searchMode = 'exact';
$dbo->cols['pmf_prev_pmcnid']->capContClassDefault = array();
$dbo->cols['pmf_prev_pmcnid']->valContClassDefault = array();
$dbo->cols['pmf_prev_pmcnid']->option->defaultMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->searchMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->listMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->detailMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->newMethod = 'text';
$dbo->cols['pmf_prev_pmcnid']->option->editMethod = 'text';
$dbo->cols['pmf_end_status'] = new DBO_COL('pmf_end_status', 'varchar', '-1', '36');
$dbo->cols['pmf_end_status']->inputTypeDefault = 'text';
$dbo->cols['pmf_end_status']->searchMode = 'exact';
$dbo->cols['pmf_end_status']->capContClassDefault = array();
$dbo->cols['pmf_end_status']->valContClassDefault = array();
$dbo->cols['pmf_end_status']->option->defaultMethod = 'text';
$dbo->cols['pmf_end_status']->option->searchMethod = 'text';
$dbo->cols['pmf_end_status']->option->listMethod = 'text';
$dbo->cols['pmf_end_status']->option->detailMethod = 'text';
$dbo->cols['pmf_end_status']->option->newMethod = 'text';
$dbo->cols['pmf_end_status']->option->editMethod = 'text';
$dbo->cols['pmf_last_perform_date'] = new DBO_COL('pmf_last_perform_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_last_perform_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_last_perform_date']->searchMode = 'exact';
$dbo->cols['pmf_last_perform_date']->capContClassDefault = array();
$dbo->cols['pmf_last_perform_date']->valContClassDefault = array();
$dbo->cols['pmf_last_perform_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->searchMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->listMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->detailMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->newMethod = 'text';
$dbo->cols['pmf_last_perform_date']->option->editMethod = 'text';
$dbo->cols['pmf_end_by'] = new DBO_COL('pmf_end_by', 'varchar', '-1', '104');
$dbo->cols['pmf_end_by']->inputTypeDefault = 'text';
$dbo->cols['pmf_end_by']->searchMode = 'exact';
$dbo->cols['pmf_end_by']->capContClassDefault = array();
$dbo->cols['pmf_end_by']->valContClassDefault = array();
$dbo->cols['pmf_end_by']->option->defaultMethod = 'text';
$dbo->cols['pmf_end_by']->option->searchMethod = 'text';
$dbo->cols['pmf_end_by']->option->listMethod = 'text';
$dbo->cols['pmf_end_by']->option->detailMethod = 'text';
$dbo->cols['pmf_end_by']->option->newMethod = 'text';
$dbo->cols['pmf_end_by']->option->editMethod = 'text';
$dbo->cols['pmf_end_pmfid'] = new DBO_COL('pmf_end_pmfid', 'int4', '4', '-1');
$dbo->cols['pmf_end_pmfid']->inputTypeDefault = 'text';
$dbo->cols['pmf_end_pmfid']->searchMode = 'exact';
$dbo->cols['pmf_end_pmfid']->capContClassDefault = array();
$dbo->cols['pmf_end_pmfid']->valContClassDefault = array();
$dbo->cols['pmf_end_pmfid']->option->defaultMethod = 'text';
$dbo->cols['pmf_end_pmfid']->option->searchMethod = 'text';
$dbo->cols['pmf_end_pmfid']->option->listMethod = 'text';
$dbo->cols['pmf_end_pmfid']->option->detailMethod = 'text';
$dbo->cols['pmf_end_pmfid']->option->newMethod = 'text';
$dbo->cols['pmf_end_pmfid']->option->editMethod = 'text';
$dbo->cols['pmf_from_event_gateway'] = new DBO_COL('pmf_from_event_gateway', 'varchar', '-1', '5');
$dbo->cols['pmf_from_event_gateway']->inputTypeDefault = 'text';
$dbo->cols['pmf_from_event_gateway']->searchMode = 'exact';
$dbo->cols['pmf_from_event_gateway']->capContClassDefault = array();
$dbo->cols['pmf_from_event_gateway']->valContClassDefault = array();
$dbo->cols['pmf_from_event_gateway']->option->defaultMethod = 'text';
$dbo->cols['pmf_from_event_gateway']->option->searchMethod = 'text';
$dbo->cols['pmf_from_event_gateway']->option->listMethod = 'text';
$dbo->cols['pmf_from_event_gateway']->option->detailMethod = 'text';
$dbo->cols['pmf_from_event_gateway']->option->newMethod = 'text';
$dbo->cols['pmf_from_event_gateway']->option->editMethod = 'text';
$dbo->cols['pmf_last_timer_check_date'] = new DBO_COL('pmf_last_timer_check_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_last_timer_check_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_last_timer_check_date']->searchMode = 'exact';
$dbo->cols['pmf_last_timer_check_date']->capContClassDefault = array();
$dbo->cols['pmf_last_timer_check_date']->valContClassDefault = array();
$dbo->cols['pmf_last_timer_check_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_last_timer_check_date']->option->searchMethod = 'text';
$dbo->cols['pmf_last_timer_check_date']->option->listMethod = 'text';
$dbo->cols['pmf_last_timer_check_date']->option->detailMethod = 'text';
$dbo->cols['pmf_last_timer_check_date']->option->newMethod = 'text';
$dbo->cols['pmf_last_timer_check_date']->option->editMethod = 'text';
$dbo->cols['pmf_timer_due_date'] = new DBO_COL('pmf_timer_due_date', 'timestamptz', '8', '-1');
$dbo->cols['pmf_timer_due_date']->inputTypeDefault = 'text';
$dbo->cols['pmf_timer_due_date']->searchMode = 'exact';
$dbo->cols['pmf_timer_due_date']->capContClassDefault = array();
$dbo->cols['pmf_timer_due_date']->valContClassDefault = array();
$dbo->cols['pmf_timer_due_date']->option->defaultMethod = 'text';
$dbo->cols['pmf_timer_due_date']->option->searchMethod = 'text';
$dbo->cols['pmf_timer_due_date']->option->listMethod = 'text';
$dbo->cols['pmf_timer_due_date']->option->detailMethod = 'text';
$dbo->cols['pmf_timer_due_date']->option->newMethod = 'text';
$dbo->cols['pmf_timer_due_date']->option->editMethod = 'text';
$dbo->cols['pmf_timer_due_count'] = new DBO_COL('pmf_timer_due_count', 'int4', '4', '-1');
$dbo->cols['pmf_timer_due_count']->inputTypeDefault = 'text';
$dbo->cols['pmf_timer_due_count']->searchMode = 'exact';
$dbo->cols['pmf_timer_due_count']->capContClassDefault = array();
$dbo->cols['pmf_timer_due_count']->valContClassDefault = array();
$dbo->cols['pmf_timer_due_count']->option->defaultMethod = 'text';
$dbo->cols['pmf_timer_due_count']->option->searchMethod = 'text';
$dbo->cols['pmf_timer_due_count']->option->listMethod = 'text';
$dbo->cols['pmf_timer_due_count']->option->detailMethod = 'text';
$dbo->cols['pmf_timer_due_count']->option->newMethod = 'text';
$dbo->cols['pmf_timer_due_count']->option->editMethod = 'text';
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
$dbo->cols['js_code'] = new DBO_COL('js_code', 'varchar', '-1', '36');
$dbo->cols['js_code']->inputTypeDefault = 'text';
$dbo->cols['js_code']->searchMode = 'exact';
$dbo->cols['js_code']->capContClassDefault = array();
$dbo->cols['js_code']->valContClassDefault = array();
$dbo->cols['js_code']->option->defaultMethod = 'text';
$dbo->cols['js_code']->option->searchMethod = 'text';
$dbo->cols['js_code']->option->listMethod = 'text';
$dbo->cols['js_code']->option->detailMethod = 'text';
$dbo->cols['js_code']->option->newMethod = 'text';
$dbo->cols['js_code']->option->editMethod = 'text';
$dbo->cols['js_description'] = new DBO_COL('js_description', 'text', '-1', '-1');
$dbo->cols['js_description']->inputTypeDefault = 'text';
$dbo->cols['js_description']->searchMode = 'exact';
$dbo->cols['js_description']->capContClassDefault = array();
$dbo->cols['js_description']->valContClassDefault = array();
$dbo->cols['js_description']->option->defaultMethod = 'text';
$dbo->cols['js_description']->option->searchMethod = 'text';
$dbo->cols['js_description']->option->listMethod = 'text';
$dbo->cols['js_description']->option->detailMethod = 'text';
$dbo->cols['js_description']->option->newMethod = 'text';
$dbo->cols['js_description']->option->editMethod = 'text';

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
class DBO_custom_rpt_performance_det extends DBO{
	function __construct(){
		parent::__construct();
	}
}

$dbo->newModifier = 'dbo_rpt_performance_det_custom_new';
function dbo_rpt_performance_det_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_rpt_performance_det_custom_edit';
function dbo_rpt_performance_det_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_rpt_performance_det_custom_search';
function dbo_rpt_performance_det_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_rpt_performance_det_custom_delete';
function dbo_rpt_performance_det_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_rpt_performance_det_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>