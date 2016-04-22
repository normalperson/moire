<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'cartontypesetup.conf.php');

# customization
function dbo_cartontypesetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>