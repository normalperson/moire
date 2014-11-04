<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['jol_id']->caption->set('default', 'jol_id', 'text');
$dbo->cols['jol_title']->caption->set('default', 'Title', 'text');
$dbo->cols['jol_requiredtime']->caption->set('default', 'Required Time (Minute)', 'text');
$dbo->cols['jol_status']->caption->set('default', 'Status', 'text');
$dbo->cols['jol_price_color_1']->caption->set('default', 'Price for 1 color', 'text');
$dbo->cols['jol_price_color_1']->caption->setSectionCaption('default', 'Pricing', 'text');
$dbo->cols['jol_price_color_1']->caption->setSectionCaption('new', 'Pricing', 'text');
$dbo->cols['jol_price_color_1']->caption->setSectionCaption('edit', 'Pricing', 'text');
$dbo->cols['jol_price_color_2']->caption->set('default', 'Price for 2 color', 'text');
$dbo->cols['jol_price_color_3']->caption->set('default', 'Price for 3 color', 'text');
$dbo->cols['jol_price_color_4']->caption->set('default', 'Price for 4 color', 'text');
$dbo->cols['jol_pricingtype']->caption->set('default', 'Pricing Type', 'text');
$dbo->cols['jol_price']->caption->set('default', 'Unit/Fixed Price', 'text');
$dbo->cols['jol_seq']->caption->set('default', 'Sequence', 'text');

$dbo->titleList = 'List Job Output';
$dbo->titleDetail = 'Detail';
$dbo->titleNew = 'New Job Output';
$dbo->titleEdit = 'Edit Job Output';
$dbo->titleSearch = 'Search Record';
$dbo->text->searchCancel = 'Reset';
$dbo->text->searchSubmit = 'Search';
$dbo->text->searchToggle = 'Search';
$dbo->text->editCancel = 'Cancel';
$dbo->text->editSubmit = 'Save';
$dbo->text->newCancel = 'Cancel';
$dbo->text->newSubmit = 'Submit';
$dbo->text->listSubmit = 'Submit';
$dbo->text->detailCancel = 'Cancel';
$dbo->text->detailDelete = 'Delete';
$dbo->text->listNew = 'New';
$dbo->text->listEdit = 'Save';
$dbo->text->listDelete = 'Delete';
$dbo->text->listDetail = 'Detail';
$dbo->text->messageAfterNew = '';
$dbo->text->messageAfterEdit = '';
$dbo->text->messageAfterDelete = '';
$dbo->text->defaultMessageAfterNew = 'Record created.';
$dbo->text->defaultMessageAfterEdit = 'Record updated.';
$dbo->text->defaultMessageAfterDelete = 'Record deleted.';
$dbo->text->sum = 'Total';
$dbo->text->sumPage = 'Total (Page)';
$dbo->text->sumPageGroup = 'Total (Group)';
$dbo->text->avg = 'Average';
$dbo->text->avgPage = 'Average (Page)';
$dbo->text->avgPageGroup = 'Average (Group)';

?>