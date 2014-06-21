<?php
require_once(dirname(__FILE__).DIRECTORY_SEPARATOR.'..'.DIRECTORY_SEPARATOR.'init.inc.php');

$dbo->cols['mc_id']->caption->set('default', 'mc_id', 'text');
$dbo->cols['mc_orgid']->caption->set('default', 'Customer name', 'text');
$dbo->cols['mc_orgid']->caption->setTabCaption('default', 'PRESS', 'text');
$dbo->cols['mc_pressmanufacturer']->caption->set('default', 'Manufacturer', 'text');
$dbo->cols['mc_pressyearbuilt']->caption->set('default', 'Year built', 'text');
$dbo->cols['mc_pressmodel']->caption->set('default', 'Model', 'text');
$dbo->cols['mc_presswidth']->caption->set('default', 'Width', 'text');
$dbo->cols['mc_presstype']->caption->set('default', 'Press type', 'text');
$dbo->cols['mc_pressspeed']->caption->set('default', 'Speed', 'text');
$dbo->cols['mc_presscylinderrepeat']->caption->set('default', 'Cylinder repeat', 'text');
$dbo->cols['mc_inkmanufacturer']->caption->set('default', 'Manufacturer', 'text');
$dbo->cols['mc_inkmanufacturer']->caption->setTabCaption('default', 'INK', 'text');
$dbo->cols['mc_inkcommercialname']->caption->set('default', 'Commercial name', 'text');
$dbo->cols['mc_inktype']->caption->set('default', 'Type', 'text');
$dbo->cols['mc_inktypeother']->caption->set('default', 'Type other', 'text');
$dbo->cols['mc_inkviscosity']->caption->set('default', 'Viscosity', 'text');
$dbo->cols['mc_inkvicosityother']->caption->set('default', 'Viscosity other', 'text');
$dbo->cols['mc_inkprintingunit_1']->caption->set('default', 'Printing Unit', 'text');
$dbo->cols['mc_inkprintingunit_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkprintingunit_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkprintingunit_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkprintingunit_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkvisocity_1']->caption->set('default', 'Viscosity (secs)', 'text');
$dbo->cols['mc_inkvisocity_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkvisocity_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkvisocity_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkvisocity_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkph_1']->caption->set('default', 'pH', 'text');
$dbo->cols['mc_inkph_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkph_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkph_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkph_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkdensity_1']->caption->set('default', 'Density', 'text');
$dbo->cols['mc_inkdensity_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkdensity_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkdensity_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_inkdensity_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_platemanufacturer']->caption->set('default', 'Manufacturer', 'text');
$dbo->cols['mc_platemanufacturer']->caption->setTabCaption('default', 'PLATES', 'text');
$dbo->cols['mc_platecommercialname']->caption->set('default', 'Commercial name', 'text');
$dbo->cols['mc_platetype']->caption->set('default', 'Type', 'text');
$dbo->cols['mc_platedurometer']->caption->set('default', 'Durometer', 'text');
$dbo->cols['mc_platedurometer']->caption->setSectionCaption('default', 'Characteristics', 'text');
$dbo->cols['mc_platethickness']->caption->set('default', 'Thickness (mm)', 'text');
$dbo->cols['mc_platerelief']->caption->set('default', 'Relief (mm)', 'text');
$dbo->cols['mc_mountingtapemanufacturer']->caption->set('default', 'Manufacturer', 'text');
$dbo->cols['mc_mountingtapemanufacturer']->caption->setTabCaption('default', 'MOUNTING', 'text');
$dbo->cols['mc_mountingtapemanufacturer']->caption->setSectionCaption('default', 'Tape', 'text');
$dbo->cols['mc_mountingtapename']->caption->set('default', 'Commercial name', 'text');
$dbo->cols['mc_mountingtapedensity']->caption->set('default', 'Density', 'text');
$dbo->cols['mc_mountingtapthickness']->caption->set('default', 'Thickness (mm)', 'text');
$dbo->cols['mc_mountingcarrierthickness']->caption->set('default', 'Thickness (mm)', 'text');
$dbo->cols['mc_mountingcarrierthickness']->caption->setSectionCaption('default', 'Carrier', 'text');
$dbo->cols['mc_mountingcushionmanufacturer']->caption->set('default', 'Manufacturer', 'text');
$dbo->cols['mc_mountingcushionmanufacturer']->caption->setSectionCaption('default', 'Cushion', 'text');
$dbo->cols['mc_mountingcushonname']->caption->set('default', 'Commercial name', 'text');
$dbo->cols['mc_mountingdensity']->caption->set('default', 'Density', 'text');
$dbo->cols['mc_mountingcushionthickness']->caption->set('default', 'Thickness (mm)', 'text');
$dbo->cols['mc_cimplevel_1']->caption->set('default', 'Impression level', 'text');
$dbo->cols['mc_cimplevel_1']->caption->setTabCaption('default', 'CYLINDER IMPRESSION', 'text');
$dbo->cols['mc_cimplevel_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimplevel_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimplevel_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimplevel_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimpsubstrate_1']->caption->set('default', 'Plate to substrate (mm)', 'text');
$dbo->cols['mc_cimpsubstrate_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimpsubstrate_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimpsubstrate_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimpsubstrate_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimpanlox_1']->caption->set('default', 'Anlox to plate (mm)', 'text');
$dbo->cols['mc_cimpanlox_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimpanlox_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimpanlox_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_cimpanlox_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxmanufacturer']->caption->set('default', 'Manufacturer', 'text');
$dbo->cols['mc_aniloxmanufacturer']->caption->setTabCaption('default', 'ANILOX/DOCTOR', 'text');
$dbo->cols['mc_aniloxtype']->caption->set('default', 'Anilox type', 'text');
$dbo->cols['mc_aniloxengravingangle']->caption->set('default', 'Engraving angle', 'text');
$dbo->cols['mc_aniloxinking']->caption->set('default', 'Inking Device', 'text');
$dbo->cols['mc_aniloxprintingunit_1']->caption->set('default', 'Printing Unit', 'text');
$dbo->cols['mc_aniloxprintingunit_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxprintingunit_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxprintingunit_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxprintingunit_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxmanufacturer_1']->caption->set('default', 'Manufacturer', 'text');
$dbo->cols['mc_aniloxmanufacturer_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxmanufacturer_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxmanufacturer_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxmanufacturer_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxtype_1']->caption->set('default', 'Anilox Type', 'text');
$dbo->cols['mc_aniloxtype_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxtype_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxtype_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxtype_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxengravingangle_1']->caption->set('default', 'Engraving Angle', 'text');
$dbo->cols['mc_aniloxengravingangle_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxengravingangle_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxengravingangle_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxengravingangle_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxinking_1']->caption->set('default', 'Inking device', 'text');
$dbo->cols['mc_aniloxinking_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxinking_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxinking_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxinking_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxcellcount_1']->caption->set('default', 'Cell count (cpi)', 'text');
$dbo->cols['mc_aniloxcellcount_1']->caption->setSectionCaption('default', 'Ink delivery', 'text');
$dbo->cols['mc_aniloxcellcount_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxcellcount_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxcellcount_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxcellcount_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxvolumn_1']->caption->set('default', 'Volume (bcm)', 'text');
$dbo->cols['mc_aniloxvolumn_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxvolumn_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxvolumn_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxvolumn_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxdoration_1']->caption->set('default', 'D/O Ration', 'text');
$dbo->cols['mc_aniloxdoration_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxdoration_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxdoration_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxdoration_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxdoctoring_1']->caption->set('default', 'Doctoring', 'text');
$dbo->cols['mc_aniloxdoctoring_1']->caption->setSectionCaption('default', 'Blade material', 'text');
$dbo->cols['mc_aniloxdoctoring_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxdoctoring_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxdoctoring_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxdoctoring_5']->caption->set('default', ' ', 'text');
$dbo->cols['mc_substratemanufacturer']->caption->set('default', 'Manufacturer', 'text');
$dbo->cols['mc_substratemanufacturer']->caption->setTabCaption('default', 'SUBSTRATE', 'text');
$dbo->cols['mc_substratename']->caption->set('default', 'Commercial name', 'text');
$dbo->cols['mc_substratetype']->caption->set('default', 'Type', 'text');
$dbo->cols['mc_substratedyna']->caption->set('default', 'Dyna/cm<sup>2</sup>', 'text');
$dbo->cols['mc_substratedyna']->caption->setSectionCaption('default', 'Characteristics', 'text');
$dbo->cols['mc_substrateweight']->caption->set('default', 'Weight (gsm)', 'text');
$dbo->cols['mc_substrateflute']->caption->set('default', 'Flute (A,B,C etc)', 'text');
$dbo->cols['mc_substratethickness']->caption->set('default', 'Thickness (mm)', 'text');
$dbo->cols['mc_aniloxcontainment_1']->caption->set('default', 'Containment', 'text');
$dbo->cols['mc_aniloxcontainment_2']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxcontainment_3']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxcontainment_4']->caption->set('default', ' ', 'text');
$dbo->cols['mc_aniloxcontainment_5']->caption->set('default', ' ', 'text');

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
$dbo->text->detailCancel = 'Back';
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