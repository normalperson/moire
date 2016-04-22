<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['fd_id']->caption->set('default', 'fd_id', 'text');
$dbo->cols['fd_created_date']->caption->set('default', 'fd_created_date', 'text');
$dbo->cols['fd_created_by']->caption->set('default', 'fd_created_by', 'text');
$dbo->cols['fd_refid']->caption->set('default', 'fd_refid', 'text');
$dbo->cols['fd_reftype']->caption->set('default', 'fd_reftype', 'text');
$dbo->cols['fd_description']->caption->set('default', 'fd_description', 'text');
$dbo->cols['fd_file_name']->caption->set('default', 'File Name', 'text');
$dbo->cols['fd_file_ext']->caption->set('default', 'fd_file_ext', 'text');
$dbo->cols['fd_tags']->caption->set('default', 'fd_tags', 'text');
$dbo->cols['fd_file_size']->caption->set('default', 'fd_file_size', 'text');

$dbo->titleList = 'List Record';
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