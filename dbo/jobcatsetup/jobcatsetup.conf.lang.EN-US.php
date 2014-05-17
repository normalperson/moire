<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['jcl_id']->caption->set('default', 'ID', 'text');
$dbo->cols['jcl_title']->caption->set('default', 'Title', 'text');
$dbo->cols['jcl_requiretime']->caption->set('default', 'Require time (minutes)', 'text');
$dbo->cols['jcl_sequence']->caption->set('default', 'Priority', 'text');

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