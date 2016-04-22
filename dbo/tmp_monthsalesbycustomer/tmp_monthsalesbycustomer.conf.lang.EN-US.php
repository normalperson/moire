<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['tmp_customername']->caption->set('default', 'Customer name', 'text');
$dbo->cols['tmp_salesjan']->caption->set('default', 'January', 'text');
$dbo->cols['tmp_salesfeb']->caption->set('default', 'Febuary', 'text');
$dbo->cols['tmp_salesmarch']->caption->set('default', 'March', 'text');
$dbo->cols['tmp_salesapril']->caption->set('default', 'April', 'text');
$dbo->cols['tmp_salesmay']->caption->set('default', 'May', 'text');
$dbo->cols['tmp_salesjune']->caption->set('default', 'June', 'text');
$dbo->cols['tmp_salesjuly']->caption->set('default', 'July', 'text');
$dbo->cols['tmp_salesaug']->caption->set('default', 'August', 'text');
$dbo->cols['tmp_salessept']->caption->set('default', 'September', 'text');
$dbo->cols['tmp_salesoct']->caption->set('default', 'October', 'text');
$dbo->cols['tmp_salesnov']->caption->set('default', 'November', 'text');
$dbo->cols['tmp_salesdev']->caption->set('default', 'December', 'text');

$dbo->titleList = 'Monthly sale by customer';
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