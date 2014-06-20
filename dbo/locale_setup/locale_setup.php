<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'locale_setup.conf.php');

function genTZOption() {
	$zones = timezone_identifiers_list();
	foreach ($zones as $z) {
		$zone = explode('/', $z); // 0 => Continent, 1 => City
		// Only use "friendly" continent names
		if ($zone[0] == 'Africa' || $zone[0] == 'America' || $zone[0] == 'Antarctica' || $zone[0] == 'Arctic' || $zone[0] == 'Asia' || $zone[0] == 'Atlantic' || $zone[0] == 'Australia' || $zone[0] == 'Europe' || $zone[0] == 'Indian' || $zone[0] == 'Pacific'){
			if (isset($zone[1]) != '') {
				$locations[] = array(
					$z, str_replace('_', ' ', $zone[1]), $zone[0]
				);
			} 
		}
	}
	return $locations;
}

function getDefaultLang() {
	global $LANG; 	return $LANG;
}

function getDefaultTZ() {
	return date_default_timezone_get();
}

# customization
function dbo_locale_setup_customize(&$dbo){
	autoDetailTableInput($dbo);
	$dbo->editModifier = 'locale_setup_custom_edit';
	$dbo->newModifier = 'locale_setup_custom_new';
	$dbo->deleteModifier = 'dbo_locale_setup_custom_delete';
}

function dbo_locale_setup_custom_delete($table, $wheres){
	global $DB;
	$ret = array();
	$ok = $DB->doDelete($table, $wheres);
	if(!$ok){
		$ret[] = $DB->lastError;
	}
	else {
		$ok = $DB->doDelete('fclocaleholiday', array('lch_lccode'=>$wheres['lc_code']));
		$ok = $DB->doDelete('fclocaleworkinghour', array('lcw_lccode'=>$wheres['lc_code']));
	}
	return $ret;
}

function locale_setup_custom_new($table, $cols) {
	if (!empty($_POST['detail']['lcw_lccode']['data'])) {
		foreach ($_POST['detail']['lcw_lccode']['data'] as $d) {
			if (!preg_match('/^([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?$/' ,$d['lcw_start_time'])) 
				return array('Please enter the correct time format HH24:MM');
			if (!preg_match('/^([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?$/' ,$d['lcw_end_time'])) 
				return array('Please enter the correct time format HH24:MM');
		}
	}
	return autoDetailCustomNew($table, $cols);
}


function locale_setup_custom_edit($table, $cols, $wheres) {
	if (!empty($_POST['detail']['lcw_lccode']['data'])) {
		foreach ($_POST['detail']['lcw_lccode']['data'] as $d) {
			if (!preg_match('/^([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?$/' ,$d['lcw_start_time'])) 
				return array('Please enter the correct time format HH24:MM');
			if (!preg_match('/^([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?$/' ,$d['lcw_end_time'])) 
				return array('Please enter the correct time format HH24:MM');
		}
	}
	return autoDetailCustomEdit($table, $cols, $wheres);
}


# final rendering
$dbo->render();
?>