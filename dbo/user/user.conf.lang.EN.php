<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['usr_userid']->caption->set('default', 'Login ID', 'text');
$dbo->cols['usr_userid']->caption->set('search', 'Login ID', 'text');
$dbo->cols['usr_userid']->caption->set('list', 'Login ID', 'text');
$dbo->cols['usr_userid']->caption->set('detail', 'Login ID', 'text');
$dbo->cols['usr_userid']->caption->set('new', 'Login ID', 'text');
$dbo->cols['usr_userid']->caption->set('edit', 'Login ID', 'text');
$dbo->cols['usr_password']->caption->set('default', 'Password', 'text');
$dbo->cols['usr_password']->caption->set('search', 'Password', 'text');
$dbo->cols['usr_password']->caption->set('list', 'Password', 'text');
$dbo->cols['usr_password']->caption->set('detail', 'Password', 'text');
$dbo->cols['usr_password']->caption->set('new', 'Password', 'text');
$dbo->cols['usr_password']->caption->set('edit', 'Password', 'text');
$dbo->cols['usr_created']->caption->set('default', 'usr_created', 'text');
$dbo->cols['usr_name']->caption->set('default', 'Name', 'text');
$dbo->cols['usr_name']->caption->set('search', 'Name', 'text');
$dbo->cols['usr_name']->caption->set('list', 'Name', 'text');
$dbo->cols['usr_name']->caption->set('detail', 'Name', 'text');
$dbo->cols['usr_name']->caption->set('new', 'Name', 'text');
$dbo->cols['usr_name']->caption->set('edit', 'Name', 'text');
$dbo->cols['usr_email']->caption->set('default', 'Email', 'text');
$dbo->cols['usr_email']->caption->set('search', 'Email', 'text');
$dbo->cols['usr_email']->caption->set('list', 'Email', 'text');
$dbo->cols['usr_email']->caption->set('detail', 'Email', 'text');
$dbo->cols['usr_email']->caption->set('new', 'Email', 'text');
$dbo->cols['usr_email']->caption->set('edit', 'Email', 'text');
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
$dbo->cols['userrole']->caption->set('default', 'User Org & Role', 'text');
$dbo->cols['last_modified_date']->caption->set('default', 'last_modified_date', 'text');
$dbo->cols['last_synchronized_date']->caption->set('default', 'last_synchronized_date', 'text');
$dbo->cols['record_synchronized']->caption->set('default', 'record_synchronized', 'text');
$dbo->cols['cloud_refid']->caption->set('default', 'cloud_refid', 'text');
$dbo->cols['usr_status']->caption->set('default', 'Status', 'text');

$dbo->titleList = 'List User';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New User';
$dbo->titleEdit = 'Edit User';
$dbo->titleSearch = 'Search User';

?>