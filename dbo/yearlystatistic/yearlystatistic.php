<?php
require(dirname(__FILE__).DIRECTORY_SEPARATOR.'yearlystatistic.conf.php');

# customization
function dbo_yearlystatistic_customize(&$dbo){
}


# final rendering
$dbo->render();
?>