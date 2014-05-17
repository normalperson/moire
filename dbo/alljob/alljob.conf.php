<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'alljob';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjobsheet';
$dbo->key = array();
$dbo->sql = 'select js_cuid, js_ctid, js_request_date, js_title, js_status, js_completiondate, js_assignto,
org_name,ct_name,js_id from mjobsheet
join fcorg on js_cuid = org_id
join pndcontact on js_ctid = ct_id';
$dbo->col = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto', 'org_name', 'ct_name', 'js_id');
$dbo->colList = array('js_id', 'org_name', 'ct_name', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colNew = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colEdit = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colSearch = array('js_id', 'org_name', 'ct_name', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colExport = array('js_cuid', 'js_ctid', 'js_request_date', 'js_title', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colSort = array();
$dbo->canSearch = true;
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
$dbo->titleList = 'All jobs';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->layoutSearch = '1|1';
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

$dbo->cols['js_id'] = new DBO_COL('js_id', 'int4', '4', '-1');
$dbo->cols['js_id']->displayListModifierMethod = 'phpfunc';
$dbo->cols['js_id']->displayListModifier = 'getjobid';
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
$dbo->cols['js_request_date'] = new DBO_COL('js_request_date', 'timestamptz', '8', '-1');
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
$dbo->cols['js_request_by'] = new DBO_COL('js_request_by', 'varchar', '-1', '104');
$dbo->cols['js_request_by']->inputTypeDefault = 'text';
$dbo->cols['js_request_by']->searchMode = 'exact';
$dbo->cols['js_request_by']->capContClassDefault = array();
$dbo->cols['js_request_by']->valContClassDefault = array();
$dbo->cols['js_request_by']->option->defaultMethod = 'text';
$dbo->cols['js_request_by']->option->searchMethod = 'text';
$dbo->cols['js_request_by']->option->listMethod = 'text';
$dbo->cols['js_request_by']->option->detailMethod = 'text';
$dbo->cols['js_request_by']->option->newMethod = 'text';
$dbo->cols['js_request_by']->option->editMethod = 'text';
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
$dbo->cols['js_model'] = new DBO_COL('js_model', 'varchar', '-1', '2004');
$dbo->cols['js_model']->inputTypeDefault = 'text';
$dbo->cols['js_model']->searchMode = 'exact';
$dbo->cols['js_model']->capContClassDefault = array();
$dbo->cols['js_model']->valContClassDefault = array();
$dbo->cols['js_model']->option->defaultMethod = 'text';
$dbo->cols['js_model']->option->searchMethod = 'text';
$dbo->cols['js_model']->option->listMethod = 'text';
$dbo->cols['js_model']->option->detailMethod = 'text';
$dbo->cols['js_model']->option->newMethod = 'text';
$dbo->cols['js_model']->option->editMethod = 'text';
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
$dbo->cols['js_material_provided'] = new DBO_COL('js_material_provided', 'varchar', '-1', '104');
$dbo->cols['js_material_provided']->inputTypeDefault = 'text';
$dbo->cols['js_material_provided']->searchMode = 'exact';
$dbo->cols['js_material_provided']->capContClassDefault = array();
$dbo->cols['js_material_provided']->valContClassDefault = array();
$dbo->cols['js_material_provided']->option->defaultMethod = 'text';
$dbo->cols['js_material_provided']->option->searchMethod = 'text';
$dbo->cols['js_material_provided']->option->listMethod = 'text';
$dbo->cols['js_material_provided']->option->detailMethod = 'text';
$dbo->cols['js_material_provided']->option->newMethod = 'text';
$dbo->cols['js_material_provided']->option->editMethod = 'text';
$dbo->cols['js_color_1'] = new DBO_COL('js_color_1', 'varchar', '-1', '16');
$dbo->cols['js_color_1']->inputTypeDefault = 'text';
$dbo->cols['js_color_1']->searchMode = 'exact';
$dbo->cols['js_color_1']->capContClassDefault = array();
$dbo->cols['js_color_1']->valContClassDefault = array();
$dbo->cols['js_color_1']->option->defaultMethod = 'text';
$dbo->cols['js_color_1']->option->searchMethod = 'text';
$dbo->cols['js_color_1']->option->listMethod = 'text';
$dbo->cols['js_color_1']->option->detailMethod = 'text';
$dbo->cols['js_color_1']->option->newMethod = 'text';
$dbo->cols['js_color_1']->option->editMethod = 'text';
$dbo->cols['js_color_2'] = new DBO_COL('js_color_2', 'varchar', '-1', '16');
$dbo->cols['js_color_2']->inputTypeDefault = 'text';
$dbo->cols['js_color_2']->searchMode = 'exact';
$dbo->cols['js_color_2']->capContClassDefault = array();
$dbo->cols['js_color_2']->valContClassDefault = array();
$dbo->cols['js_color_2']->option->defaultMethod = 'text';
$dbo->cols['js_color_2']->option->searchMethod = 'text';
$dbo->cols['js_color_2']->option->listMethod = 'text';
$dbo->cols['js_color_2']->option->detailMethod = 'text';
$dbo->cols['js_color_2']->option->newMethod = 'text';
$dbo->cols['js_color_2']->option->editMethod = 'text';
$dbo->cols['js_color_3'] = new DBO_COL('js_color_3', 'varchar', '-1', '16');
$dbo->cols['js_color_3']->inputTypeDefault = 'text';
$dbo->cols['js_color_3']->searchMode = 'exact';
$dbo->cols['js_color_3']->capContClassDefault = array();
$dbo->cols['js_color_3']->valContClassDefault = array();
$dbo->cols['js_color_3']->option->defaultMethod = 'text';
$dbo->cols['js_color_3']->option->searchMethod = 'text';
$dbo->cols['js_color_3']->option->listMethod = 'text';
$dbo->cols['js_color_3']->option->detailMethod = 'text';
$dbo->cols['js_color_3']->option->newMethod = 'text';
$dbo->cols['js_color_3']->option->editMethod = 'text';
$dbo->cols['js_color_4'] = new DBO_COL('js_color_4', 'varchar', '-1', '16');
$dbo->cols['js_color_4']->inputTypeDefault = 'text';
$dbo->cols['js_color_4']->searchMode = 'exact';
$dbo->cols['js_color_4']->capContClassDefault = array();
$dbo->cols['js_color_4']->valContClassDefault = array();
$dbo->cols['js_color_4']->option->defaultMethod = 'text';
$dbo->cols['js_color_4']->option->searchMethod = 'text';
$dbo->cols['js_color_4']->option->listMethod = 'text';
$dbo->cols['js_color_4']->option->detailMethod = 'text';
$dbo->cols['js_color_4']->option->newMethod = 'text';
$dbo->cols['js_color_4']->option->editMethod = 'text';
$dbo->cols['js_angle_1'] = new DBO_COL('js_angle_1', 'varchar', '-1', '16');
$dbo->cols['js_angle_1']->inputTypeDefault = 'text';
$dbo->cols['js_angle_1']->searchMode = 'exact';
$dbo->cols['js_angle_1']->capContClassDefault = array();
$dbo->cols['js_angle_1']->valContClassDefault = array();
$dbo->cols['js_angle_1']->option->defaultMethod = 'text';
$dbo->cols['js_angle_1']->option->searchMethod = 'text';
$dbo->cols['js_angle_1']->option->listMethod = 'text';
$dbo->cols['js_angle_1']->option->detailMethod = 'text';
$dbo->cols['js_angle_1']->option->newMethod = 'text';
$dbo->cols['js_angle_1']->option->editMethod = 'text';
$dbo->cols['js_angle_2'] = new DBO_COL('js_angle_2', 'varchar', '-1', '16');
$dbo->cols['js_angle_2']->inputTypeDefault = 'text';
$dbo->cols['js_angle_2']->searchMode = 'exact';
$dbo->cols['js_angle_2']->capContClassDefault = array();
$dbo->cols['js_angle_2']->valContClassDefault = array();
$dbo->cols['js_angle_2']->option->defaultMethod = 'text';
$dbo->cols['js_angle_2']->option->searchMethod = 'text';
$dbo->cols['js_angle_2']->option->listMethod = 'text';
$dbo->cols['js_angle_2']->option->detailMethod = 'text';
$dbo->cols['js_angle_2']->option->newMethod = 'text';
$dbo->cols['js_angle_2']->option->editMethod = 'text';
$dbo->cols['js_angle_3'] = new DBO_COL('js_angle_3', 'varchar', '-1', '16');
$dbo->cols['js_angle_3']->inputTypeDefault = 'text';
$dbo->cols['js_angle_3']->searchMode = 'exact';
$dbo->cols['js_angle_3']->capContClassDefault = array();
$dbo->cols['js_angle_3']->valContClassDefault = array();
$dbo->cols['js_angle_3']->option->defaultMethod = 'text';
$dbo->cols['js_angle_3']->option->searchMethod = 'text';
$dbo->cols['js_angle_3']->option->listMethod = 'text';
$dbo->cols['js_angle_3']->option->detailMethod = 'text';
$dbo->cols['js_angle_3']->option->newMethod = 'text';
$dbo->cols['js_angle_3']->option->editMethod = 'text';
$dbo->cols['js_angle_4'] = new DBO_COL('js_angle_4', 'varchar', '-1', '16');
$dbo->cols['js_angle_4']->inputTypeDefault = 'text';
$dbo->cols['js_angle_4']->searchMode = 'exact';
$dbo->cols['js_angle_4']->capContClassDefault = array();
$dbo->cols['js_angle_4']->valContClassDefault = array();
$dbo->cols['js_angle_4']->option->defaultMethod = 'text';
$dbo->cols['js_angle_4']->option->searchMethod = 'text';
$dbo->cols['js_angle_4']->option->listMethod = 'text';
$dbo->cols['js_angle_4']->option->detailMethod = 'text';
$dbo->cols['js_angle_4']->option->newMethod = 'text';
$dbo->cols['js_angle_4']->option->editMethod = 'text';
$dbo->cols['js_bleeding'] = new DBO_COL('js_bleeding', 'varchar', '-1', '16');
$dbo->cols['js_bleeding']->inputTypeDefault = 'text';
$dbo->cols['js_bleeding']->searchMode = 'exact';
$dbo->cols['js_bleeding']->capContClassDefault = array();
$dbo->cols['js_bleeding']->valContClassDefault = array();
$dbo->cols['js_bleeding']->option->defaultMethod = 'text';
$dbo->cols['js_bleeding']->option->searchMethod = 'text';
$dbo->cols['js_bleeding']->option->listMethod = 'text';
$dbo->cols['js_bleeding']->option->detailMethod = 'text';
$dbo->cols['js_bleeding']->option->newMethod = 'text';
$dbo->cols['js_bleeding']->option->editMethod = 'text';
$dbo->cols['js_bleeding_remark'] = new DBO_COL('js_bleeding_remark', 'varchar', '-1', '1004');
$dbo->cols['js_bleeding_remark']->inputTypeDefault = 'text';
$dbo->cols['js_bleeding_remark']->searchMode = 'exact';
$dbo->cols['js_bleeding_remark']->capContClassDefault = array();
$dbo->cols['js_bleeding_remark']->valContClassDefault = array();
$dbo->cols['js_bleeding_remark']->option->defaultMethod = 'text';
$dbo->cols['js_bleeding_remark']->option->searchMethod = 'text';
$dbo->cols['js_bleeding_remark']->option->listMethod = 'text';
$dbo->cols['js_bleeding_remark']->option->detailMethod = 'text';
$dbo->cols['js_bleeding_remark']->option->newMethod = 'text';
$dbo->cols['js_bleeding_remark']->option->editMethod = 'text';
$dbo->cols['js_carcode'] = new DBO_COL('js_carcode', 'varchar', '-1', '16');
$dbo->cols['js_carcode']->inputTypeDefault = 'text';
$dbo->cols['js_carcode']->searchMode = 'exact';
$dbo->cols['js_carcode']->capContClassDefault = array();
$dbo->cols['js_carcode']->valContClassDefault = array();
$dbo->cols['js_carcode']->option->defaultMethod = 'text';
$dbo->cols['js_carcode']->option->searchMethod = 'text';
$dbo->cols['js_carcode']->option->listMethod = 'text';
$dbo->cols['js_carcode']->option->detailMethod = 'text';
$dbo->cols['js_carcode']->option->newMethod = 'text';
$dbo->cols['js_carcode']->option->editMethod = 'text';
$dbo->cols['js_distortion'] = new DBO_COL('js_distortion', 'varchar', '-1', '5');
$dbo->cols['js_distortion']->inputTypeDefault = 'text';
$dbo->cols['js_distortion']->searchMode = 'exact';
$dbo->cols['js_distortion']->capContClassDefault = array();
$dbo->cols['js_distortion']->valContClassDefault = array();
$dbo->cols['js_distortion']->option->defaultMethod = 'text';
$dbo->cols['js_distortion']->option->searchMethod = 'text';
$dbo->cols['js_distortion']->option->listMethod = 'text';
$dbo->cols['js_distortion']->option->detailMethod = 'text';
$dbo->cols['js_distortion']->option->newMethod = 'text';
$dbo->cols['js_distortion']->option->editMethod = 'text';
$dbo->cols['js_distortion_value'] = new DBO_COL('js_distortion_value', 'numeric', '-1', '1310728');
$dbo->cols['js_distortion_value']->inputTypeDefault = 'text';
$dbo->cols['js_distortion_value']->searchMode = 'exact';
$dbo->cols['js_distortion_value']->capContClassDefault = array();
$dbo->cols['js_distortion_value']->valContClassDefault = array();
$dbo->cols['js_distortion_value']->option->defaultMethod = 'text';
$dbo->cols['js_distortion_value']->option->searchMethod = 'text';
$dbo->cols['js_distortion_value']->option->listMethod = 'text';
$dbo->cols['js_distortion_value']->option->detailMethod = 'text';
$dbo->cols['js_distortion_value']->option->newMethod = 'text';
$dbo->cols['js_distortion_value']->option->editMethod = 'text';
$dbo->cols['js_diecut_ind'] = new DBO_COL('js_diecut_ind', 'varchar', '-1', '5');
$dbo->cols['js_diecut_ind']->inputTypeDefault = 'text';
$dbo->cols['js_diecut_ind']->searchMode = 'exact';
$dbo->cols['js_diecut_ind']->capContClassDefault = array();
$dbo->cols['js_diecut_ind']->valContClassDefault = array();
$dbo->cols['js_diecut_ind']->option->defaultMethod = 'text';
$dbo->cols['js_diecut_ind']->option->searchMethod = 'text';
$dbo->cols['js_diecut_ind']->option->listMethod = 'text';
$dbo->cols['js_diecut_ind']->option->detailMethod = 'text';
$dbo->cols['js_diecut_ind']->option->newMethod = 'text';
$dbo->cols['js_diecut_ind']->option->editMethod = 'text';
$dbo->cols['js_diecut_no'] = new DBO_COL('js_diecut_no', 'varchar', '-1', '104');
$dbo->cols['js_diecut_no']->inputTypeDefault = 'text';
$dbo->cols['js_diecut_no']->searchMode = 'exact';
$dbo->cols['js_diecut_no']->capContClassDefault = array();
$dbo->cols['js_diecut_no']->valContClassDefault = array();
$dbo->cols['js_diecut_no']->option->defaultMethod = 'text';
$dbo->cols['js_diecut_no']->option->searchMethod = 'text';
$dbo->cols['js_diecut_no']->option->listMethod = 'text';
$dbo->cols['js_diecut_no']->option->detailMethod = 'text';
$dbo->cols['js_diecut_no']->option->newMethod = 'text';
$dbo->cols['js_diecut_no']->option->editMethod = 'text';
$dbo->cols['js_category'] = new DBO_COL('js_category', 'varchar', '-1', '504');
$dbo->cols['js_category']->inputTypeDefault = 'text';
$dbo->cols['js_category']->searchMode = 'exact';
$dbo->cols['js_category']->capContClassDefault = array();
$dbo->cols['js_category']->valContClassDefault = array();
$dbo->cols['js_category']->option->defaultMethod = 'text';
$dbo->cols['js_category']->option->searchMethod = 'text';
$dbo->cols['js_category']->option->listMethod = 'text';
$dbo->cols['js_category']->option->detailMethod = 'text';
$dbo->cols['js_category']->option->newMethod = 'text';
$dbo->cols['js_category']->option->editMethod = 'text';
$dbo->cols['js_trapping_size'] = new DBO_COL('js_trapping_size', 'numeric', '-1', '1310728');
$dbo->cols['js_trapping_size']->inputTypeDefault = 'text';
$dbo->cols['js_trapping_size']->searchMode = 'exact';
$dbo->cols['js_trapping_size']->capContClassDefault = array();
$dbo->cols['js_trapping_size']->valContClassDefault = array();
$dbo->cols['js_trapping_size']->option->defaultMethod = 'text';
$dbo->cols['js_trapping_size']->option->searchMethod = 'text';
$dbo->cols['js_trapping_size']->option->listMethod = 'text';
$dbo->cols['js_trapping_size']->option->detailMethod = 'text';
$dbo->cols['js_trapping_size']->option->newMethod = 'text';
$dbo->cols['js_trapping_size']->option->editMethod = 'text';
$dbo->cols['js_barcodetype'] = new DBO_COL('js_barcodetype', 'int4', '4', '-1');
$dbo->cols['js_barcodetype']->inputTypeDefault = 'text';
$dbo->cols['js_barcodetype']->searchMode = 'exact';
$dbo->cols['js_barcodetype']->capContClassDefault = array();
$dbo->cols['js_barcodetype']->valContClassDefault = array();
$dbo->cols['js_barcodetype']->option->defaultMethod = 'text';
$dbo->cols['js_barcodetype']->option->searchMethod = 'text';
$dbo->cols['js_barcodetype']->option->listMethod = 'text';
$dbo->cols['js_barcodetype']->option->detailMethod = 'text';
$dbo->cols['js_barcodetype']->option->newMethod = 'text';
$dbo->cols['js_barcodetype']->option->editMethod = 'text';
$dbo->cols['js_barcodenumber'] = new DBO_COL('js_barcodenumber', 'varchar', '-1', '104');
$dbo->cols['js_barcodenumber']->inputTypeDefault = 'text';
$dbo->cols['js_barcodenumber']->searchMode = 'exact';
$dbo->cols['js_barcodenumber']->capContClassDefault = array();
$dbo->cols['js_barcodenumber']->valContClassDefault = array();
$dbo->cols['js_barcodenumber']->option->defaultMethod = 'text';
$dbo->cols['js_barcodenumber']->option->searchMethod = 'text';
$dbo->cols['js_barcodenumber']->option->listMethod = 'text';
$dbo->cols['js_barcodenumber']->option->detailMethod = 'text';
$dbo->cols['js_barcodenumber']->option->newMethod = 'text';
$dbo->cols['js_barcodenumber']->option->editMethod = 'text';
$dbo->cols['js_primcat'] = new DBO_COL('js_primcat', 'int4', '4', '-1');
$dbo->cols['js_primcat']->inputTypeDefault = 'text';
$dbo->cols['js_primcat']->searchMode = 'exact';
$dbo->cols['js_primcat']->capContClassDefault = array();
$dbo->cols['js_primcat']->valContClassDefault = array();
$dbo->cols['js_primcat']->option->defaultMethod = 'text';
$dbo->cols['js_primcat']->option->searchMethod = 'text';
$dbo->cols['js_primcat']->option->listMethod = 'text';
$dbo->cols['js_primcat']->option->detailMethod = 'text';
$dbo->cols['js_primcat']->option->newMethod = 'text';
$dbo->cols['js_primcat']->option->editMethod = 'text';
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
$dbo->cols['js_assignto']->inputTypeDefault = 'text';
$dbo->cols['js_assignto']->searchMode = 'exact';
$dbo->cols['js_assignto']->capContClassDefault = array();
$dbo->cols['js_assignto']->valContClassDefault = array();
$dbo->cols['js_assignto']->option->defaultMethod = 'text';
$dbo->cols['js_assignto']->option->searchMethod = 'text';
$dbo->cols['js_assignto']->option->listMethod = 'text';
$dbo->cols['js_assignto']->option->detailMethod = 'text';
$dbo->cols['js_assignto']->option->newMethod = 'text';
$dbo->cols['js_assignto']->option->editMethod = 'text';
$dbo->cols['org_id'] = new DBO_COL('org_id', 'int4', '4', '-1');
$dbo->cols['org_id']->inputTypeDefault = 'text';
$dbo->cols['org_id']->searchMode = 'exact';
$dbo->cols['org_id']->capContClassDefault = array();
$dbo->cols['org_id']->valContClassDefault = array();
$dbo->cols['org_id']->option->defaultMethod = 'text';
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
$dbo->cols['ct_refid']->inputTypeDefault = 'text';
$dbo->cols['ct_refid']->searchMode = 'exact';
$dbo->cols['ct_refid']->capContClassDefault = array();
$dbo->cols['ct_refid']->valContClassDefault = array();
$dbo->cols['ct_refid']->option->defaultMethod = 'text';
$dbo->cols['ct_refid']->option->searchMethod = 'text';
$dbo->cols['ct_refid']->option->listMethod = 'text';
$dbo->cols['ct_refid']->option->detailMethod = 'text';
$dbo->cols['ct_refid']->option->newMethod = 'text';
$dbo->cols['ct_refid']->option->editMethod = 'text';
$dbo->cols['ct_reftype'] = new DBO_COL('ct_reftype', 'varchar', '-1', '54');
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
$dbo->newModifier = 'dbo_alljob_custom_new';
function dbo_alljob_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_alljob_custom_edit';
function dbo_alljob_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_alljob_custom_search';
function dbo_alljob_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_alljob_custom_delete';
function dbo_alljob_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_alljob_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>