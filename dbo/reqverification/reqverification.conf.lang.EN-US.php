<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['js_id']->caption->set('default', 'js_id', 'text');
$dbo->cols['js_cuid']->caption->set('default', 'Customer', 'text');
$dbo->cols['js_ctid']->caption->set('default', 'js_ctid', 'text');
$dbo->cols['js_request_date']->caption->set('default', 'js_request_date', 'text');
$dbo->cols['js_request_by']->caption->set('default', 'js_request_by', 'text');
$dbo->cols['js_title']->caption->set('default', 'js_title', 'text');
$dbo->cols['js_description']->caption->set('default', 'js_description', 'text');
$dbo->cols['js_material_provided']->caption->set('default', 'js_material_provided', 'text');
$dbo->cols['js_cyan']->caption->set('default', 'Cyan', 'text');
$dbo->cols['js_cyan']->caption->setTabCaption('default', 'COLOR', 'text');
$dbo->cols['js_magenta']->caption->set('default', 'Magenta', 'text');
$dbo->cols['js_yellow']->caption->set('default', 'Yellow', 'text');
$dbo->cols['js_black']->caption->set('default', 'Black', 'text');
$dbo->cols['js_color_1']->caption->set('default', 'js_color_1', 'text');
$dbo->cols['js_color_2']->caption->set('default', 'js_color_2', 'text');
$dbo->cols['js_color_3']->caption->set('default', 'js_color_3', 'text');
$dbo->cols['js_color_4']->caption->set('default', 'js_color_4', 'text');
$dbo->cols['js_color_5']->caption->set('default', 'js_color_5', 'text');
$dbo->cols['js_angle_1']->caption->set('default', 'js_angle_1', 'text');
$dbo->cols['js_angle_2']->caption->set('default', 'js_angle_2', 'text');
$dbo->cols['js_angle_3']->caption->set('default', 'js_angle_3', 'text');
$dbo->cols['js_angle_4']->caption->set('default', 'js_angle_4', 'text');
$dbo->cols['js_angle_5']->caption->set('default', 'js_angle_5', 'text');
$dbo->cols['js_bleeding']->caption->set('default', 'js_bleeding', 'text');
$dbo->cols['js_bleeding_remark']->caption->set('default', 'js_bleeding_remark', 'text');
$dbo->cols['js_carcode']->caption->set('default', 'Carton type', 'text');
$dbo->cols['js_distortion']->caption->set('default', 'js_distortion', 'text');
$dbo->cols['js_distortion_value']->caption->set('default', 'js_distortion_value', 'text');
$dbo->cols['js_diecut_ind']->caption->set('default', 'js_diecut_ind', 'text');
$dbo->cols['js_thicknessplate']->caption->set('default', 'js_thicknessplate', 'text');
$dbo->cols['js_category']->caption->set('default', 'Category', 'text');
$dbo->cols['js_trapping_size']->caption->set('default', 'js_trapping_size', 'text');
$dbo->cols['js_barcodetype']->caption->set('default', 'js_barcodetype', 'text');
$dbo->cols['js_barcodenumber']->caption->set('default', 'js_barcodenumber', 'text');
$dbo->cols['js_primcat']->caption->set('default', 'js_primcat', 'text');
$dbo->cols['js_status']->caption->set('default', 'js_status', 'text');
$dbo->cols['js_completiondate']->caption->set('default', 'js_completiondate', 'text');
$dbo->cols['js_assignto']->caption->set('default', 'Assign To', 'text');
$dbo->cols['js_refid']->caption->set('default', 'js_refid', 'text');
$dbo->cols['attachment']->caption->set('default', 'Upload image', 'text');
$dbo->cols['attachment']->caption->setTabCaption('default', 'OTHER', 'text');
$dbo->cols['remark']->caption->set('default', 'Remark', 'text');
$dbo->cols['js_orgid']->caption->set('default', 'js_orgid', 'text');
$dbo->cols['js_model']->caption->set('default', 'js_model', 'text');
$dbo->cols['js_diecut_no']->caption->set('default', 'js_diecut_no', 'text');
$dbo->cols['info']->caption->set('default', 'Note:', 'text');
$dbo->cols['js_carid']->caption->set('default', 'js_carid', 'text');
$dbo->cols['jobcategory']->caption->set('default', 'Category', 'text');
$dbo->cols['js_decision']->caption->set('default', 'Decision', 'text');
$dbo->cols['decision']->caption->set('default', 'decision', 'text');
$dbo->cols['js_width']->caption->set('default', 'js_width', 'text');
$dbo->cols['js_height']->caption->set('default', 'js_height', 'text');
$dbo->cols['js_manrequiretime']->caption->set('default', 'Required Time <br> (In minutes)', 'text');
$dbo->cols['js_requiretime']->caption->set('default', 'Required time', 'text');
$dbo->cols['js_request_dateinmth']->caption->set('default', 'js_request_dateinmth', 'text');
$dbo->cols['js_jobcolor']->caption->set('default', 'js_jobcolor', 'text');
$dbo->cols['js_lpi']->caption->set('default', 'js_lpi', 'text');
$dbo->cols['js_mcid']->caption->set('default', 'js_mcid', 'text');
$dbo->cols['js_code']->caption->set('default', 'js_code', 'text');
$dbo->cols['js_month_occur']->caption->set('default', 'js_month_occur', 'text');
$dbo->cols['js_price']->caption->set('default', 'Total Price', 'text');

$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Job Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Decision';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Cancel';
$dbo->text->searchSubmit = 'Save';
$dbo->text->searchToggle = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'New';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Back';
$dbo->text->detailDelete = 'Delete';
$dbo->text->listNew = 'New';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->sum = 'Total';
$dbo->text->sumPage = 'Total (Page)';
$dbo->text->sumPageGroup = 'Total (Group)';
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average (Page)';
$dbo->text->avgPageGroup = 'Average (Group)';

?>