<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['js_id']->caption->set('default', 'Job ID', 'text');
$dbo->cols['js_cuid']->caption->set('default', 'Customer', 'text');
$dbo->cols['js_ctid']->caption->set('default', 'Person in charge', 'text');
$dbo->cols['js_request_date']->caption->set('default', 'Request date', 'text');
$dbo->cols['js_request_by']->caption->set('default', 'Requestor', 'text');
$dbo->cols['js_title']->caption->set('default', 'js_title', 'text');
$dbo->cols['js_description']->caption->set('default', 'Job description', 'text');
$dbo->cols['js_material_provided']->caption->set('default', 'js_material_provided', 'text');
$dbo->cols['js_cyan']->caption->set('default', 'Cyan', 'text');
$dbo->cols['js_cyan']->caption->setTabCaption('default', 'COLOR', 'text');
$dbo->cols['js_magenta']->caption->set('default', 'Magenta', 'text');
$dbo->cols['js_yellow']->caption->set('default', 'Yellow', 'text');
$dbo->cols['js_black']->caption->set('default', 'Black', 'text');
$dbo->cols['js_color_1']->caption->set('default', 'Color 1', 'text');
$dbo->cols['js_color_2']->caption->set('default', 'Color 2', 'text');
$dbo->cols['js_color_3']->caption->set('default', 'Color 3', 'text');
$dbo->cols['js_color_4']->caption->set('default', 'Color 4', 'text');
$dbo->cols['js_color_5']->caption->set('default', 'Color 5', 'text');
$dbo->cols['js_angle_1']->caption->set('default', 'Angle1', 'text');
$dbo->cols['js_angle_2']->caption->set('default', 'Angle2', 'text');
$dbo->cols['js_angle_3']->caption->set('default', 'Angle3', 'text');
$dbo->cols['js_angle_4']->caption->set('default', 'Angle4', 'text');
$dbo->cols['js_angle_5']->caption->set('default', 'Angle5', 'text');
$dbo->cols['js_bleeding']->caption->set('default', 'Bleeding', 'text');
$dbo->cols['js_bleeding_remark']->caption->set('default', 'Bleeding remark', 'text');
$dbo->cols['js_carcode']->caption->set('default', 'Carton type', 'text');
$dbo->cols['js_distortion']->caption->set('default', 'Distortion', 'text');
$dbo->cols['js_distortion_value']->caption->set('default', 'Distortion value', 'text');
$dbo->cols['js_diecut_ind']->caption->set('default', 'Carton type', 'text');
$dbo->cols['js_thicknessplate']->caption->set('default', 'js_thicknessplate', 'text');
$dbo->cols['js_category']->caption->set('default', 'Category', 'text');
$dbo->cols['js_trapping_size']->caption->set('default', 'Trapping size (mm)', 'text');
$dbo->cols['js_trapping_size']->caption->setSectionCaption('default', 'Special Request', 'text');
$dbo->cols['js_barcodetype']->caption->set('default', 'Barcode type', 'text');
$dbo->cols['js_barcodenumber']->caption->set('default', 'Barcode number', 'text');
$dbo->cols['js_primcat']->caption->set('default', 'js_primcat', 'text');
$dbo->cols['js_status']->caption->set('default', 'js_status', 'text');
$dbo->cols['js_completiondate']->caption->set('default', 'js_completiondate', 'text');
$dbo->cols['js_assignto']->caption->set('default', 'Assign to', 'text');
$dbo->cols['js_refid']->caption->set('default', 'js_refid', 'text');
$dbo->cols['attachment']->caption->set('default', 'Upload image', 'text');
$dbo->cols['remark']->caption->set('default', 'Remark', 'text');
$dbo->cols['js_orgid']->caption->set('default', 'js_orgid', 'text');
$dbo->cols['js_model']->caption->set('default', 'js_model', 'text');
$dbo->cols['js_diecut_no']->caption->set('default', 'Carton Type', 'text');
$dbo->cols['info']->caption->set('default', 'Guideline', 'text');
$dbo->cols['js_carid']->caption->set('default', 'Type of color', 'text');
$dbo->cols['js_carid']->caption->setSectionCaption('default', 'Job Color', 'text');
$dbo->cols['jobcategory']->caption->set('default', 'Category', 'text');
$dbo->cols['js_decision']->caption->set('default', 'js_decision', 'text');
$dbo->cols['js_width']->caption->set('default', 'Width', 'text');
$dbo->cols['js_height']->caption->set('default', 'Height', 'text');
$dbo->cols['js_manrequiretime']->caption->set('default', 'js_manrequiretime', 'text');
$dbo->cols['js_requiretime']->caption->set('default', 'Estimated time required', 'text');
$dbo->cols['filehistory']->caption->set('default', 'File history', 'text');
$dbo->cols['filehistory']->caption->setTabCaption('default', 'Attachment', 'text');
$dbo->cols['filehistory']->caption->setTabCaption('detail', 'Attachment', 'text');
$dbo->cols['js_request_dateinmth']->caption->set('default', 'js_request_dateinmth', 'text');
$dbo->cols['js_jobcolor']->caption->set('default', 'Color of job', 'text');
$dbo->cols['js_jobcolor']->caption->setSectionCaption('default', 'Color of job', 'text');
$dbo->cols['joboutput']->caption->set('default', 'Customer Requirement', 'text');
$dbo->cols['js_lpi']->caption->set('default', 'Screen LPI', 'text');
$dbo->cols['__map_mjobbarcode__jbc_jsid__']->caption->set('default', 'Barcode', 'text');
$dbo->cols['__map_mjobbarcode__jbc_value__']->caption->set('default', 'Value', 'text');
$dbo->cols['js_mcid']->caption->set('default', 'Printer Name', 'text');
$dbo->cols['js_code']->caption->set('default', 'Job Code', 'text');
$dbo->cols['js_month_occur']->caption->set('default', 'js_month_occur', 'text');
$dbo->cols['js_price']->caption->set('default', 'Price', 'text');
$dbo->cols['pmc_id']->caption->set('default', 'Job ID', 'text');
$dbo->cols['js_outputtype']->caption->set('default', 'Output type', 'text');
$dbo->cols['js_outputwidth']->caption->set('default', 'Output width (inch)', 'text');
$dbo->cols['js_outputheight']->caption->set('default', 'Output height (inch)', 'text');
$dbo->cols['js_qcchecked']->caption->set('default', 'Internal reject reason', 'text');
$dbo->cols['js_currency']->caption->set('default', 'Currency', 'text');
$dbo->cols['js_finalprice']->caption->set('default', 'Price', 'text');
$dbo->cols['js_rate']->caption->set('default', 'js_rate', 'text');
$dbo->cols['js_totalinch']->caption->set('default', 'Total inch<sup>2</sup>', 'text');
$dbo->cols['js_color_6']->caption->set('default', 'Color 6', 'text');
$dbo->cols['js_color_7']->caption->set('default', 'Color 7', 'text');
$dbo->cols['js_color_8']->caption->set('default', 'Color 8', 'text');
$dbo->cols['js_cartonsize_g']->caption->set('default', 'G', 'text');
$dbo->cols['js_cartonsize_l1']->caption->set('default', 'Carton Size: ', 'text');
$dbo->cols['js_cartonsize_w2']->caption->set('default', ' ', 'text');
$dbo->cols['js_cartonsize_l3']->caption->set('default', 'L3', 'text');
$dbo->cols['js_cartonsize_w4']->caption->set('default', 'W4', 'text');
$dbo->cols['js_cartonsize_height']->caption->set('default', ' ', 'text');
$dbo->cols['js_cartonsize_top']->caption->set('default', 'Top', 'text');
$dbo->cols['js_cartonsize_bottom']->caption->set('default', 'Bottom', 'text');
$dbo->cols['js_expectdelivery']->caption->set('default', 'Expected Delivery Time', 'text');
$dbo->cols['js_cancelremark']->caption->set('default', 'js_cancelremark', 'text');
$dbo->cols['js_forwardtocusttime']->caption->set('default', 'js_forwardtocusttime', 'text');
$dbo->cols['js_color_9']->caption->set('default', 'Color 9', 'text');
$dbo->cols['js_custrejectreason']->caption->set('default', 'Customer reject reason', 'text');

