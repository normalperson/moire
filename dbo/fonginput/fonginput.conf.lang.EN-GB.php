<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['fi_id']->caption->set('default', 'fi_id', 'text');
$dbo->cols['fi_created']->caption->set('default', 'fi_created', 'text');
$dbo->cols['fi_text']->caption->set('default', 'fi_text', 'text');
$dbo->cols['fi_textarea']->caption->set('default', 'fi_textarea', 'text');
$dbo->cols['fi_select']->caption->set('default', 'fi_select', 'text');
$dbo->cols['fi_multiselect']->caption->set('default', 'fi_multiselect', 'text');
$dbo->cols['fi_checkbox']->caption->set('default', 'fi_checkbox', 'text');
$dbo->cols['fi_radio']->caption->set('default', 'fi_radio', 'text');
$dbo->cols['fi_date']->caption->set('default', 'fi_date', 'text');
$dbo->cols['fi_integer']->caption->set('default', 'fi_integer', 'text');
$dbo->cols['fi_html']->caption->set('default', 'fi_html', 'text');
$dbo->cols['fi_datetime']->caption->set('default', 'fi_datetime', 'text');
$dbo->cols['fi_time']->caption->set('default', 'fi_time', 'text');
$dbo->cols['fi_timestamp']->caption->set('default', 'fi_timestamp', 'text');
$dbo->cols['fi_file']->caption->set('default', 'fi_file', 'text');
$dbo->cols['fi_color']->caption->set('default', 'fi_color', 'text');
$dbo->cols['fi_datetimelocal']->caption->set('default', 'fi_datetimelocal', 'text');
$dbo->cols['fi_email']->caption->set('default', 'fi_email', 'text');
$dbo->cols['fi_month']->caption->set('default', 'fi_month', 'text');
$dbo->cols['fi_number']->caption->set('default', 'fi_number', 'text');
$dbo->cols['fi_password']->caption->set('default', 'fi_password', 'text');
$dbo->cols['fi_range']->caption->set('default', 'fi_range', 'text');
$dbo->cols['fi_search']->caption->set('default', 'fi_search', 'text');
$dbo->cols['fi_tel']->caption->set('default', 'fi_tel', 'text');
$dbo->cols['fi_url']->caption->set('default', 'fi_url', 'text');
$dbo->cols['fi_week']->caption->set('default', 'fi_week', 'text');

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
$dbo->text->detailCancel = 'Back';
$dbo->text->detailDelete = 'Delete';
$dbo->text->messageAfterNew = 'Record has been created';
$dbo->text->messageAfterEdit = 'Record is updated';
$dbo->text->messageAfterDelete = 'Record is deleted';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';

?>