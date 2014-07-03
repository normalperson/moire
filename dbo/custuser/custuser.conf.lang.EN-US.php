<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['usr_userid']->caption->set('default', 'User ID', 'text');
$dbo->cols['usr_password']->caption->set('default', 'Password', 'text');
$dbo->cols['usr_created']->caption->set('default', 'Created Date', 'text');
$dbo->cols['usr_name']->caption->set('default', 'User Name', 'text');
$dbo->cols['usr_email']->caption->set('default', 'Email', 'text');
$dbo->cols['usr_last_active']->caption->set('default', 'usr_last_active', 'text');
$dbo->cols['usr_last_success_login']->caption->set('default', 'usr_last_success_login', 'text');
$dbo->cols['usr_last_fail_login']->caption->set('default', 'usr_last_fail_login', 'text');
$dbo->cols['usr_group']->caption->set('default', 'usr_group', 'text');
$dbo->cols['usr_sessiondata']->caption->set('default', 'usr_sessiondata', 'text');
$dbo->cols['usr_langid']->caption->set('default', 'Language', 'text');
$dbo->cols['usr_status']->caption->set('default', 'Status', 'text');
$dbo->cols['password2']->caption->set('default', 'Re-type password', 'text');
$dbo->cols['password1']->caption->set('default', 'Password', 'text');
$dbo->cols['orgid']->caption->set('default', 'orgid', 'text');
$dbo->cols['userRole']->caption->set('default', 'Role', 'text');
$dbo->cols['currpassword']->caption->set('default', 'Current Password', 'text');
$dbo->cols['usr_langcode']->caption->set('default', 'Language', 'text');
$dbo->cols['userrole']->caption->set('default', 'Role', 'text');

$dbo->titleList = 'List Record';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Record';
$dbo->titleEdit = 'Edit Record';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Reset';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Edit';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Back';
$dbo->text->detailDelete = 'Delete';
$dbo->text->listEdit = 'Edit';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->listNewEditSubmit = 'Save';

?>