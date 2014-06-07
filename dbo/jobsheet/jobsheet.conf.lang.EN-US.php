<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['js_id']->caption->set('default', 'Job ID', 'text');
$dbo->cols['js_cuid']->caption->set('default', 'Customer', 'text');
$dbo->cols['js_ctid']->caption->set('default', 'Person in charge', 'text');
$dbo->cols['js_request_date']->caption->set('default', 'Request date', 'text');
$dbo->cols['js_request_by']->caption->set('default', 'js_request_by', 'text');
$dbo->cols['js_title']->caption->set('default', 'js_title', 'text');
$dbo->cols['js_description']->caption->set('default', 'Job description', 'text');
$dbo->cols['js_description']->caption->setTabCaption('default', 'JOB INFO', 'text');
$dbo->cols['js_material_provided']->caption->set('default', 'js_material_provided', 'text');
$dbo->cols['js_cyan']->caption->set('default', 'Cyan', 'text');
$dbo->cols['js_cyan']->caption->setTabCaption('default', 'COLOR', 'text');
$dbo->cols['js_magenta']->caption->set('default', 'Magenta', 'text');
$dbo->cols['js_yellow']->caption->set('default', 'Yellow', 'text');
$dbo->cols['js_black']->caption->set('default', 'Black', 'text');
$dbo->cols['js_color_1']->caption->set('default', 'Color1', 'text');
$dbo->cols['js_color_2']->caption->set('default', 'Color2', 'text');
$dbo->cols['js_color_3']->caption->set('default', 'Color3', 'text');
$dbo->cols['js_color_4']->caption->set('default', 'Color4', 'text');
$dbo->cols['js_color_5']->caption->set('default', 'Color5', 'text');
$dbo->cols['js_angle_1']->caption->set('default', 'Angle1', 'text');
$dbo->cols['js_angle_2']->caption->set('default', 'Angle2', 'text');
$dbo->cols['js_angle_3']->caption->set('default', 'Angle3', 'text');
$dbo->cols['js_angle_4']->caption->set('default', 'Angle4', 'text');
$dbo->cols['js_angle_5']->caption->set('default', 'Angle5', 'text');
$dbo->cols['js_bleeding']->caption->set('default', 'Bleeding', 'text');
$dbo->cols['js_bleeding_remark']->caption->set('default', 'Bleeding remark', 'text');
$dbo->cols['js_carcode']->caption->set('default', 'Carton type', 'text');
$dbo->cols['js_distortion']->caption->set('default', 'Distortion', 'text');
$dbo->cols['js_distortion']->caption->setTabCaption('default', 'CARTON TYPE', 'text');
$dbo->cols['js_distortion_value']->caption->set('default', 'Distortion value', 'text');
$dbo->cols['js_diecut_ind']->caption->set('default', 'Diecut', 'text');
$dbo->cols['js_thicknessplate']->caption->set('default', 'js_thicknessplate', 'text');
$dbo->cols['js_category']->caption->set('default', 'Category', 'text');
$dbo->cols['js_trapping_size']->caption->set('default', 'Trapping size', 'text');
$dbo->cols['js_barcodetype']->caption->set('default', 'Barcode type', 'text');
$dbo->cols['js_barcodenumber']->caption->set('default', 'Barcode number', 'text');
$dbo->cols['js_primcat']->caption->set('default', 'js_primcat', 'text');
$dbo->cols['js_status']->caption->set('default', 'js_status', 'text');
$dbo->cols['js_completiondate']->caption->set('default', 'js_completiondate', 'text');
$dbo->cols['js_assignto']->caption->set('default', 'js_assignto', 'text');
$dbo->cols['js_refid']->caption->set('default', 'js_refid', 'text');
$dbo->cols['attachment']->caption->set('default', 'Upload image', 'text');
$dbo->cols['attachment']->caption->setTabCaption('default', 'OTHER', 'text');
$dbo->cols['remark']->caption->set('default', 'Remark', 'text');
$dbo->cols['js_orgid']->caption->set('default', 'js_orgid', 'text');
$dbo->cols['js_model']->caption->set('default', 'js_model', 'text');
$dbo->cols['js_diecut_no']->caption->set('default', 'js_diecut_no', 'text');
$dbo->cols['info']->caption->set('default', 'Note:', 'text');
$dbo->cols['js_carid']->caption->set('default', 'Carton type', 'text');
$dbo->cols['jobcategory']->caption->set('default', 'Category', 'text');

$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Job';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Cancel';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Save';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Back';
$dbo->text->detailDelete = 'Delete';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>