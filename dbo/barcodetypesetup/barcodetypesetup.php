<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'barcodetypesetup.conf.php');

# customization
function dbo_barcodetypesetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>