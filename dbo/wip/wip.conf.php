<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'wip';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjobsheet';
$dbo->key = array('js_id');
$dbo->sql = 'select mjobsheet.*, \'\' decision, \'\' remark,\'\' artwork,\'\' widthheight from mjobsheet';
$dbo->col = array('js_id', 'js_cuid', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_bleeding', 'js_bleeding_remark', 'js_carcode', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_category', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto', 'decision', 'remark', 'artwork', 'widthheight');
$dbo->colList = array('js_id', 'js_cuid', 'js_ctid', 'js_request_date', 'js_request_by');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('js_id', 'js_cuid', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_bleeding', 'js_bleeding_remark', 'js_carcode', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_category', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colNew = array('decision', 'remark', 'artwork');
$dbo->colEdit = array('decision', 'remark', 'widthheight', 'artwork');
$dbo->colSearch = array('js_id', 'js_cuid', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_bleeding', 'js_bleeding_remark', 'js_carcode', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_category', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colExport = array('js_id', 'js_cuid', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_bleeding', 'js_bleeding_remark', 'js_carcode', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_category', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colSort = array();
$dbo->canSearch = false;
$dbo->canNew = true;
$dbo->canEdit = true;
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
$dbo->titleEdit = 'Update case status';
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
$dbo->cols['decision'] = new DBO_COL('decision', 'unknown', '-2', '-1');
$dbo->cols['decision']->inputTypeDefault = 'select';
$dbo->cols['decision']->searchMode = 'exact';
$dbo->cols['decision']->capContClassDefault = array();
$dbo->cols['decision']->valContClassDefault = array();
$dbo->cols['decision']->option->default = 'Complete';
$dbo->cols['decision']->option->defaultMethod = 'text';
$dbo->cols['decision']->option->searchMethod = 'text';
$dbo->cols['decision']->option->listMethod = 'text';
$dbo->cols['decision']->option->detailMethod = 'text';
$dbo->cols['decision']->option->newMethod = 'text';
$dbo->cols['decision']->option->editMethod = 'text';
$dbo->cols['remark'] = new DBO_COL('remark', 'unknown', '-2', '-1');
$dbo->cols['remark']->inputTypeDefault = 'text';
$dbo->cols['remark']->searchMode = 'exact';
$dbo->cols['remark']->capContClassDefault = array();
$dbo->cols['remark']->valContClassDefault = array();
$dbo->cols['remark']->option->defaultMethod = 'text';
$dbo->cols['remark']->option->searchMethod = 'text';
$dbo->cols['remark']->option->listMethod = 'text';
$dbo->cols['remark']->option->detailMethod = 'text';
$dbo->cols['remark']->option->newMethod = 'text';
$dbo->cols['remark']->option->editMethod = 'text';
$dbo->cols['artwork'] = new DBO_COL('artwork', 'unknown', '-2', '-1');
$dbo->cols['artwork']->inputTypeDefault = 'file';
$dbo->cols['artwork']->searchMode = 'exact';
$dbo->cols['artwork']->capContClassDefault = array();
$dbo->cols['artwork']->valContClassDefault = array();
$dbo->cols['artwork']->option->defaultMethod = 'text';
$dbo->cols['artwork']->option->searchMethod = 'text';
$dbo->cols['artwork']->option->listMethod = 'text';
$dbo->cols['artwork']->option->detailMethod = 'text';
$dbo->cols['artwork']->option->newMethod = 'text';
$dbo->cols['artwork']->option->editMethod = 'text';
$dbo->cols['widthheight'] = new DBO_COL('widthheight', 'unknown', '-2', '-1');
$dbo->cols['widthheight']->inputTypeDefault = 'text';
$dbo->cols['widthheight']->searchMode = 'exact';
$dbo->cols['widthheight']->capContClassDefault = array();
$dbo->cols['widthheight']->valContClassDefault = array();
$dbo->cols['widthheight']->option->defaultMethod = 'text';
$dbo->cols['widthheight']->option->searchMethod = 'text';
$dbo->cols['widthheight']->option->listMethod = 'text';
$dbo->cols['widthheight']->option->detailMethod = 'text';
$dbo->cols['widthheight']->option->newMethod = 'text';
$dbo->cols['widthheight']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_wip_custom_new';
function dbo_wip_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_wip_custom_edit';
function dbo_wip_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_wip_custom_search';
function dbo_wip_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_wip_custom_delete';
function dbo_wip_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_wip_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>