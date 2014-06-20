<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['lc_code']->caption->set('default', 'Code', 'text');
$dbo->cols['lc_description']->caption->set('default', 'Description', 'text');
$dbo->cols['lc_primary_langcode']->caption->set('default', 'Primary Language', 'text');
$dbo->cols['lc_tzcode']->caption->set('default', 'Timezone', 'text');
$dbo->cols['__map_fclocaleholiday__lch_lccode__']->caption->set('default', 'Holidays', 'text');
$dbo->cols['__map_fclocaleholiday__lch_date__']->caption->set('default', 'Date', 'text');
$dbo->cols['__map_fclocaleholiday__lch_description__']->caption->set('default', 'Holiday Name', 'text');
$dbo->cols['__map_fclocaleholiday__lch_recurring__']->caption->set('default', 'Recurring?', 'text');
$dbo->cols['__map_fclocaleworkinghour__lcw_lccode__']->caption->set('default', 'Working Hour', 'text');
$dbo->cols['__map_fclocaleworkinghour__lcw_day__']->caption->set('default', 'Day', 'text');
$dbo->cols['__map_fclocaleworkinghour__lcw_start_time__']->caption->set('default', 'Start Time (HH24:MM:SS)', 'text');
$dbo->cols['__map_fclocaleworkinghour__lcw_end_time__']->caption->set('default', 'End Time (HH24:MM:SS)', 'text');

$dbo->titleList = 'List Locale';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Locale';
$dbo->titleEdit = 'Edit Locale';
$dbo->titleSearch = 'Search Locale';
$dbo->text->searchCancel = 'Reset';
$dbo->text->searchSubmit = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Save';
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