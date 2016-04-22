<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['usr_userid']->caption->set('default', 'Người dùng', 'text');
$dbo->cols['usr_password']->caption->set('default', 'Mật khẩu', 'text');
$dbo->cols['usr_created']->caption->set('default', 'usr_created', 'text');
$dbo->cols['usr_name']->caption->set('default', 'Tên', 'text');
$dbo->cols['usr_email']->caption->set('default', 'Email', 'text');
$dbo->cols['usr_last_active']->caption->set('default', 'usr_last_active', 'text');
$dbo->cols['usr_last_success_login']->caption->set('default', 'usr_last_success_login', 'text');
$dbo->cols['usr_last_fail_login']->caption->set('default', 'usr_last_fail_login', 'text');
$dbo->cols['usr_group']->caption->set('default', 'User Group', 'text');
$dbo->cols['usr_group']->caption->set('search', 'User Group', 'text');
$dbo->cols['usr_group']->caption->set('list', 'User Group', 'text');
$dbo->cols['usr_group']->caption->set('detail', 'User Group', 'text');
$dbo->cols['usr_group']->caption->set('new', 'User Group', 'text');
$dbo->cols['usr_group']->caption->set('edit', 'User Group', 'text');
$dbo->cols['usr_sessiondata']->caption->set('default', 'usr_sessiondata', 'text');
$dbo->cols['userrole']->caption->set('default', 'Nhóm người dùng', 'text');

$dbo->titleList = 'Danh sách';
$dbo->titleDetail = 'Người dùng';
$dbo->titleNew = 'Thêm mới';
$dbo->titleEdit = 'Chỉnh sửa';
$dbo->titleSearch = 'Tìm kiếm';

?>