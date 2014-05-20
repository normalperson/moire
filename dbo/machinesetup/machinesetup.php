<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'machinesetup.conf.php');

# customization
function dbo_machinesetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>