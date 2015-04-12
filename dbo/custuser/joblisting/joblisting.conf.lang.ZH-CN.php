<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['js_id']->caption->set('default', '订单ID', 'text');
$dbo->cols['js_cuid']->caption->set('default', '客戶名称', 'text');
$dbo->cols['js_ctid']->caption->set('default', 'Person in charge', 'text');
$dbo->cols['js_request_date']->caption->set('default', '提交日期', 'text');
$dbo->cols['js_request_by']->caption->set('default', 'Requestor', 'text');
$dbo->cols['js_title']->caption->set('default', 'js_title', 'text');
$dbo->cols['js_description']->caption->set('default', '订单描述', 'text');
$dbo->cols['js_description']->caption->setTabCaption('default', '订单讯息', 'text');
$dbo->cols['js_material_provided']->caption->set('default', 'js_material_provided', 'text');
$dbo->cols['js_cyan']->caption->set('default', 'Cyan', 'text');
$dbo->cols['js_cyan']->caption->setTabCaption('default', 'COLOR', 'text');
$dbo->cols['js_magenta']->caption->set('default', 'Magenta', 'text');
$dbo->cols['js_yellow']->caption->set('default', 'Yellow', 'text');
$dbo->cols['js_black']->caption->set('default', 'Black', 'text');
$dbo->cols['js_color_1']->caption->set('default', '顏色 1', 'text');
$dbo->cols['js_color_2']->caption->set('default', '顏色 2', 'text');
$dbo->cols['js_color_3']->caption->set('default', '顏色 3', 'text');
$dbo->cols['js_color_4']->caption->set('default', '顏色 4', 'text');
$dbo->cols['js_color_5']->caption->set('default', '顏色 5', 'text');
$dbo->cols['js_angle_1']->caption->set('default', '角度1', 'text');
$dbo->cols['js_angle_2']->caption->set('default', '角度2', 'text');
$dbo->cols['js_angle_3']->caption->set('default', '角度3', 'text');
$dbo->cols['js_angle_4']->caption->set('default', '角度4', 'text');
$dbo->cols['js_angle_5']->caption->set('default', '角度5', 'text');
$dbo->cols['js_bleeding']->caption->set('default', '滲色', 'text');
$dbo->cols['js_bleeding_remark']->caption->set('default', '滲色备注', 'text');
$dbo->cols['js_carcode']->caption->set('default', 'Carton type', 'text');
$dbo->cols['js_distortion']->caption->set('default', '缩比', 'text');
$dbo->cols['js_distortion_value']->caption->set('default', '缩比值', 'text');
$dbo->cols['js_diecut_ind']->caption->set('default', '模切', 'text');
$dbo->cols['js_thicknessplate']->caption->set('default', 'js_thicknessplate', 'text');
$dbo->cols['js_category']->caption->set('default', '类别', 'text');
$dbo->cols['js_trapping_size']->caption->set('default', '套印 (mm)', 'text');
$dbo->cols['js_barcodetype']->caption->set('default', 'Barcode type', 'text');
$dbo->cols['js_barcodenumber']->caption->set('default', 'Barcode number', 'text');
$dbo->cols['js_primcat']->caption->set('default', '首要类别', 'text');
$dbo->cols['js_status']->caption->set('default', '状况', 'text');
$dbo->cols['js_completiondate']->caption->set('default', 'js_completiondate', 'text');
$dbo->cols['js_assignto']->caption->set('default', '指定美工員', 'text');
$dbo->cols['js_refid']->caption->set('default', 'js_refid', 'text');
$dbo->cols['attachment']->caption->set('default', '图像上载', 'text');
$dbo->cols['attachment']->caption->setTabCaption('default', '文件上传', 'text');
$dbo->cols['remark']->caption->set('default', '备注', 'text');
$dbo->cols['js_orgid']->caption->set('default', '客户', 'text');
$dbo->cols['js_model']->caption->set('default', 'js_model', 'text');
$dbo->cols['js_diecut_no']->caption->set('default', 'js_diecut_no', 'text');
$dbo->cols['info']->caption->set('default', '准则', 'text');
$dbo->cols['js_carid']->caption->set('default', '紙箱类型', 'text');
$dbo->cols['jobcategory']->caption->set('default', '类别', 'text');
$dbo->cols['js_decision']->caption->set('default', 'js_decision', 'text');
$dbo->cols['js_width']->caption->set('default', 'Width', 'text');
$dbo->cols['js_height']->caption->set('default', 'Height', 'text');
$dbo->cols['js_manrequiretime']->caption->set('default', 'js_manrequiretime', 'text');
$dbo->cols['js_requiretime']->caption->set('default', '预计所需时间', 'text');
$dbo->cols['filehistory']->caption->set('default', '文件记录', 'text');
$dbo->cols['filehistory']->caption->setTabCaption('default', '文件记录', 'text');
$dbo->cols['pmc_id']->caption->set('default', '订单 ID', 'text');
$dbo->cols['js_request_dateinmth']->caption->set('default', 'js_request_dateinmth', 'text');
$dbo->cols['js_jobcolor']->caption->set('default', '订单颜色', 'text');
$dbo->cols['joboutput']->caption->set('default', '输出要求', 'text');
$dbo->cols['printbutton']->caption->set('default', '其他功能', 'text');
$dbo->cols['js_lpi']->caption->set('default', '加網线數', 'text');
$dbo->cols['js_mcid']->caption->set('default', '印刷机名称', 'text');
$dbo->cols['js_code']->caption->set('default', '订单编号', 'text');
$dbo->cols['js_month_occur']->caption->set('default', 'js_month_occur', 'text');
$dbo->cols['__map_mjobbarcode__jbc_jsid__']->caption->set('default', '条码', 'text');
$dbo->cols['__map_mjobbarcode__jbc_btcode__']->caption->set('default', '类型', 'text');
$dbo->cols['__map_mjobbarcode__jbc_value__']->caption->set('default', '输入值', 'text');
$dbo->cols['js_price']->caption->set('default', '价格', 'text');
$dbo->cols['js_outputtype']->caption->set('default', '输入种类', 'text');
$dbo->cols['js_outputwidth']->caption->set('default', '输入宽度 (mm)', 'text');
$dbo->cols['js_outputheight']->caption->set('default', '输入高度 (mm)', 'text');
$dbo->cols['js_qcchecked']->caption->set('default', '質量控制列表', 'text');
$dbo->cols['js_currency']->caption->set('default', '货币', 'text');
$dbo->cols['js_finalprice']->caption->set('default', '价格', 'text');
$dbo->cols['js_rate']->caption->set('default', 'js_rate', 'text');
$dbo->cols['js_totalinch']->caption->set('default', 'js_totalinch', 'text');
$dbo->cols['js_color_6']->caption->set('default', '顏色 6', 'text');
$dbo->cols['js_color_7']->caption->set('default', '顏色 7', 'text');
$dbo->cols['js_color_8']->caption->set('default', '顏色 8', 'text');
$dbo->cols['js_cartonsize_g']->caption->set('default', 'js_cartonsize_g', 'text');
$dbo->cols['js_cartonsize_l1']->caption->set('default', '长度', 'text');
$dbo->cols['js_cartonsize_w2']->caption->set('default', '宽度', 'text');
$dbo->cols['js_cartonsize_l3']->caption->set('default', 'js_cartonsize_l3', 'text');
$dbo->cols['js_cartonsize_w4']->caption->set('default', 'js_cartonsize_w4', 'text');
$dbo->cols['js_cartonsize_height']->caption->set('default', '高度', 'text');
$dbo->cols['js_cartonsize_top']->caption->set('default', 'js_cartonsize_top', 'text');
$dbo->cols['js_cartonsize_bottom']->caption->set('default', 'js_cartonsize_bottom', 'text');
$dbo->cols['js_expectdelivery']->caption->set('default', '预计发货', 'text');
$dbo->cols['js_cancelremark']->caption->set('default', 'js_cancelremark', 'text');
$dbo->cols['js_forwardtocusttime']->caption->set('default', '完成日期', 'text');
$dbo->cols['js_color_9']->caption->set('default', '顏色 9', 'text');

$dbo->titleList = '订单列表';
$dbo->titleDetail = 'Job Detail';
$dbo->titleNew = '新增订单';
$dbo->titleEdit = '更改订单';
$dbo->titleSearch = '搜索订单';
$dbo->text->searchCancel = '取消';
$dbo->text->searchSubmit = '搜索';
$dbo->text->searchToggle = 'Search';
$dbo->text->editCancel = '取消';
$dbo->text->editSubmit = '储存';
$dbo->text->newCancel = '取消';
$dbo->text->newSubmit = '储存';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = '';
$dbo->text->detailDelete = '';
$dbo->text->listListNew = 'List New';
$dbo->text->listListNewAdd = 'Add';
$dbo->text->listListNewDelete = 'Delete';
$dbo->text->listNew = 'New';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = '订单创建成功';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->sum = 'Total';
$dbo->text->sumPage = 'Total (Page)';
$dbo->text->sumPageGroup = 'Total (Group)';
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average (Page)';
$dbo->text->avgPageGroup = 'Average (Group)';

?>