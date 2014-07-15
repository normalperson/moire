<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'mregionsetup.conf.php');

# customization
function dbo_mregionsetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>