<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['ht_id']->caption->set('default', 'ht_id', 'text');
$dbo->cols['ht_tablename']->caption->set('default', 'Table Name', 'text');
$dbo->cols['ht_seq']->caption->set('default', 'Sequence', 'text');
$dbo->cols['ht_secid']->caption->set('default', 'Section ', 'text');

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

?>