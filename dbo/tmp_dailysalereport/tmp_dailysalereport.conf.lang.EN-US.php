<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['tmp_date']->caption->set('default', 'Date', 'text');
$dbo->cols['tmp_typing']->caption->set('default', 'Typing', 'text');
$dbo->cols['tmp_drawing']->caption->set('default', 'Darwing', 'text');
$dbo->cols['tmp_mastercard']->caption->set('default', 'Master card', 'text');
$dbo->cols['tmp_colorseperation']->caption->set('default', 'Color seperation', 'text');
$dbo->cols['tmp_barcode']->caption->set('default', 'Barcode', 'text');
$dbo->cols['tmp_tapping']->caption->set('default', 'Tapping', 'text');
$dbo->cols['tmp_total']->caption->set('default', 'Total', 'text');

$dbo->titleList = 'Daily sale report';
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