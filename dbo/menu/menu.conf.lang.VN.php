<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['mn_menu']->caption->set('default', 'mn_menu', 'text');
$dbo->cols['mn_parentcode']->caption->set('default', 'Nhóm danh mục', 'text');
$dbo->cols['mn_title']->caption->set('default', 'Tên', 'text');
$dbo->cols['mn_url']->caption->set('default', 'Địa chỉ Web', 'text');
$dbo->cols['mn_active']->caption->set('default', 'Active', 'text');
$dbo->cols['mn_order']->caption->set('default', 'Thứ tự', 'text');
$dbo->cols['mn_id']->caption->set('default', 'mn_id', 'text');
$dbo->cols['mn_status']->caption->set('default', 'Trạng thái', 'text');
$dbo->cols['mn_parentid']->caption->set('default', 'mn_parentid', 'text');
$dbo->cols['mn_code']->caption->set('default', 'Mã danh mục', 'text');
$dbo->cols['mn_group']->caption->set('default', 'hiện thị domain', 'text');
$dbo->cols['mn_webflag']->caption->set('default', 'WebFlag', 'text');
$dbo->cols['mn_class']->caption->set('default', 'Thuộc nhóm', 'text');
$dbo->cols['mn_classlist']->caption->set('default', 'mn_classlist', 'text');
$dbo->cols['mn_func']->caption->set('default', 'Tên chức năng', 'text');
$dbo->cols['mn_funclist']->caption->set('default', 'Function List', 'text');
$dbo->cols['mn_param']->caption->set('default', 'mn_param', 'text');
$dbo->cols['fakec']->caption->set('default', 'fakec', 'text');

$dbo->titleList = 'Danh sách';
$dbo->titleDetail = 'Cấu hình danh mục';
$dbo->titleNew = 'Thêm mới';
$dbo->titleEdit = 'Chỉnh sửa';
$dbo->titleSearch = 'Tìm kiếm';
$dbo->text->searchCancel = 'search cancel text test test test test';
$dbo->text->searchSubmit = 'search submit text';
$dbo->text->editCancel = 'edit cancel text';
$dbo->text->editSubmit = 'edit submit text';
$dbo->text->newCancel = 'new cancel text';
$dbo->text->newSubmit = 'new submit text';
$dbo->text->detailBack = 'detail back text';

?>