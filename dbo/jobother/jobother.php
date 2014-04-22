<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'jobother.conf.php');

# customization
function dbo_jobother_customize(&$dbo){
}


# final rendering
$dbo->render();
?>