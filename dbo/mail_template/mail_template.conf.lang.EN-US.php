<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['mt_code']->caption->set('default', 'Code', 'text');
$dbo->cols['mt_desc']->caption->set('default', 'Description', 'text');
$dbo->cols['mt_recipient_to']->caption->set('default', 'Email Recipient', 'text');
$dbo->cols['mt_recipient_cc']->caption->set('default', 'Email CC', 'text');
$dbo->cols['mt_subject']->caption->set('default', 'Subject', 'text');
$dbo->cols['mt_content']->caption->set('default', 'Content', 'text');
$dbo->cols['mt_status']->caption->set('default', 'Status', 'text');
$dbo->cols['mt_internal_userid']->caption->set('default', 'Internal Notification Recipient', 'text');

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
$dbo->text->detailCancel = 'Cancel';
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

?>