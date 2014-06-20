<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'locale_setup.conf.php');

function genTZOption() {
	$zones = timezone_identifiers_list();
	foreach ($zones as $z) {
		$zone = explode('/', $z); // 0 => Continent, 1 => City
		// Only use "friendly" continent names
		if ($zone[0] == 'Africa' || $zone[0] == 'America' || $zone[0] == 'Antarctica' || $zone[0] == 'Arctic' || $zone[0] == 'Asia' || $zone[0] == 'Atlantic' || $zone[0] == 'Australia' || $zone[0] == 'Europe' || $zone[0] == 'Indian' || $zone[0] == 'Pacific'){
			if (isset($zone[1]) != '') {
				//$locations[$zone[0]][$zone[0]. '/' . $zone[1]] = str_replace('_', ' ', $zone[1]); // Creates array(DateTimeZone => 'Friendly name')
				$locations[] = array(
					$z, str_replace('_', ' ', $zone[1]), $zone[0]
				);
			} 
		}
	}
	return $locations;
}

# customization
function dbo_locale_setup_customize(&$dbo){
	autoDetailTableInput($dbo);
	$dbo->editModifier = 'locale_setup_custom_edit';
	$dbo->newModifier = 'locale_setup_custom_new';
}

var_dump(preg_match('/^([01]?[0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?$/', '23:25'));
var_dump(preg_match('/^([01]?[0-9]|2[0-3]):[0-5][0-9]$/', '23:25'));

function locale_setup_custom_edit($table, $cols, $wheres) {
	pr($_POST);

}


# final rendering
$dbo->render();
?>