<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['tmp_userid']->caption->set('default', 'User', 'text');
$dbo->cols['tmp_date']->caption->set('default', 'Date', 'text');
$dbo->cols['tmp_time']->caption->set('default', 'Time', 'text');
$dbo->cols['tmp_activity']->caption->set('default', 'Activity', 'text');
$dbo->cols['tmp_id']->caption->set('default', 'tmp_id', 'text');

$dbo->titleList = 'Daily user activity';
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
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>