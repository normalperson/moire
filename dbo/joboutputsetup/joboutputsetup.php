<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'joboutputsetup.conf.php');

# customization
function dbo_joboutputsetup_customize(&$dbo){
}


# final rendering
$dbo->render();
?>