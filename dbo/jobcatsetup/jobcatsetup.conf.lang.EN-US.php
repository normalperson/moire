<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['jcl_id']->caption->set('default', 'ID', 'text');
$dbo->cols['jcl_title']->caption->set('default', 'Title', 'text');
$dbo->cols['jcl_requiretime']->caption->set('default', 'Require time (minutes)', 'text');
$dbo->cols['jcl_sequence']->caption->set('default', 'Priority', 'text');
$dbo->cols['jcl_requiretime_color_1']->caption->set('default', '1 color', 'text');
$dbo->cols['jcl_requiretime_color_1']->caption->set('list', 'Time required for 1 color', 'text');
$dbo->cols['jcl_requiretime_color_1']->caption->setSectionCaption('new', 'Time required (Minute)', 'text');
$dbo->cols['jcl_requiretime_color_1']->caption->setSectionCaption('edit', 'Time required (Minute)', 'text');
$dbo->cols['jcl_requiretime_color_2']->caption->set('default', '2 colors', 'text');
$dbo->cols['jcl_requiretime_color_2']->caption->set('list', 'Time required for 2 colors', 'text');
$dbo->cols['jcl_requiretime_color_3']->caption->set('default', '3 colors', 'text');
$dbo->cols['jcl_requiretime_color_3']->caption->set('list', 'Time required for 3 colors', 'text');
$dbo->cols['jcl_requiretime_color_4']->caption->set('default', '4 colors', 'text');
$dbo->cols['jcl_requiretime_color_4']->caption->set('list', 'Time required for 4 colors', 'text');
$dbo->cols['jcl_status']->caption->set('default', 'Status', 'text');
$dbo->cols['jcl_price']->caption->set('default', 'Price', 'text');
$dbo->cols['jcl_price']->caption->setSectionCaption('new', 'Pricing', 'text');
$dbo->cols['jcl_price']->caption->setSectionCaption('edit', 'Pricing', 'text');
$dbo->cols['jcl_price_cat']->caption->set('default', ' Charge Method', 'text');
$dbo->cols['jcl_price_cat']->caption->setSectionCaption('new', 'Pricing', 'text');
$dbo->cols['jcl_price_cat']->caption->setSectionCaption('edit', 'Pricing', 'text');
$dbo->cols['jcl_price_color_1']->caption->set('default', 'Price for 1 color', 'text');
$dbo->cols['jcl_price_color_2']->caption->set('default', 'Price for 2 colors', 'text');
$dbo->cols['jcl_price_color_3']->caption->set('default', 'Price for 3 colors', 'text');
$dbo->cols['jcl_price_color_4']->caption->set('default', 'Price for 4 colors', 'text');
$dbo->cols['jcl_price_per_unit']->caption->set('default', 'Price per unit', 'text');

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