$dbo->titleList = 'Job List';
$dbo->titleDetail = 'Job Detail';
$dbo->titleNew = 'New Job';
$dbo->titleEdit = 'Reassignment ';
$dbo->titleSearch = 'Search Job';
$dbo->text->searchCancel = 'Cancel';
$dbo->text->searchSubmit = 'Search';
$dbo->text->searchToggle = 'Search';
$dbo->text->listSubmit = 'Submit';
$dbo->text->listListNew = 'List New';
$dbo->text->listListNewAdd = 'Add';
$dbo->text->listListNewDelete = 'Delete';
$dbo->text->listListEditToggle = 'Edit Toggle';
$dbo->text->listNew = 'New';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->editCancel = 'CAncel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Save';
$dbo->text->detailCancel = '';
$dbo->text->detailDelete = '';
$dbo->text->messageConfirmDelete = ' ';
$dbo->text->messageConfirmMultipleDelete = ' ';
$dbo->text->messageAfterNew = ' ';
$dbo->text->messageAfterEdit = ' ';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageConfirmDelete = 'Confirm delete?';
$dbo->text->defaultMessageConfirmMultipleDelete = 'Confirm delete?';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->sum = 'Total';
$dbo->text->sumPage = 'Total (Page)';
$dbo->text->sumPageGroup = 'Total (Group)';
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average (Page)';
$dbo->text->avgPageGroup = 'Average (Group)';
$dbo->text->titleList = 'Job List';
$dbo->text->titleDetail = 'Job Detail';
$dbo->text->titleNew = 'New Job';
$dbo->text->titleEdit = 'Reassignment ';
$dbo->text->titleSearch = 'Search Job';

?>