<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dboID = 'reqverification';
$dbo = DBO_init($dboID);
$dbo->id = $dboID;
$dbo->table = 'mjobsheet';
$dbo->key = array('js_id');
$dbo->sql = 'select mjobsheet.*, \'\' decision, \'\' remark from mjobsheet';
$dbo->col = array('js_id', 'js_orgid', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_color_5', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_angle_5', 'js_bleeding', 'js_bleeding_remark', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto', 'js_carid', 'js_decision', 'decision', 'remark');
$dbo->colList = array('js_id', 'js_ctid', 'js_request_date', 'js_request_by');
$dbo->colListEdit = array();
$dbo->colListNew = array();
$dbo->colListGlobalInput = array();
$dbo->colDetail = array('js_id', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_bleeding', 'js_bleeding_remark', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colNew = array('js_id', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_bleeding', 'js_bleeding_remark', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colEdit = array('js_decision', 'js_assignto', 'remark');
$dbo->colSearch = array('js_id', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_bleeding', 'js_bleeding_remark', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colExport = array('js_id', 'js_ctid', 'js_request_date', 'js_request_by', 'js_title', 'js_model', 'js_description', 'js_material_provided', 'js_color_1', 'js_color_2', 'js_color_3', 'js_color_4', 'js_angle_1', 'js_angle_2', 'js_angle_3', 'js_angle_4', 'js_bleeding', 'js_bleeding_remark', 'js_distortion', 'js_distortion_value', 'js_diecut_ind', 'js_diecut_no', 'js_trapping_size', 'js_barcodetype', 'js_barcodenumber', 'js_primcat', 'js_status', 'js_completiondate', 'js_assignto');
$dbo->colSort = array();
$dbo->canSearch = false;
$dbo->canNew = false;
$dbo->canEdit = true;
$dbo->canDelete = false;
$dbo->canDetail = false;
$dbo->canListEdit = false;
$dbo->canListNew = false;
$dbo->canNewGroup = array();
$dbo->canEditGroup = array();
$dbo->canDeleteGroup = array();
$dbo->showSearch = true;
$dbo->editModifier = 'dbo_reqverification_custom_edit';
$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Decision';
$dbo->titleSearch = 'Search Record';
$dbo->layoutEdit = '1|1;
2';
$dbo->theme = 'pixeladmin';
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
$dbo->cols['js_cuid']->option->default = 'select org_id, org_name from fcorg
order by org_name';
$dbo->cols['js_cuid']->option->defaultMethod = 'sql';
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
$dbo->cols['js_cyan'] = new DBO_COL('js_cyan', 'varchar', '-1', '16');
$dbo->cols['js_cyan']->inputTypeDefault = 'checkbox';
$dbo->cols['js_cyan']->searchMode = 'exact';
$dbo->cols['js_cyan']->capContClassDefault = array();
$dbo->cols['js_cyan']->valContClassDefault = array();
$dbo->cols['js_cyan']->option->default = 'Y';
$dbo->cols['js_cyan']->option->defaultMethod = 'text';
$dbo->cols['js_cyan']->option->searchMethod = 'text';
$dbo->cols['js_cyan']->option->listMethod = 'text';
$dbo->cols['js_cyan']->option->detailMethod = 'text';
$dbo->cols['js_cyan']->option->newMethod = 'text';
$dbo->cols['js_cyan']->option->editMethod = 'text';
$dbo->cols['js_magenta'] = new DBO_COL('js_magenta', 'varchar', '-1', '16');
$dbo->cols['js_magenta']->inputTypeDefault = 'checkbox';
$dbo->cols['js_magenta']->searchMode = 'exact';
$dbo->cols['js_magenta']->capContClassDefault = array();
$dbo->cols['js_magenta']->valContClassDefault = array();
$dbo->cols['js_magenta']->option->default = 'Y';
$dbo->cols['js_magenta']->option->defaultMethod = 'text';
$dbo->cols['js_magenta']->option->searchMethod = 'text';
$dbo->cols['js_magenta']->option->listMethod = 'text';
$dbo->cols['js_magenta']->option->detailMethod = 'text';
$dbo->cols['js_magenta']->option->newMethod = 'text';
$dbo->cols['js_magenta']->option->editMethod = 'text';
$dbo->cols['js_yellow'] = new DBO_COL('js_yellow', 'varchar', '-1', '16');
$dbo->cols['js_yellow']->inputTypeDefault = 'checkbox';
$dbo->cols['js_yellow']->searchMode = 'exact';
$dbo->cols['js_yellow']->capContClassDefault = array();
$dbo->cols['js_yellow']->valContClassDefault = array();
$dbo->cols['js_yellow']->option->default = 'Y';
$dbo->cols['js_yellow']->option->defaultMethod = 'text';
$dbo->cols['js_yellow']->option->searchMethod = 'text';
$dbo->cols['js_yellow']->option->listMethod = 'text';
$dbo->cols['js_yellow']->option->detailMethod = 'text';
$dbo->cols['js_yellow']->option->newMethod = 'text';
$dbo->cols['js_yellow']->option->editMethod = 'text';
$dbo->cols['js_black'] = new DBO_COL('js_black', 'varchar', '-1', '16');
$dbo->cols['js_black']->inputTypeDefault = 'checkbox';
$dbo->cols['js_black']->searchMode = 'exact';
$dbo->cols['js_black']->capContClassDefault = array();
$dbo->cols['js_black']->valContClassDefault = array();
$dbo->cols['js_black']->option->default = 'Y';
$dbo->cols['js_black']->option->defaultMethod = 'text';
$dbo->cols['js_black']->option->searchMethod = 'text';
$dbo->cols['js_black']->option->listMethod = 'text';
$dbo->cols['js_black']->option->detailMethod = 'text';
$dbo->cols['js_black']->option->newMethod = 'text';
$dbo->cols['js_black']->option->editMethod = 'text';
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
$dbo->cols['js_color_5'] = new DBO_COL('js_color_5', 'varchar', '-1', '16');
$dbo->cols['js_color_5']->inputTypeDefault = 'text';
$dbo->cols['js_color_5']->searchMode = 'exact';
$dbo->cols['js_color_5']->capContClassDefault = array();
$dbo->cols['js_color_5']->valContClassDefault = array();
$dbo->cols['js_color_5']->option->defaultMethod = 'text';
$dbo->cols['js_color_5']->option->searchMethod = 'text';
$dbo->cols['js_color_5']->option->listMethod = 'text';
$dbo->cols['js_color_5']->option->detailMethod = 'text';
$dbo->cols['js_color_5']->option->newMethod = 'text';
$dbo->cols['js_color_5']->option->editMethod = 'text';
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
$dbo->cols['js_angle_5'] = new DBO_COL('js_angle_5', 'varchar', '-1', '16');
$dbo->cols['js_angle_5']->inputTypeDefault = 'text';
$dbo->cols['js_angle_5']->searchMode = 'exact';
$dbo->cols['js_angle_5']->capContClassDefault = array();
$dbo->cols['js_angle_5']->valContClassDefault = array();
$dbo->cols['js_angle_5']->option->defaultMethod = 'text';
$dbo->cols['js_angle_5']->option->searchMethod = 'text';
$dbo->cols['js_angle_5']->option->listMethod = 'text';
$dbo->cols['js_angle_5']->option->detailMethod = 'text';
$dbo->cols['js_angle_5']->option->newMethod = 'text';
$dbo->cols['js_angle_5']->option->editMethod = 'text';
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
$dbo->cols['js_carcode']->inputTypeDefault = 'select';
$dbo->cols['js_carcode']->searchMode = 'exact';
$dbo->cols['js_carcode']->capContClassDefault = array();
$dbo->cols['js_carcode']->valContClassDefault = array();
$dbo->cols['js_carcode']->option->default = 'select car_id,car_name from mcarton
order by car_name';
$dbo->cols['js_carcode']->option->defaultMethod = 'sql';
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
$dbo->cols['js_thicknessplate'] = new DBO_COL('js_thicknessplate', 'varchar', '-1', '104');
$dbo->cols['js_thicknessplate']->inputTypeDefault = 'text';
$dbo->cols['js_thicknessplate']->searchMode = 'exact';
$dbo->cols['js_thicknessplate']->capContClassDefault = array();
$dbo->cols['js_thicknessplate']->valContClassDefault = array();
$dbo->cols['js_thicknessplate']->option->defaultMethod = 'text';
$dbo->cols['js_thicknessplate']->option->searchMethod = 'text';
$dbo->cols['js_thicknessplate']->option->listMethod = 'text';
$dbo->cols['js_thicknessplate']->option->detailMethod = 'text';
$dbo->cols['js_thicknessplate']->option->newMethod = 'text';
$dbo->cols['js_thicknessplate']->option->editMethod = 'text';
$dbo->cols['js_category'] = new DBO_COL('js_category', 'varchar', '-1', '504');
$dbo->cols['js_category']->inputTypeDefault = 'checkbox';
$dbo->cols['js_category']->searchMode = 'exact';
$dbo->cols['js_category']->capContClassDefault = array();
$dbo->cols['js_category']->valContClassDefault = array();
$dbo->cols['js_category']->option->default = 'select jcl_id, jcl_title 
from mjobcatlookup
order by jcl_title';
$dbo->cols['js_category']->option->defaultMethod = 'sql';
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
$dbo->cols['js_assignto']->inputTypeDefault = 'select';
$dbo->cols['js_assignto']->searchMode = 'exact';
$dbo->cols['js_assignto']->capContClassDefault = array();
$dbo->cols['js_assignto']->valContClassDefault = array();
$dbo->cols['js_assignto']->option->default = 'select usr_userid from fcuser
join fcuserorgrole on uor_usrid = usr_userid
where uor_rolid = 20
group by usr_userid';
$dbo->cols['js_assignto']->option->defaultMethod = 'sql';
$dbo->cols['js_assignto']->option->searchMethod = 'text';
$dbo->cols['js_assignto']->option->listMethod = 'text';
$dbo->cols['js_assignto']->option->detailMethod = 'text';
$dbo->cols['js_assignto']->option->newMethod = 'text';
$dbo->cols['js_assignto']->option->editMethod = 'text';
$dbo->cols['js_refid'] = new DBO_COL('js_refid', 'int4', '4', '-1');
$dbo->cols['js_refid']->inputTypeDefault = 'text';
$dbo->cols['js_refid']->searchMode = 'exact';
$dbo->cols['js_refid']->capContClassDefault = array();
$dbo->cols['js_refid']->valContClassDefault = array();
$dbo->cols['js_refid']->option->defaultMethod = 'text';
$dbo->cols['js_refid']->option->searchMethod = 'text';
$dbo->cols['js_refid']->option->listMethod = 'text';
$dbo->cols['js_refid']->option->detailMethod = 'text';
$dbo->cols['js_refid']->option->newMethod = 'text';
$dbo->cols['js_refid']->option->editMethod = 'text';
$dbo->cols['attachment'] = new DBO_COL('attachment', 'unknown', '-2', '-1');
$dbo->cols['attachment']->inputTypeDefault = 'file';
$dbo->cols['attachment']->searchMode = 'exact';
$dbo->cols['attachment']->capContClassDefault = array();
$dbo->cols['attachment']->valContClassDefault = array();
$dbo->cols['attachment']->option->defaultMethod = 'text';
$dbo->cols['attachment']->option->searchMethod = 'text';
$dbo->cols['attachment']->option->listMethod = 'text';
$dbo->cols['attachment']->option->detailMethod = 'text';
$dbo->cols['attachment']->option->newMethod = 'text';
$dbo->cols['attachment']->option->editMethod = 'text';
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
$dbo->cols['js_orgid'] = new DBO_COL('js_orgid', 'int4', '4', '-1');
$dbo->cols['js_orgid']->inputTypeDefault = 'text';
$dbo->cols['js_orgid']->searchMode = 'exact';
$dbo->cols['js_orgid']->capContClassDefault = array();
$dbo->cols['js_orgid']->valContClassDefault = array();
$dbo->cols['js_orgid']->option->defaultMethod = 'text';
$dbo->cols['js_orgid']->option->searchMethod = 'text';
$dbo->cols['js_orgid']->option->listMethod = 'text';
$dbo->cols['js_orgid']->option->detailMethod = 'text';
$dbo->cols['js_orgid']->option->newMethod = 'text';
$dbo->cols['js_orgid']->option->editMethod = 'text';
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
$dbo->cols['info'] = new DBO_COL('info', 'unknown', '-2', '-1');
$dbo->cols['info']->inputNewModifierMethod = 'phpfunc';
$dbo->cols['info']->inputEditModifierMethod = 'phpfunc';
$dbo->cols['info']->inputNewModifier = 'showinfo';
$dbo->cols['info']->inputEditModifier = 'showinfo';
$dbo->cols['info']->inputTypeDefault = 'text';
$dbo->cols['info']->searchMode = 'exact';
$dbo->cols['info']->capContClassDefault = array();
$dbo->cols['info']->valContClassDefault = array();
$dbo->cols['info']->option->defaultMethod = 'text';
$dbo->cols['info']->option->searchMethod = 'text';
$dbo->cols['info']->option->listMethod = 'text';
$dbo->cols['info']->option->detailMethod = 'text';
$dbo->cols['info']->option->newMethod = 'text';
$dbo->cols['info']->option->editMethod = 'text';
$dbo->cols['js_carid'] = new DBO_COL('js_carid', 'int4', '4', '-1');
$dbo->cols['js_carid']->inputTypeDefault = 'text';
$dbo->cols['js_carid']->searchMode = 'exact';
$dbo->cols['js_carid']->capContClassDefault = array();
$dbo->cols['js_carid']->valContClassDefault = array();
$dbo->cols['js_carid']->option->defaultMethod = 'text';
$dbo->cols['js_carid']->option->searchMethod = 'text';
$dbo->cols['js_carid']->option->listMethod = 'text';
$dbo->cols['js_carid']->option->detailMethod = 'text';
$dbo->cols['js_carid']->option->newMethod = 'text';
$dbo->cols['js_carid']->option->editMethod = 'text';
$dbo->cols['jobcategory'] = new DBO_COL('jobcategory', 'varchar', '-1', '-1');
$dbo->cols['jobcategory']->inputTypeDefault = 'checkbox';
$dbo->cols['jobcategory']->searchMode = 'exact';
$dbo->cols['jobcategory']->capContClassDefault = array();
$dbo->cols['jobcategory']->valContClassDefault = array();
$dbo->cols['jobcategory']->option->default = 'select jcl_id, jcl_title 
from mjobcatlookup
order by jcl_title';
$dbo->cols['jobcategory']->option->defaultMethod = 'sql';
$dbo->cols['jobcategory']->option->searchMethod = 'text';
$dbo->cols['jobcategory']->option->listMethod = 'text';
$dbo->cols['jobcategory']->option->detailMethod = 'text';
$dbo->cols['jobcategory']->option->newMethod = 'text';
$dbo->cols['jobcategory']->option->editMethod = 'text';
$dbo->cols['js_decision'] = new DBO_COL('js_decision', 'varchar', '-1', '54');
$dbo->cols['js_decision']->inputTypeDefault = 'select';
$dbo->cols['js_decision']->searchMode = 'exact';
$dbo->cols['js_decision']->capContClassDefault = array();
$dbo->cols['js_decision']->valContClassDefault = array();
$dbo->cols['js_decision']->option->default = 'Revert
Assign';
$dbo->cols['js_decision']->option->defaultMethod = 'text';
$dbo->cols['js_decision']->option->searchMethod = 'text';
$dbo->cols['js_decision']->option->listMethod = 'text';
$dbo->cols['js_decision']->option->detailMethod = 'text';
$dbo->cols['js_decision']->option->newMethod = 'text';
$dbo->cols['js_decision']->option->editMethod = 'text';
$dbo->cols['decision'] = new DBO_COL('decision', 'unknown', '-2', '-1');
$dbo->cols['decision']->inputTypeDefault = 'text';
$dbo->cols['decision']->searchMode = 'exact';
$dbo->cols['decision']->capContClassDefault = array();
$dbo->cols['decision']->valContClassDefault = array();
$dbo->cols['decision']->option->defaultMethod = 'text';
$dbo->cols['decision']->option->searchMethod = 'text';
$dbo->cols['decision']->option->listMethod = 'text';
$dbo->cols['decision']->option->detailMethod = 'text';
$dbo->cols['decision']->option->newMethod = 'text';
$dbo->cols['decision']->option->editMethod = 'text';

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
$dbo->newModifier = 'dbo_reqverification_custom_new';
function dbo_reqverification_custom_new($table, $cols){
	global $DB;
	$ret = array();
	$ok = $DB->doInsert($table, $cols);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->editModifier = 'dbo_reqverification_custom_edit';
function dbo_reqverification_custom_edit($table, $cols, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doUpdate($table, $cols, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

$dbo->searchModifier = 'dbo_reqverification_custom_search';
function dbo_reqverification_custom_search(&$search){
}

$dbo->deleteModifier = 'dbo_reqverification_custom_delete';
function dbo_reqverification_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	return $ret;
}

function dbo_reqverification_display_modifier($col, $colVal, $data=array(), $html=null){
}
*/
?>