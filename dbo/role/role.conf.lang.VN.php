<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['rol_id']->caption->set('default', 'rol_id', 'text');
$dbo->cols['rol_code']->caption->set('default', 'Nhóm người dùng', 'text');
$dbo->cols['rol_desc']->caption->set('default', 'Diễn giải', 'text');
$dbo->cols['rol_permission']->caption->set('default', 'Phân quyền', 'text');

$dbo->titleList = 'Danh sách';
$dbo->titleDetail = 'Nhóm người dùng';
$dbo->titleNew = 'Thêm mới';
$dbo->titleEdit = 'Chỉnh sửa';
$dbo->titleSearch = 'Tìm kiếm';

?>