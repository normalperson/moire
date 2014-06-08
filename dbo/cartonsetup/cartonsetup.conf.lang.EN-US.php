<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['car_id']->caption->set('default', 'car_id', 'text');
$dbo->cols['car_name']->caption->set('default', 'Name', 'text');
$dbo->cols['car_fileextension']->caption->set('default', 'Extension', 'text');
$dbo->cols['__map_mcartonvariable__carv_carid__']->caption->set('default', 'Variable', 'text');
$dbo->cols['__map_mcartonvariable__carv_code__']->caption->set('default', 'Variable code', 'text');
$dbo->cols['__map_mcartonvariable__carv_unit__']->caption->set('default', 'Unit', 'text');
$dbo->cols['file']->caption->set('default', 'Picture', 'text');

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
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Cancel';
$dbo->text->detailDelete = 'Delete';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>