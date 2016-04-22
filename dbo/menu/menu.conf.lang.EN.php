<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['mn_menu']->caption->set('default', 'mn_menu', 'text');
$dbo->cols['mn_parentcode']->caption->set('default', 'Parent', 'text');
$dbo->cols['mn_title']->caption->set('default', 'Title', 'text');
$dbo->cols['mn_url']->caption->set('default', 'URL', 'text');
$dbo->cols['mn_active']->caption->set('default', 'Active', 'text');
$dbo->cols['mn_order']->caption->set('default', 'Order', 'text');
$dbo->cols['mn_id']->caption->set('default', 'mn_id', 'text');
$dbo->cols['mn_status']->caption->set('default', 'Status', 'text');
$dbo->cols['mn_parentid']->caption->set('default', 'mn_parentid', 'text');
$dbo->cols['mn_code']->caption->set('default', 'Menu Code', 'text');
$dbo->cols['mn_group']->caption->set('default', 'Visible to group', 'text');
$dbo->cols['mn_webflag']->caption->set('default', 'WebFlag', 'text');
$dbo->cols['mn_class']->caption->set('default', 'class', 'text');
$dbo->cols['mn_classlist']->caption->set('default', 'mn_classlist', 'text');
$dbo->cols['mn_func']->caption->set('default', 'Function Name', 'text');
$dbo->cols['mn_funclist']->caption->set('default', 'Function List', 'text');
$dbo->cols['mn_param']->caption->set('default', 'mn_param', 'text');
$dbo->cols['fakec']->caption->set('default', 'fakec', 'text');
$dbo->cols['last_modified_date']->caption->set('default', 'last_modified_date', 'text');
$dbo->cols['last_synchronized_date']->caption->set('default', 'last_synchronized_date', 'text');
$dbo->cols['record_synchronized']->caption->set('default', 'record_synchronized', 'text');
$dbo->cols['cloud_refid']->caption->set('default', 'cloud_refid', 'text');

$dbo->titleList = 'List Menu';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Menu';
$dbo->titleEdit = 'Edit Menu';
$dbo->titleSearch = 'Search Menu';
$dbo->text->searchCancel = 'search cancel text test test test test';
$dbo->text->searchSubmit = 'search submit text';
$dbo->text->editCancel = 'edit cancel text';
$dbo->text->editSubmit = 'edit submit text';
$dbo->text->newCancel = 'new cancel text';
$dbo->text->newSubmit = 'new submit text';
$dbo->text->detailBack = 'detail back text';

?>