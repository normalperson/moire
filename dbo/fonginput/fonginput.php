<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'fonginput.conf.php');

# customization
function fonginput_customize(&$dbo){
}

# final rendering
$dbo->render();

// pr($_POST);
// foreach($dbo->colEdit as $col){
	// echo '<hr />'.$col.'<br />';
	// $ret = $dbo->genInput($col, 'new');
	// echo '<pre>';
	// echo ($ret);
	// echo htmlentities($ret);
	// echo '</pre>';
// }
?>