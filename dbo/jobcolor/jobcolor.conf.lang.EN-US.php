<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['js_id']->caption->set('default', 'js_id', 'text');
$dbo->cols['js_cuid']->caption->set('default', 'Customer ID', 'text');
$dbo->cols['js_ctid']->caption->set('default', 'js_ctid', 'text');
$dbo->cols['js_request_date']->caption->set('default', 'js_request_date', 'text');
$dbo->cols['js_request_by']->caption->set('default', 'js_request_by', 'text');
$dbo->cols['js_title']->caption->set('default', 'js_title', 'text');
$dbo->cols['js_model']->caption->set('default', 'js_model', 'text');
$dbo->cols['js_description']->caption->set('default', 'js_description', 'text');
$dbo->cols['js_material_provided']->caption->set('default', 'js_material_provided', 'text');
$dbo->cols['js_color_1']->caption->set('default', 'Cyan', 'text');
$dbo->cols['js_color_2']->caption->set('default', 'Magenta', 'text');
$dbo->cols['js_color_3']->caption->set('default', 'Yellow', 'text');
$dbo->cols['js_color_4']->caption->set('default', 'Black', 'text');
$dbo->cols['js_angle_1']->caption->set('default', 'Angle 1', 'text');
$dbo->cols['js_angle_2']->caption->set('default', 'Angle 2', 'text');
$dbo->cols['js_angle_3']->caption->set('default', 'Angle 3', 'text');
$dbo->cols['js_angle_4']->caption->set('default', 'Angle 4', 'text');
$dbo->cols['js_bleeding']->caption->set('default', 'Bleeding', 'text');
$dbo->cols['js_bleeding_remark']->caption->set('default', 'Bleeding remark', 'text');
$dbo->cols['js_carcode']->caption->set('default', 'js_carcode', 'text');
$dbo->cols['js_distortion']->caption->set('default', 'js_distortion', 'text');
$dbo->cols['js_distortion_value']->caption->set('default', 'js_distortion_value', 'text');
$dbo->cols['js_diecut_ind']->caption->set('default', 'js_diecut_ind', 'text');
$dbo->cols['js_diecut_no']->caption->set('default', 'js_diecut_no', 'text');
$dbo->cols['js_category']->caption->set('default', 'js_category', 'text');
$dbo->cols['js_trapping_size']->caption->set('default', 'js_trapping_size', 'text');
$dbo->cols['js_barcodetype']->caption->set('default', 'js_barcodetype', 'text');
$dbo->cols['js_barcodenumber']->caption->set('default', 'js_barcodenumber', 'text');
$dbo->cols['js_primcat']->caption->set('default', 'js_primcat', 'text');
$dbo->cols['js_status']->caption->set('default', 'js_status', 'text');
$dbo->cols['js_completiondate']->caption->set('default', 'js_completiondate', 'text');
$dbo->cols['js_assignto']->caption->set('default', 'js_assignto', 'text');

$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Cancel';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Save';
$dbo->text->detailCancel = 'Back';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>